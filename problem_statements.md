## 🔹 SECTION A — Account & Subscription Analysis

1. **Total number of customer accounts**  
   How many total accounts have signed up on the platform?

2. **Total active (non-churned) accounts**  
   How many accounts are currently active (never churned or not yet churned)?

3. **Monthly account signups**  
   How many new accounts signed up each month?

4. **Monthly active subscriptions**  
   For each month, how many subscriptions were active?  
   (A subscription is active if `start_date <= month` AND (`end_date IS NULL` OR `end_date > month`))

5. **Accounts with multiple subscriptions**  
   Which accounts have had more than one subscription over time?

6. **Month-over-month subscription growth rate**  
   What is the month-over-month growth rate of active subscriptions?

## 🔹 SECTION B — Revenue Metrics (Core Business Value)

7. **Monthly Recurring Revenue (MRR)**  
   What is the total Monthly Recurring Revenue (MRR) for each month?  
   (Use `subscriptions.mrr_amount`)

8. **Average Revenue Per Account (ARPA)**  
   What is the average monthly revenue per active account?

9. **Revenue by plan tier**  
   How much revenue does each plan tier (Basic, Pro, Enterprise) generate?

10. **Month-over-month revenue growth**  
    What is the month-over-month growth rate of MRR?

11. **Top 20% revenue-contributing accounts**  
    Which top 20% of accounts contribute the highest share of total revenue?  
    (Use window functions and cumulative revenue)

## 🔹 SECTION C — Churn & Retention (Interview Gold)

12. **Monthly churned accounts**  
    How many accounts churned in each month?  
    (Use `churn_events.churn_date`)

13. **Monthly churn rate**  
    What is the monthly churn rate?  
    (Churned accounts ÷ active accounts at the start of the month)

14. **Average subscription duration**  
    What is the average duration (in days) of a subscription?

15. **Retention by signup month (cohort analysis)**  
    For each signup-month cohort, how many accounts remain active over time?  
    (Use `accounts.signup_date` and churn data)

16. **Plan tiers with highest churn**  
    Which plan tiers have the highest churn rate?

## 🔹 SECTION D — Plan Performance

17. **Most popular plan tier**  
    Which plan tier has the highest number of subscriptions?

18. **Highest lifetime revenue by plan tier**  
    Which plan tier generates the highest total ARR?

19. **Upgrade vs downgrade behavior**  
    How many subscriptions experienced upgrades versus downgrades?  
    (Use `upgrade_flag` and `downgrade_flag`)

20. **Cancellation rate by plan tier**  
    What percentage of subscriptions are cancelled for each plan tier?

## 🔹 SECTION E — Feature Usage & Support (Differentiator)

21. **Most used product features**  
    Which features are used most frequently across all subscriptions?

22. **Beta feature adoption**  
    How does usage of beta features compare to non-beta features?

23. **Feature usage vs churn**  
    Do churned accounts show lower feature usage compared to retained accounts?

24. **Support tickets by priority**  
    How many support tickets exist by priority level?

25. **Support resolution performance**  
    What is the average resolution time and satisfaction score by ticket priority?

26. **Support impact on churn**  
    Do accounts with escalated or high-priority tickets churn more frequently?
