-- =========================================================================
-- Exploring Dimenson tables
-- Purpose: Identifying the unique values (or categories) in each dimension.
-- Formula: DISTINCT [Dimension]
-- =========================================================================

-- Explore all Countries our customers come from.
SELECT DISTINCT country
FROM gold.dim_customers;

-- Explore all Categories "The major Divisions"
SELECT DISTINCT category, subcategory, product_name
FROM gold.dim_products
ORDER BY 1,2,3;
