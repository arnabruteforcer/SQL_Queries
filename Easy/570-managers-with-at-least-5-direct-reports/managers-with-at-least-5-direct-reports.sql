-- Using Self join -----
SELECT e.name FROM Employee m INNER JOIN Employee e ON m.managerId=e.id 
GROUP BY (m.managerId,e.name) HAVING COUNT(m.id)>=5