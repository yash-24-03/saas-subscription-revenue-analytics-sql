# **Monthly churned accounts**
SELECT DATE_FORMAT(churn_date,'%Y-%m-01') as months,count(*) as churn_accounts
FROM ravenstack_churn_events
GROUP BY months
ORDER BY months;

# **Monthly churn rate**
SELECT DATE_FORMAT(signup_date, '%Y-%m-01')          as months,
       SUM((CASE WHEN churn_flag is TRUE THEN 1 ELSE 0 END))  as churned,
       SUM((CASE WHEN churn_flag is FALSE THEN 1 ELSE 0 END)) as not_churned
FROM ravenstack_accounts
GROUP BY months
ORDER BY months

# **Average subscription duration**
SELECT AVG(DATEDIFF(end_date,start_date)) as Average_Duration
FROM ravenstack_subscriptions
WHERE end_date is not null ;

# **Retention by signup month (cohort analysis)**
WITH RECURSIVE months AS (
    SELECT DATE_FORMAT(MIN(signup_date), '%Y-%m-01') AS month_start
    FROM ravenstack_accounts

    UNION ALL

    SELECT DATE_ADD(month_start, INTERVAL 1 MONTH)
    FROM months
    WHERE month_start < DATE_FORMAT(CURDATE(), '%Y-%m-01')
)
SELECT
    DATE_FORMAT(a.signup_date, '%Y-%m-01') AS signup_month,
    TIMESTAMPDIFF(
        MONTH,
        DATE_FORMAT(a.signup_date, '%Y-%m-01'),
        m.month_start
    ) AS month_number,
    COUNT(DISTINCT a.account_id) AS active_accounts
FROM ravenstack_accounts a
LEFT JOIN ravenstack_churn_events c
    ON a.account_id = c.account_id
JOIN months m
    ON m.month_start >= DATE_FORMAT(a.signup_date, '%Y-%m-01')
WHERE
    c.churn_date IS NULL
    OR m.month_start < DATE_FORMAT(c.churn_date, '%Y-%m-01')
GROUP BY signup_month, month_number
ORDER BY signup_month, month_number;

# **Plan tiers with highest churn**

SELECT plan_tier , count(account_id) as churn_accounts
FROM ravenstack_subscriptions
WHERE churn_flag = 'TRUE'
GROUP BY plan_tier
ORDER BY churn_accounts DESC