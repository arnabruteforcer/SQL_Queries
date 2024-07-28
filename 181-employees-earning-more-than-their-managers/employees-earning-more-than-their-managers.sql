-- Write your PostgreSQL query statement below
SELECT e.name AS Employee FROM Employee e WHERE 
e.salary>( SELECT salary FROM Employee e2 WHERE e2.id=e.managerId )