-- CREATE VIEW --
CREATE VIEW vw_raw_customers AS

SELECT
    CustomerID,
    Gender,
    SeniorCitizen,
    Partner,
    Dependents,
    tenure,
    Contract,
    PaymentMethod,
    MonthlyCharges,
    TotalCharges,
    churn ,
    Churn_Flag
FROM raw_customers;


SELECT COUNT(*) AS total_customers
FROM vw_raw_customers;