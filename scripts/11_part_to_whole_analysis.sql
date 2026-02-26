-- ================================================================================
-- Part_to_whole Analysis (Proportional Analysis).
-- Purpose: How an individual part is performing compared to the overall.
-- Formula: ([Measure] / Total[Measure])*100 by [Dimension].
-- ================================================================================

-- Which categories comtribute the most to the overall sales? 
WITH category_sales AS (
SELECT 
category,
SUM(sales_amount) AS total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
	ON f.product_key = p.product_key
GROUP BY category)
SELECT category,
total_sales,
SUM(total_sales) OVER() AS overall_sales,
CONCAT(ROUND((total_sales / SUM(total_sales) OVER())*100, 2), '%') AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;
