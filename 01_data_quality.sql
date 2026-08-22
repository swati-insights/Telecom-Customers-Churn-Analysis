use telco_churn;
SELECT COUNT(*) AS total_customers
FROM raw_customers;

describe raw_customers;

-- Check duplicate Customer IDs--
Select customerID , count(*) as customer_count
from raw_customers
group by customerID
having count(*) > 1;

-- Check missing Customer IDs--
SELECT COUNT(*) AS missing_customer_id
FROM raw_customers
WHERE CustomerID IS NULL
   OR CustomerID = '';

-- check missing values in important columns--
SELECT
    
    SUM(Contract IS NULL OR Contract = '') AS missing_contract,
    SUM(`MonthlyCharges` IS NULL) AS missing_monthly_charges,
    SUM(`TotalCharges` IS NULL) AS missing_total_charges,
    SUM(`Churn` IS NULL OR `Churn` = '') AS missing_churn
FROM raw_customers;

-- Check Churn values--
SELECT 
    churn ,
    COUNT(*) AS customers
FROM raw_customers
GROUP BY churn ;

-- Check Contract values--
SELECT 
    Contract,
    COUNT(*) AS customers
FROM raw_customers
GROUP BY Contract;

-- Check Payment Method--
SELECT 
    PaymentMethod,
    COUNT(*) AS customers
FROM raw_customers
GROUP BY PaymentMethod;

-- Check numerical values --
SELECT
    MIN(`MonthlyCharges`) AS minimum_charge,
    MAX(`MonthlyCharges`) AS maximum_charge,
    AVG(`MonthlyCharges`) AS average_charge
FROM raw_customers;




