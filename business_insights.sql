-------------------------------------------------------------------------------------------
-- Total sales for the years 2020, 2021, and overall
-------------------------------------------------------------------------------------------
-- Ensure the Data Type of the order_date column is DATE

UPDATE master_table
SET order_date = 
    CASE 
        WHEN instr(order_date, '/') = 2 AND instr(substr(order_date, instr(order_date, '/') + 1), '/') = 2 
        THEN substr(order_date, -4) || '-0' || substr(order_date, 3, 1) || '-0' || substr(order_date, 1, 1)
        
        WHEN instr(order_date, '/') = 2 AND instr(substr(order_date, instr(order_date, '/') + 1), '/') = 3
        THEN substr(order_date, -4) || '-0' || substr(order_date, 3, 1) || '-' || substr(order_date, 1, 1)
        
        WHEN instr(order_date, '/') = 3 AND instr(substr(order_date, instr(order_date, '/') + 1), '/') = 2
        THEN substr(order_date, -4) || '-' || substr(order_date, 4, 2) || '-0' || substr(order_date, 1, 1)
        
        ELSE substr(order_date, -4) || '-' || substr(order_date, 4, 2) || '-' || substr(order_date, 1, 2)
    END;

-------------------------------------------------------------------------------------------
-- Calculate total sales by year and overall
-------------------------------------------------------------------------------------------
SELECT 
    SUM(CASE WHEN strftime('%Y', order_date) = '2020' THEN total_sales ELSE 0 END) AS total_sales_2020,
    SUM(CASE WHEN strftime('%Y', order_date) = '2021' THEN total_sales ELSE 0 END) AS total_sales_2021,
    SUM(total_sales) AS total_sales_2020_2021
FROM 
    master_table;

-------------------------------------------------------------------------------------------
-- Display total sales by month
-------------------------------------------------------------------------------------------
SELECT 
    strftime('%Y', order_date) AS year, 
    strftime('%m', order_date) AS month, 
    SUM(total_sales) AS total_sales_per_month
FROM 
    master_table
GROUP BY 
    year, month
ORDER BY 
    year, month;

-------------------------------------------------------------------------------------------
-- Display total sales by quarter
-------------------------------------------------------------------------------------------
SELECT 
    strftime('%Y', order_date) AS year,
    CASE 
        WHEN strftime('%m', order_date) IN ('01', '02', '03') THEN 'Q1'
        WHEN strftime('%m', order_date) IN ('04', '05', '06') THEN 'Q2'
        WHEN strftime('%m', order_date) IN ('07', '08', '09') THEN 'Q3'
        WHEN strftime('%m', order_date) IN ('10', '11', '12') THEN 'Q4'
    END AS quarter,
    SUM(total_sales) AS total_sales_per_quarter
FROM 
    master_table
GROUP BY 
    year, quarter
ORDER BY 
    year, quarter;

-------------------------------------------------------------------------------------------
-- Calculate the average price of products by category
-------------------------------------------------------------------------------------------
SELECT 
    pc.category_id,
    pc.category_name, 
    AVG(p.price) AS avg_price
FROM 
    products p
JOIN 
    product_category pc 
ON 
    p.category = pc.category_id
GROUP BY 
    pc.category_id, 
    pc.category_name
ORDER BY 
    avg_price DESC;

-------------------------------------------------------------------------------------------
-- Display total sales by product category
-------------------------------------------------------------------------------------------
SELECT 
    category_name, 
    SUM(total_sales) AS total_sales_per_category
FROM 
    master_table
GROUP BY 
    category_name
ORDER BY 
    total_sales_per_category DESC;

-------------------------------------------------------------------------------------------
-- Calculate total quantity of products by category
-------------------------------------------------------------------------------------------
SELECT 
    category_name, 
    SUM(order_qty) AS total_qty
FROM 
    master_table
GROUP BY 
    category_name;

-------------------------------------------------------------------------------------------
-- Display top 10 total sales and quantity by state
-------------------------------------------------------------------------------------------
SELECT 
    cust_state,
    COUNT(DISTINCT cust_city) AS total_cities,
    SUM(total_sales) AS total_sales
FROM 
    master_table
GROUP BY 
    cust_state
ORDER BY 
    total_sales DESC
LIMIT 10;

-------------------------------------------------------------------------------------------
-- Display top 10 total sales and quantity by city
-------------------------------------------------------------------------------------------
SELECT 
    cust_city, 
    SUM(total_sales) AS total_sales, 
    SUM(order_qty) AS total_quantity
FROM 
    master_table
GROUP BY 
    cust_city
ORDER BY 
    total_sales DESC
LIMIT 10;

-------------------------------------------------------------------------------------------
-- Analyze the relationship between total sales per city and the number of product categories sold
-------------------------------------------------------------------------------------------
SELECT 
    cust_city, 
    category_name, 
    SUM(order_qty) AS total_quantity_sold
FROM 
    master_table
WHERE 
    cust_city IN (
        SELECT 
            cust_city 
        FROM 
            master_table 
        GROUP BY 
            cust_city 
        ORDER BY 
            SUM(total_sales) DESC 
        LIMIT 10
    )
GROUP BY 
    cust_city, 
    category_name
ORDER BY 
    cust_city, 
    total_quantity_sold DESC;
