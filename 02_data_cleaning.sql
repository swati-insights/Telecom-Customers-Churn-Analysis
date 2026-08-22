CREATE TABLE raw_customers_backup AS
SELECT *
FROM raw_customers;

-- Remove exact duplicate rows--
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CustomerID) AS unique_customers
FROM raw_customers;

-- Check invalid negative charges--
SELECT *
FROM raw_customers
WHERE `MonthlyCharges` < 0
   OR `TotalCharges` < 0;

-- Create a Churn Flag--
ALTER TABLE raw_customers
ADD COLUMN Churn_Flag INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE raw_customers
SET Churn_Flag =
    CASE
        WHEN churn = 'Yes' THEN 1
        WHEN churn = 'No' THEN 0
        ELSE NULL
    END;

SET SQL_SAFE_UPDATES = 1;

SELECT 
    `churn`,
    Churn_Flag,
    COUNT(*) AS customers
FROM raw_customers
GROUP BY `churn`, Churn_Flag;

-- calculated the total_customers , churned_customers and chrun_rate --
SELECT
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM raw_customers;


