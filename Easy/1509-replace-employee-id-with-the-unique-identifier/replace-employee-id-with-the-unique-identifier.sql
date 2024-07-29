-- Write your PostgreSQL query statement below
-- classic case of left outer join

SELECT unique_id,name FROM Employees e LEFT OUTER JOIN EmployeeUNI eu
ON e.id=eu.id


