-- ======================================================================
-- Change over time analysis. 
-- Purpose: Ananlyze how measure evolves over time.
-- Formula: Aggregate[mesure] by [date dimension]
-- Focusing in the fact table.
-- ======================================================================

-- Analyze Sales Performance Over Time.
-- By Year:
SELECT 
	  YEAR(order_date) AS order_year,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date) ASC;

-- By Month:
SELECT 
	  MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date) ASC;

-- By Year & Month
SELECT 
	  YEAR(order_date) AS order_year,
	  MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date) ASC;

-- ======================================================================

-- Analyze Sales Performance Over Time: using DATETRUNC function:
-- By Year & Month
SELECT 
  	DATE_FORMAT(order_date, '%Y-%m-01') AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_FORMAT(order_date, '%Y-%m-01')
ORDER BY DATE_FORMAT(order_date, '%Y-%m-01') ASC;

-- == Other Methode ==
SELECT 
	  STR_TO_DATE(DATE_FORMAT(order_date, '%Y-%m-01'),'%Y-%m-%d') AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY STR_TO_DATE(DATE_FORMAT(order_date, '%Y-%m-01'),'%Y-%m-%d')
ORDER BY STR_TO_DATE(DATE_FORMAT(order_date, '%Y-%m-01'),'%Y-%m-%d') ASC;
