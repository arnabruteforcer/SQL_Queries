SELECT name AS NAME, SUM(amount) AS BALANCE FROM Users u INNER JOIN Transactions t ON
u.account=t.account GROUP BY name HAVING SUM(amount)>10000