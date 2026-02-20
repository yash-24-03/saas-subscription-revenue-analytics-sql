# **Monthly Recurring Revenue (MRR)**
SELECT DATE_FORMAT(start_date, '%Y-%m-%01') as months, SUM(mrr_amount)
FROM ravenstack_subscriptions
GROUP BY months
ORDER BY months;

# **Average Revenue Per Account (ARPA)**
SELECT DATE_FORMAT(start_date, '%Y-%m-%01') as months, ROUND(SUM(mrr_amount)/COUNT(DISTINCT account_id),2) as ARPA
FROM ravenstack_subscriptions
GROUP BY months
ORDER BY months;

# **Revenue by plan tier**
SELECT plan_tier,SUM(mrr_amount) as Revenue
FROM ravenstack_subscriptions
GROUP BY plan_tier;

# **Month-over-month revenue growth**
WITH monthly_revenue as (SELECT DATE_FORMAT(start_date, '%Y-%m-%01') as months, ROUND(SUM(mrr_amount)) as Revenue
                         FROM ravenstack_subscriptions
                         GROUP BY months
                         ORDER BY months)
SELECT curr.months,
       prev.months,
       ROUND((curr.Revenue - prev.Revenue) / prev.Revenue * 100, 2) as revenue_growth
FROM monthly_revenue curr
         LEFT JOIN monthly_revenue prev
                   ON curr.months = DATE_ADD(prev.months, INTERVAL 1 MONTH);

# **Top 20% revenue-contributing accounts**
WITH cte as (SELECT account_id, SUM(mrr_amount) as revenue
             FROM ravenstack_subscriptions
             GROUP BY account_id
             ORDER BY revenue DESC)

SELECT account_id
       FROM
(SELECT account_id,
       revenue,
       SUM(revenue) OVER ()                      as total_revenue,
       SUM(revenue) OVER (ORDER BY revenue DESC) as cummulative_revenue
FROM cte
ORDER BY cummulative_revenue)t
WHERE cummulative_revenue / total_revenue <= 0.20