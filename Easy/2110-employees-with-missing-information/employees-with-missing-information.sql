--- Approaches
--1)
-- This operation uses a full outer join on the 2 tables ----
-- as there can be data mutually exclusive data among both tables
-- Time = O(n*log(n))
SELECT COALESCE(e.employee_id,s.employee_id) AS employee_id
 FROM Employees e FULL OUTER JOIN Salaries s 
ON e.employee_id=s.employee_id 
WHERE e.employee_id IS NULL OR s.employee_id IS NULL
ORDER BY employee_id

    
--2)
-- This operation will do the difference and then union among the data     
(SELECT employee_id FROM Employees 
EXCEPT 
SELECT employee_id FROM Salaries)
    UNION
(SELECT employee_id FROM Salaries 
EXCEPT 
SELECT employee_id FROM Employees) 
ORDER BY employee_id
