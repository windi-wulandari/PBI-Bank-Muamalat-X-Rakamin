---------------------------------------------------------------------- 
-- TABLE OVERVIEW 
---------------------------------------------------------------------- 

-- Fetching 3 rows from the customers table 
SELECT * 
FROM customers 
LIMIT 3; 

-- Columns and data types from the customers table 
PRAGMA table_info(customers); 

---------------------------------------------------------------------- 

-- Fetching 3 rows from the products table 
SELECT * 
FROM products 
LIMIT 3; 

-- Columns and data types from the products table 
PRAGMA table_info(products); 

---------------------------------------------------------------------- 

-- Fetching 3 rows from the product_category table 
SELECT * 
FROM product_category 
LIMIT 3; 

-- Columns and data types from the product_category table 
PRAGMA table_info(product_category); 

---------------------------------------------------------------------- 

-- Fetching 3 rows from the orders table 
SELECT * 
FROM orders 
LIMIT 3; 

-- Columns and data types from the orders table 
PRAGMA table_info(orders); 

---------------------------------------------------------------------- 
-- Exploratory Data Analysis (EDA) & Pre-Processing 
---------------------------------------------------------------------- 
-- Checked NULL Values 
---------------------------------------------------------------------- 

-- Checking NULL values in the customers table 
SELECT 
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id, 
    SUM(CASE WHEN first_name IS NULL THEN 1 ELSE 0 END) AS null_first_name, 
    SUM(CASE WHEN last_name IS NULL THEN 1 ELSE 0 END) AS null_last_name, 
    SUM(CASE WHEN customer_email IS NULL THEN 1 ELSE 0 END) AS null_customer_email, 
    SUM(CASE WHEN customer_phone IS NULL THEN 1 ELSE 0 END) AS null_customer_phone, 
    SUM(CASE WHEN customer_address IS NULL THEN 1 ELSE 0 END) AS null_customer_address, 
    SUM(CASE WHEN customer_city IS NULL THEN 1 ELSE 0 END) AS null_customer_city, 
    SUM(CASE WHEN customer_state IS NULL THEN 1 ELSE 0 END) AS null_customer_state, 
    SUM(CASE WHEN customer_zip IS NULL THEN 1 ELSE 0 END) AS null_customer_zip 
FROM customers; 

---------------------------------------------------------------------- 
-- Checking NULL values in the products table 

SELECT 
    SUM(CASE WHEN prod_number IS NULL THEN 1 ELSE 0 END) AS null_prod_number, 
    SUM(CASE WHEN prod_name IS NULL THEN 1 ELSE 0 END) AS null_prod_name, 
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS null_category, 
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS null_price 
FROM products; 

---------------------------------------------------------------------- 
-- Checking NULL values in the product_category table 

SELECT 
    SUM(CASE WHEN category_id IS NULL THEN 1 ELSE 0 END) AS null_category_id, 
    SUM(CASE WHEN category_name IS NULL THEN 1 ELSE 0 END) AS null_category_name, 
    SUM(CASE WHEN category_abbrev IS NULL THEN 1 ELSE 0 END) AS null_category_abbreviation 
FROM product_category; 

---------------------------------------------------------------------- 
-- Checking NULL values in the orders table 

SELECT 
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id, 
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS null_order_date, 
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id, 
    SUM(CASE WHEN prod_number IS NULL THEN 1 ELSE 0 END) AS null_prod_number, 
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS null_quantity 
FROM orders; 

---------------------------------------------------------------------- 
-- Checking for duplicates in each table 
---------------------------------------------------------------------- 

-- 1. Customers Table 
SELECT 
    'customers' AS table_name, 
    COUNT(*) - COUNT(DISTINCT customer_id) AS duplicate_count 
FROM customers 

---------------------------------------------------------------------- 

-- 2. Products Table 
SELECT 
    'products' AS table_name, 
    COUNT(*) - COUNT(DISTINCT prod_number) AS duplicate_count 
FROM products 

---------------------------------------------------------------------- 

-- 3. Product Category Table 
SELECT 
    'product_category' AS table_name, 
    COUNT(*) - COUNT(DISTINCT category_id) AS duplicate_count 
FROM product_category 

---------------------------------------------------------------------- 

-- 4. Orders Table 
SELECT 
    'orders' AS table_name, 
    COUNT(*) - COUNT(DISTINCT order_id) AS duplicate_count 
FROM orders; 

---------------------------------------------------------------------- 
-- Changing Data Types 
---------------------------------------------------------------------- 

-- Changing the data type of the order_date column to DATE 
ALTER TABLE orders 
ALTER COLUMN order_date TYPE DATE; 

-- Checking the data type of the order_date column in the orders table 
SELECT 
    column_name, data_type 
FROM 
    pragma_table_info('orders') 
WHERE 
    column_name = 'order_date'; 

---------------------------------------------------------------------- 
-- Creating Master Table 
---------------------------------------------------------------------- 

-- Creating the master_table with correct data types 
CREATE TABLE master_table ( 
    order_date DATE,  -- Defining order_date as DATE 
    category_name TEXT, 
    product_name TEXT, 
    product_price REAL, 
    order_qty INTEGER, 
    total_sales REAL, 
    cust_email TEXT, 
    cust_city TEXT, 
    cust_state TEXT 
); 

-- Inserting data into the master_table using join syntax 
INSERT INTO master_table (order_date, category_name, product_name, product_price, order_qty, total_sales, cust_email, cust_city, cust_state) 
SELECT 
    o.order_date, 
    pc.category_name, 
    p.prod_name, 
    p.price, 
    o.quantity, 
    o.quantity * p.price AS total_sales,  -- Calculating total_sales 
    c.customer_email, 
    c.customer_city, 
    c.customer_state 
FROM 
    customers c 
JOIN 
    orders o ON c.customer_id = o.customer_id 
JOIN 
    products p ON o.prod_number = p.prod_number 
JOIN 
    product_category pc ON p.category = pc.category_id 
ORDER BY 
    o.order_date; 

-- Fetching 3 rows from the master_table 
SELECT * 
FROM master_table 
LIMIT 3; 

