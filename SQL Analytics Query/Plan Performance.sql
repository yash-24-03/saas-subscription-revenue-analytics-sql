# **Most popular plan tier**
SELECT plan_tier, COUNT(account_id) as total_accounts
FROM ravenstack_subscriptions
GROUP BY plan_tier
ORDER BY total_accounts DESC
LIMIT 1;

# **Highest lifetime revenue by plan tier**
SELECT plan_tier, SUM(arr_amount) as revenue
FROM ravenstack_subscriptions
GROUP BY plan_tier
ORDER BY revenue desc;

# **Upgrade vs downgrade behavior**
SELECT SUM(CASE WHEN upgrade_flag = 'TRUE' THEN 1 ELSE 0 END) as Upgraded,
       SUM(CASE WHEN downgrade_flag = 'TRUE' THEN 1 ELSE 0 END) as Downgraded
FROM ravenstack_subscriptions;

# **Cancellation rate by plan tier**
SELECT plan_tier,
       CONCAT(ROUND((cancelled_accounts * 100.0) / total_accounts, 2),
              '%') as cancellation_rate
FROM (SELECT plan_tier, COUNT(*) as cancelled_accounts, SUM(COUNT(*)) OVER () as TOTal_ACCOUNTS
      FROM ravenstack_subscriptions
      WHERE end_date is not null
      GROUP BY plan_tier) t
