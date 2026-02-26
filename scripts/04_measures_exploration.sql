-- ======================================================
-- Measures Exploration 
-- Purpose: Calculate key metric of the business.
-- Formula: Aggregate [Measure] (e.g., SUM(sales)).
-- =======================================================

-- Find Total Sales.
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

-- How many items are sold?
SELECT SUM(quantity) AS total_items_sold
FROM gold.fact_sales;

-- Average selling price.
SELECT AVG(price) AS avg_price
FROM gold.fact_sales;

-- Total number of Orders.
SELECT COUNT(DISTINCT order_number) AS total_orders  -- --> not counting dublicate
FROM gold.fact_sales;

-- Total number of Products.
SELECT COUNT(DISTINCT product_name) AS total_products
FROM gold.dim_products;

-- Total number of Customers.
SELECT COUNT(customer_key) AS total_customers
FROM gold.dim_customers;

-- Total number of Customers that has placed an order.
SELECT COUNT(DISTINCT customer_key) AS total_customers
FROM gold.fact_sales;

-- ====================================================================
-- Generate a Report that shows all key metrics of the business
-- ====================================================================

SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity' AS measure_name, SUM(quantity) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Average Price' AS measure_name, AVG(price) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Orders' AS measure_name, COUNT(DISTINCT order_number) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Products' AS measure_name, COUNT(product_name) AS measure_value FROM gold.dim_products
UNION ALL
SELECT 'Total Nr. Customers' AS measure_name, COUNT(customer_key) AS measure_value FROM gold.dim_customers;
