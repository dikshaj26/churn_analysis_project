Bank Customer Churn Analysis — SQL and Power BI Project

**Dataset:** 10,000+ Bank Customers
**Purpose:** Analyze customer churn patterns and support targeted retention strategies
**Dashboard:** Power BI visuals covering demographics, churn rates, and key financial metrics

---

## Table Structure

```sql
CREATE TABLE churn ( 
    customer_id INT PRIMARY KEY,
    credit_score INT,
    country VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    tenure INT,
    balance DECIMAL(15,2),
    credit_card VARCHAR(20),         -- Owned / Not Owned
    activity_status VARCHAR(20),     -- Active / Inactive 
    churn_status VARCHAR(20),        -- Churned / Not churned
    products VARCHAR(20),          
    age_group VARCHAR(20),          
    credit_scores_category VARCHAR(20),      
    acc_balance VARCHAR(20)          
);
```
---

## SQL Queries for Analysis
Key SQL queries implemented to analyze churn patterns include:

1. **Total Customers by Churn Status**  
2. **Customer Count by Gender**  
3. **Overall Churn Rate Percentage**  
4. **Total Balance of Churned Customers by Gender**  
5. **Top 10 High-Value Churned Customers by Balance**  
6. **Churn Rate by Activity Status**  
7. **Country-wise Churn Rate Segmented by Gender**  
8. **Top 5 Customers with Highest Credit Score (Without Credit Card)**  
9. **Churn Rate by Age Group**  
10. **Top 3 Customers with Highest Balance in Each Country**  
11. **Countries with Average Tenure Over 5 Years, Ranked by Total Balance**  
12. **Churned Customers with Above Average Credit Score Among Churned**
---

## Insights Summary:

1. "Churned Customers" = bank customers who have left or closed their accounts.
2. Majority customers are active/non-churned but churned customers with high balance cause significant losses.
3. Gender, age group, activity status, and country segmentation enable personalized marketing.
4. High credit score customers without credit cards are prime targets for cross-selling credit products.
5. Re-engaging inactive customers and high-value churned customers can reduce churn.
6. Countries with average tenure > 5 years and high balances reflect strong customer loyalty.
7. Focus retention efforts based on churn rate and customer value metrics to maximize impact.


## Project Highlights

* Efficient data segmentation by gender, country, age, and account activity to identify key churn drivers.
* Identification of high-value churned customers for targeted retention campaigns.
* Analysis of credit score and credit card ownership for cross-selling opportunities.
* Insights into tenure and loyalty across countries to guide strategic decisions.

---

## Data Visualization & Dashboard (Power BI)
The Power BI dashboard offers an interactive and comprehensive overview of customer churn with these key components:
1. **KPI for Total Customers:**
   A clear KPI card displaying the total number of customers, providing an immediate sense of the dataset size.
2. **Churn Rate Gauge:**
   Visualizes the overall churn rate as a percentage, helping quickly assess customer retention status.
3. **Demographic Donut Charts:**
   Show customer distributions by gender, country, activity status, and products owned, highlighting major customer segments.
4. **Slicers for Churn Status:**
   Interactive slicers let users filter the data by churned or non-churned customers for targeted exploration.
5. **Combined Bar & Line Charts:**
   These charts display the number of customers (bars) alongside churn rates (lines) segmented by age groups, account balance categories, 
   and credit score tiers. This dual view helps identify trends and relationships between customer volume and churn within each segment.

---

Powered by SQL & Power BI to deliver actionable insights on customer churn analysis.

For questions, suggestions, or contributions, feel free to open an issue or submit a pull request.

Thank you for exploring this project  🚀
