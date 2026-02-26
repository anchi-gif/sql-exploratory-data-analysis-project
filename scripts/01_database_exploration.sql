-- ====================================================================
-- Exploratory Data Analytics Project
-- Purpose: View the structure of the database 
-- ====================================================================

-- Explore all objects in the Database
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'gold';
-- Other method
SHOW TABLES FROM gold;

-- Explore all the columns in the Database

SELECT
	  table_schema,
    table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'gold'
ORDER BY table_name, ordinal_position;
