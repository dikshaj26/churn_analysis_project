CREATE TABLE churn (
    customer_id INT PRIMARY KEY,
    credit_score INT,
    country VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    tenure INT,
    balance FLOAT,
    credit_card VARCHAR(20),         --Owned/Not Owned
    activity_status VARCHAR(20),     --Active/Inactive 
    churn_status VARCHAR(20),        --Churned/ Not churned
    products VARCHAR(20),          
    age_group VARCHAR(20),          
    credit_scores_category VARCHAR(20),      
    acc_balance VARCHAR(20)          
);

-- Total Churned vs Non-Churned Customers
SELECT 
    churn_status,
    COUNT(*) AS total_customers
FROM churn
GROUP BY churn_status
ORDER BY total_customers DESC;

-- Gender-wise Customer Count
SELECT 
    gender,
    COUNT(*) AS total_customers
FROM churn
GROUP BY gender
ORDER BY total_customers DESC;

-- Overall Churn Rate (%)
SELECT 
    ROUND(
        (SUM(CASE WHEN churn_status = 'Churned' THEN 1 ELSE 0 END) * 100.0) 
        / COUNT(*), 
    2
    ) AS churn_rate_percentage
FROM churn;

-- Total Balance of Churned Customers by Gender
SELECT
    gender,
    SUM(balance) AS total_balance
FROM churn
WHERE churn_status = 'Churned'
GROUP BY gender;

-- Hight value churned customers
SELECT 
    customer_id, 
    balance, 
    country, 
    gender
FROM churn
WHERE churn_status = 'Churned'
ORDER BY balance DESC
LIMIT 10;

--  Churn Rate by Activity Status
SELECT 
    activity_status,
    ROUND(
        (SUM(CASE WHEN churn_status = 'Churned' THEN 1 ELSE 0 END) * 100.0) 
        / COUNT(*), 
    2
    ) AS churn_rate
FROM churn
GROUP BY activity_status;

--  Country-wise Churn Rate Segmented by Gender
SELECT 
    country, 
    gender,
    ROUND(
        100.0 * SUM(CASE WHEN churn_status = 'Churned' THEN 1 ELSE 0 END) 
        / COUNT(*), 
    2
    ) AS churn_rate
FROM churn
GROUP BY country, gender
ORDER BY churn_rate DESC;

-- Top 5 Customers with Highest Credit Score (Without Credit Card)
SELECT 
    customer_id,
    credit_score
FROM churn
WHERE credit_card = 'Not Owned'
ORDER BY credit_score DESC
LIMIT 5;

--Age-group wise churn rate
SELECT 
    age_group,
    ROUND(
        100.0 * SUM(CASE WHEN churn_status = 'Churned' THEN 1 ELSE 0 END) / COUNT(*),
    2) AS churn_rate
FROM churn
GROUP BY age_group
ORDER BY churn_rate DESC;

--  Top 3 Customers with Highest Balance in Each Country (CTE + RANK)
WITH ranked_customers AS (
    SELECT 
        customer_id,
        balance, 
        country,
        RANK() OVER(PARTITION BY country ORDER BY balance DESC) AS rnk
    FROM churn
)
SELECT * 
FROM ranked_customers
WHERE rnk <= 3;

-- Countries with Avg Tenure > 5 Years (Ranked by Total Balance)
SELECT 
    country, 
    SUM(balance) AS total_balance,
    RANK() OVER (ORDER BY SUM(balance) DESC) AS balance_rank
FROM churn
GROUP BY country
HAVING AVG(tenure) > 5;

-- Churned Customers with Credit Score Above Average Churned Credit Score
SELECT 
    customer_id, 
    credit_score,
    (
        SELECT AVG(credit_score)
        FROM churn
        WHERE churn_status = 'Churned'
    ) AS avg_churned_credit_score
FROM churn
WHERE churn_status = 'Churned'
  AND credit_score > (
      SELECT AVG(credit_score)
      FROM churn
      WHERE churn_status = 'Churned'
  );



