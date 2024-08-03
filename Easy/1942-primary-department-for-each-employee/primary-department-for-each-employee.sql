SELECT employee_id,department_id FROM Employee WHERE primary_flag='Y'
    UNION
SELECT e.employee_id,department_id FROM Employee e INNER JOIN 
    (
        SELECT employee_id FROM Employee GROUP BY employee_id 
        HAVING COUNT(department_id)=1
    ) s ON e.employee_id=s.employee_id

