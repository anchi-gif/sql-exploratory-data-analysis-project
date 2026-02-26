-- ==================================================================================
-- Cumulative Analysis.
-- Purpose: To understand how business is progressing over time (growing or declining).
-- Formula: Aggregate [Cumulative Measure] By [Date Dimension].
-- Focusing in the fact table.
-- ==================================================================================

-- Calculate the total sales per month and the running total of sales over time.
-- By Month.
SELECT
order_date,
total_sales,
SUM(total_sales) OVER(PARTITION BY order_date ORDER BY order_date) AS running_total_sales  -- Window function
FROM(
SELECT 
	  STR_TO_DATE(DATE_FORMAT(order_date, '%Y-%m-01'),'%Y-%m-%d') as order_date,
    SUM(sales_amount) AS total_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY STR_TO_DATE(DATE_FORMAT(order_date, '%Y-%m-01'),'%Y-%m-%d')
) t ;

-- By Year.
SELECT
order_date,
total_sales,
SUM(total_sales) OVER(ORDER BY order_date) AS running_total_sales,  -- Window function
AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM(
SELECT 
  	STR_TO_DATE(DATE_FORMAT(order_date, '%Y-01-01'),'%Y-%m-%d') as order_date,
    SUM(sales_amount) AS total_sales,
    AVG(price) AS avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY STR_TO_DATE(DATE_FORMAT(order_date, '%Y-01-01'),'%Y-%m-%d')
) t ;
