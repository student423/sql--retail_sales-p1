--Q.1 write a sql query to find averg age of customer who purchased items from the beauty category

SELECT ROUND(AVG(age),2)AS avg_age
FROM retail_sales
WHERE category='Beauty';

--Q.2write a sql query to find all transaction where the total sales is greater than 1000

SELECT * FROM retail_sales
WHERE total_sale >1000;

--Q.3  write a sql query to find the total number of transaction(id) made by each gender in each category

SELECT category,gender,COUNT(*) AS total_tran
FROM retail_sales
GROUP BY category,gender
ORDER BY category ASC; 

--Q.4 write a sql query to find avg sales for each month 

SELECT
EXTRACT(YEAR FROM sale_date) AS year,
EXTRACT(MONTH FROM sale_date) AS month,
AVG(total_sale) AS total_sales
FROM retail_sales
GROUP BY year,month
ORDER BY year,total_sales DESC; 

--Q.5  write a sql query to find the TOP 5 customer based on the highest total sales

SELECT customer_id,SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

--Q.6  write a sql query to find the number of unique customer who purchased items from each category

SELECT category,COUNT(DISTINCT customer_id) AS unique_id
FROM retail_sales
GROUP BY category;

-- Q.7  write a sql query to create each shift and number of orders(eg morning>12,afternoon between 12 &17 and evening>17)
WITH hourly_sales
AS
(
SELECT *,
       CASE
	       WHEN EXTRACT(HOUR FROM sale_time)< 12 THEN 'Morning'
		   WHEN EXTRACT (HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		   ELSE 'Evening'
		   END AS shift
		   FROM retail_sales
)
SELECT shift,
COUNT(*) AS total_order
FROM hourly_sales
GROUP BY shift;
--End of Project 
--Thank you--
