-- ================================================================
-- 2.Exploring date dimension.
-- Purpose: Identifying the earliest and latest dates (boundaries).
-- Formula: MIN/MAX [Date Dimension]
-- ================================================================
 -- Find the date of the first and last order.
SELECT 
	  MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM gold.fact_sales;

 -- How many years of sales are available?  --> revoir : teacher: 4years and 37 months
SELECT 
	  MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    TIMESTAMPDIFF(YEAR,MIN(order_date), MAX(order_date)) AS order_range_years,
    TIMESTAMPDIFF(MONTH,MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales;

-- Finding the youngest and oldest customers
SELECT 
	  MIN(birthdate) AS oldest_customer,
    TIMESTAMPDIFF(YEAR, MIN(birthdate), CURDATE()) AS oldest_age, 
    MAX(birthdate) AS youngest_customer,
    TIMESTAMPDIFF(YEAR, MAX(birthdate), CURDATE()) AS youngest_age
FROM gold.dim_customers;
