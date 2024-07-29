--- coalesce will return the first of the values which is not null -----
SELECT p.product_id, COALESCE(round(SUM(price * units *1.0)/SUM(units),2),0) AS average_price
FROM Prices p LEFT OUTER JOIN UnitsSold u ON p.product_id=u.product_id
AND purchase_date BETWEEN start_date AND end_date
GROUP BY p.product_id
