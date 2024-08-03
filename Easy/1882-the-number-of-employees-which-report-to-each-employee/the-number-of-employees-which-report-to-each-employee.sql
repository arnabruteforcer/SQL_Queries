SELECT m.employee_id,m.name,COUNT(r.employee_id) AS reports_count, 
round(AVG(r.age)) AS average_age FROM
Employees m INNER JOIN Employees r ON m.employee_id=r.reports_to
GROUP BY m.employee_id,m.name ORDER BY m.employee_id