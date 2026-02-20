# 📊 SaaS Subscription & Revenue Analytics (SQL)

## 📌 Project Overview

This project analyzes a subscription-based SaaS business using the **Ravenstack Synthetic SaaS Dataset**. The goal is to evaluate subscription growth, recurring revenue performance, churn behavior, plan profitability, and operational impact using SQL.

The analysis simulates real-world SaaS business intelligence scenarios commonly used in data analyst and business analyst roles.

---

## 🗂 Dataset Information

The project uses the **Ravenstack Synthetic SaaS Dataset**, a relational dataset designed to simulate a subscription-based software company.

The dataset includes the following key tables:

- `accounts` – customer account information and signup dates  
- `subscriptions` – plan details, start/end dates, MRR values  
- `churn_events` – churn tracking with churn dates  
- `plan_tiers` – Basic, Pro, Enterprise plans  
- `feature_usage` – product feature engagement data  
- `support_tickets` – customer support interactions and resolution metrics  

The relational structure allows for lifecycle tracking, revenue modeling, churn measurement, and feature-impact analysis.

---

## 🎯 Analytical Focus Areas

This project focuses on:

- Subscription lifecycle analysis  
- Monthly Recurring Revenue (MRR) tracking  
- Average Revenue Per Account (ARPA)  
- Cohort-based retention analysis  
- Churn rate measurement  
- Plan tier profitability  
- Revenue concentration (Pareto analysis)  
- Feature usage impact on churn  
- Support ticket impact on customer retention  

Detailed business questions are documented separately in `business_questions.md`.

---

## 🛠 Technical Approach

- Multi-table SQL joins  
- Date-based subscription lifecycle tracking  
- Window functions for ranking and revenue distribution  
- Conditional aggregation for churn impact analysis  
- Cohort logic using signup month grouping  
- KPI calculations for SaaS performance metrics  

---

## 📈 Key Insights

- Revenue concentration follows a Pareto distribution pattern, with a small percentage of accounts contributing a large share of total revenue.  
- Certain plan tiers demonstrate significantly higher churn rates.  
- Cohort retention declines progressively over subscription lifecycle stages.  
- High-priority support tickets show correlation with increased churn probability.  
- Feature adoption patterns influence customer retention behavior.  

---

## 💼 Business Relevance

This project demonstrates practical SQL applications for:

- Monitoring subscription growth  
- Measuring recurring revenue trends  
- Identifying churn drivers  
- Evaluating plan performance  
- Understanding operational impact on retention  

---

## 🚀 Future Enhancements

- Build a SaaS performance dashboard in Power BI  
- Implement predictive churn modeling  
- Perform Customer Lifetime Value (LTV) analysis  
