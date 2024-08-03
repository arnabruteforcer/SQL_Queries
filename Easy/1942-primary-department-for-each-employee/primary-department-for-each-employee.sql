1) Using union query
SELECT employee_id,department_id FROM Employee WHERE primary_flag='Y'
    UNION
SELECT e.employee_id,department_id FROM Employee e INNER JOIN 
    (
        SELECT employee_id FROM Employee GROUP BY employee_id 
        HAVING COUNT(department_id)=1
    ) s ON e.employee_id=s.employee_id


2) Using rank query:
----------IF there is only 1 dept, the highest rank for 'N' will be 1 whereas in case of multiple departments
---------- the highest rank will be for 'Y' which covers both scenarios    
SELECT employee_id,department_id FROM
    (
    SELECT employee_id,department_id,primary_flag,
     RANK() OVER(PARTITION BY employee_id ORDER BY primary_flag DESC) AS rank
     FROM Employee
    ) r WHERE r.rank=1

