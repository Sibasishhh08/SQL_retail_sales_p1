-- SQL Retail Sales Analysis
CREATE DATABASE sql_project_p2;


SELECT * FROM retail_sales
LIMIT 10

SELECT 
count(*)
FROM retail_sales

-- 

SELECT * FROM retail_sales
WHERE
    transactions_id IS NULL 
	OR
	 sale_date IS NULL
	OR
	 sale_time IS NULL
	OR
    customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	 category IS NULL
	OR
	 quantiy IS NULL
	OR
	 price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL


DELETE FROM retail_sales
WHERE
    transactions_id IS NULL 
	OR
	 sale_date IS NULL
	OR
	 sale_time IS NULL
	OR
    customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	 category IS NULL
	OR
	 quantiy IS NULL
	OR
	 price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL

--DATA EXPLORATION
--SALES

SELECT COUNT(*) AS total_sales FROM retail_sales

-- how many UNIQUE customers are there?

--  SELECT COUNT ( DISTINCT customer_id) AS total_customer FROM retail_sales

-- DISTINCT CATEGORY

SELECT DISTINCT category  FROM retail_sales

--1- SQL query to retrieve all columns for sales made on '2022-11-05'

SELECT * FROM retail_sales 
WHERE sale_date = '2022-11-05'

-- 2- SQL query to retrieve all transactions where the category is 'clothing' and quantity sold is more than 4 in the month of Nov-2022

SELECT
*
FROM retail_sales
WHERE 
    category = 'Clothing'
	AND TO_CHAR(sale_date, 'YYYY-MM') ='2022-11'
	AND
	quantiy >=4

--3-SQL QUERY TO COUNT TOTAL NUMBER OF SALES FOR EACH CATEGORY

SELECT
      category,
	  SUM(total_sale) as net_sale,
	  COUNT (*) AS total_orders
	 
FROM retail_sales
GROUP BY 1

-- 4-SQL QUERY TO FIND AVG AGE OF CUSTOMERS WHO PURCHASED ITEMS FROM THE BEAUTY CATEGORY

SELECT
     ROUND(AVG(age),2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty'

-- 5-SQL QUERY TO FIND ALL TRANSACTION WHERE TOTAL SALE IS GREATER THAN 1000

SELECT * FROM retail_sales
WHERE total_sale > 1000

-- 6-SQL QUERY TO FIND OUT NUMBER OF TRANSACTIONS(TRANSACTION_ID) MADE BY EACH GENDER IN EACH CATEGORY

SELECT 
      category,
	  gender,
COUNT(*) AS total_transaction
FROM retail_sales
GROUP BY 
       category,
	   gender
ORDER BY 1	   

--7- SQL QUERY TO CALCCULATE AVG SALE OF EACH MONTH.FIND OUT BEST SELING MONTH IN EACH YEAR

SELECT 
       year,
       month,
	   avg_sale
FROM			
(
SELECT
      EXTRACT(YEAR FROM sale_date) as year,
	  EXTRACT(MONTH FROM sale_date) as month,
	  AVG(total_sale) as avg_sale,
	  RANK()OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale)DESC) AS rank
FROM retail_sales
GROUP BY 1,2
) 
WHERE rank = 1
-- ORDER BY 1,3 DESC

-- 8- SQL QUERY TO FIND THE TOP 5 CUSTOMERS BASED ON THE HIGHEST TOAL SALES

SELECT 
      customer_id,
	  SUM(total_sale) AS total_sales
FROM  retail_sales	 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- 9-SQL QUERY TO FIND NUMBER OF UNIQUE CUSTOMERS WHO PURCHASED ITEMS FROM EACH CATEGORY

SELECT 
	  category,
	  COUNT(DISTINCT customer_id) AS unique_customer	 	 
FROM retail_sales	 
GROUP BY category

-- 10-SQL QUERY TO CREATE EACH SHIFT AND NUMBER OF ORDERS (EXAMPLE MORNING < 12, AFTERNOON BETWEEN 12 & 17, EVENING > 17)
WITH hourly_sale
AS
(
SELECT  *,
      CASE 
	      WHEN EXTRACT (HOUR FROM sale_time) < 12 THEN 'morning'
		  WHEN EXTRACT (HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'afternoon'
		  ELSE 'evening'
		  END as shift

FROM retail_sales 
)
SELECT 
     shift,
     COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift







		



        






	





































	


	
	




