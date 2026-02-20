# **Total number of customer accounts**
SELECT count(distinct account_id) as total_no_of_customers
FROM ravenstack_accounts;

# **Total active (non-churned) accounts**
SELECT count(*) as active_accounts
FROM ravenstack_accounts
WHERE churn_flag = "False";

# **Monthly account signups**
Select DATE_FORMAT(signup_date,'%Y-%m-01') as months,count(account_id) as sign_ups
from ravenstack_accounts
GROUP BY months
ORDER BY months;

# **Monthly active subscriptions**
SELECT DATE_FORMAT(start_date,'%y-%m-01') as months, count(subscription_id) as active_subscriptions
FROM ravenstack_subscriptions
WHERE end_date is null OR date_format(end_date,'%y-%m-01') > DATE_FORMAT(start_date,'%y-%m-01')
GROUP BY months
ORDER BY months;

# **Accounts with multiple subscriptions**
SELECT account_id
FROM
(SELECT account_id, count(*) as c
FROM ravenstack_subscriptions
GROUP BY account_id)t
WHERE c > 1;

# **Month-over-month subscription growth rate**
WITH monthly_subscriptions as (SELECT DATE_FORMAT(start_date, '%Y-%m-01') as months,
                                      count(subscription_id)              as active_subscriptions
                               FROM ravenstack_subscriptions
                               WHERE end_date is null
                                  OR end_date >= start_date
                               GROUP BY months)
SELECT curr.months,
       ROUND(
               (curr.active_subscriptions - prev.active_subscriptions)
                 / prev.active_subscriptions * 100, 2) AS growth_rate
FROM monthly_subscriptions curr
       LEFT  JOIN monthly_subscriptions prev
              ON curr.months = DATE_ADD(prev.months, INTERVAL 1 MONTH)
ORDER BY curr.months;

# USING LAG
WITH monthly_subscriptions as (SELECT DATE_FORMAT(start_date, '%Y-%m-01') as months,
                                      count(subscription_id)              as active_subscriptions
                               FROM ravenstack_subscriptions
                               WHERE end_date is null
                                  OR end_date >= start_date
                               GROUP BY months)
SELECT months,ROUND(
        (active_subscriptions-prev_subscriptions)
         /prev_subscriptions * 100,2) as growth_rate
FROM
(SELECT months,
       LAG(active_subscriptions) over (order by months) as prev_subscriptions,
       active_subscriptions
FROM monthly_subscriptions)t