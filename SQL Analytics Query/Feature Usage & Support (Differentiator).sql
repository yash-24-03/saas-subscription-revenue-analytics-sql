# **Most used product features**
SELECT feature_name, SUM(usage_count) as usage_count
FROM ravenstack_feature_usage
GROUP BY feature_name
ORDER BY usage_count DESC

# **Beta feature adoption**
SELECT
    SUM(CASE WHEN is_beta_feature = 'TRUE' THEN usage_count ELSE 0 END) as Beta_Features_usage,
    SUM(CASE WHEN is_beta_feature = 'FALSE' THEN usage_count ELSE 0 END) as Non_Beta_Features_usage
FROM ravenstack_feature_usage;

# **Support tickets by priority**
SELECT priority,COUNT(ticket_id) as total_tickets
FROM ravenstack_support_tickets
GROUP BY priority;

# **Support resolution performance**
SELECT priority, ROUND(AVG(resolution_time_hours),2) as avg_resolution_time,ROUND(AVG(satisfaction_score),2) as avg_satisfaction_score
FROM ravenstack_support_tickets
GROUP BY priority;

# **Support impact on churn**
SELECT SUM(CASE WHEN high_ticket_churn = 1 THEN 1 ELSE 0 END) AS churn_with_high_tickets,
       SUM(CASE WHEN high_ticket_churn = 0 THEN 1 ELSE 0 END) AS churn_without_high_tickets
FROM (SELECT c.account_id,
             MAX(CASE WHEN s.priority = 'high' OR s.escalation_flag = 'True' THEN 1 ELSE 0 END) as high_ticket_churn
      FROM ravenstack_churn_events c
               LEFT JOIN ravenstack_support_tickets s
                         ON c.account_id = s.account_id
      GROUP BY c.account_id) t