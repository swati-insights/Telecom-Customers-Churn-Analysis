-- How many customers do we have, and how many churned?--
SELECT
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    COUNT(*) - SUM(Churn_Flag) AS active_customers
FROM raw_customers;

-- What is the overall churn rate?--
SELECT
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(
        SUM(Churn_Flag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM raw_customers;

-- Which contract type has the highest churn? --
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(
        SUM(Churn_Flag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM raw_customers
GROUP BY Contract
ORDER BY churn_rate DESC;

-- Which payment method has the highest churn? --
SELECT
    `PaymentMethod`,
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(
        SUM(Churn_Flag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM raw_customers
GROUP BY `PaymentMethod`
ORDER BY churn_rate DESC;

-- Does monthly charge affect churn?--
SELECT
    CASE
        WHEN `MonthlyCharges` < 30 THEN 'Low'
        WHEN `MonthlyCharges` < 60 THEN 'Medium'
        WHEN `MonthlyCharges` < 90 THEN 'High'
        ELSE 'Very High'
    END AS charge_group,
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(
        SUM(Churn_Flag) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM raw_customers
GROUP BY charge_group
ORDER BY churn_rate DESC;

-- Which customer segments have high churn?--
SELECT
    CASE
        WHEN `tenure` <= 12 THEN 'New Customer'
        WHEN `tenure` <= 48 THEN 'Existing Customer'
        ELSE 'Loyal Customer'
    END AS customer_segment,
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(
        SUM(Churn_Flag) * 100.0 / COUNT(*),
        2    ) AS churn_rate
FROM raw_customers
GROUP BY customer_segment
ORDER BY churn_rate DESC;

-- Find the top 3 customers in each contract type--
WITH ranked_customers AS (
    SELECT
        CustomerID,
        Contract,
        Churn_Flag,
        ROW_NUMBER() OVER (
            PARTITION BY Contract
            ORDER BY CustomerID DESC
        ) AS customer_rank
        FROM raw_customers
)
SELECT
    CustomerID,
    Contract,
    Churn_Flag,
    customer_rank
FROM ranked_customers
WHERE customer_rank <= 3;

