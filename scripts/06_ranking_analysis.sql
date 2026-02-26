-- =================================================================================================================
-- 6. Ranking Analysis 
-- Purpose: Order values of dimensions by measure. -> Top N performers | Bottom N Performers
-- Formula: Rank [Dimension] by  aggregated [Measure]
-- ==================================================================================================================

-- Which 5 products generate the highest revenue?
SELECT
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- What are the 5 worst-performing products in terms of sales?
SELECT
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC
LIMIT 5;

-- What are the top 5 best subcategories?
SELECT
p.subcategory,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
GROUP BY p.subcategory
ORDER BY total_revenue DESC
LIMIT 5;

-- What are the top 5 worst subcategories?
SELECT
p.subcategory,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
GROUP BY p.subcategory
ORDER BY total_revenue ASC
LIMIT 5;

-- Find the top 10 customers who have generated the highest revenue
SELECT 
c.customer_key,
c.first_name,
c.last_name,
SUM(sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
	ON f.customer_key = c.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_revenue DESC
LIMIT 10;

-- The top 3 customers with the fewest orders placed.
SELECT 
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
	ON c.customer_key = f.customer_key 
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_orders ASC
LIMIT 3;

-- =========== Using Window function ============
-- More flexible & complexe.
-- Which 5 products generate the highest revenue?

SELECT *
FROM(
	SELECT
	p.product_name,
	SUM(f.sales_amount) AS total_revenue,
	ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) DESC) AS rank_products
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
		ON p.product_key = f.product_key
	GROUP BY p.product_name) t
WHERE rank_products <= 5;
