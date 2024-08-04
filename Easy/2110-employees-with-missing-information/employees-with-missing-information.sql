--1)
-- This operation uses a full outer join on the 2 tables ----
-- as there can be data mutually exclusive data among both tables 
SELECT COALESCE(e.employee_id,s.employee_id) AS employee_id
 FROM Employees e FULL OUTER JOIN Salaries s 
ON e.employee_id=s.employee_id 
WHERE e.employee_id IS NULL OR s.employee_id IS NULL
ORDER BY employee_id