-- ON condition is filter before join whereas WHERE condition is the filter after join -------
SELECT customer_id,COUNT(customer_id) AS count_no_trans FROM Visits v LEFT OUTER JOIN
Transactions t ON v.visit_id=t.visit_id WHERE t.transaction_id IS NULL 
GROUP BY customer_id