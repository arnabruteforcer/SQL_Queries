-- Write your PostgreSQL query statement below
SELECT product_name,SUM(unit) AS unit FROM Products p INNER JOIN Orders o 
ON p.product_id=o.product_id WHERE EXTRACT(MONTH FROM order_date)=2 AND
EXTRACT(YEAR FROM order_date)=2020
GROUP BY product_name HAVING SUM(unit)>=100
