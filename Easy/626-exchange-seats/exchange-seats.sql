-- Write your PostgreSQL query statement below
WITH max_id AS
(
    SELECT MAX(id) AS maxId FROM Seat
)

SELECT s1.id AS id,s2.student FROM Seat s1
INNER JOIN Seat s2 ON s2.id=s1.id+1 WHERE s1.id%2=1
     UNION
SELECT s1.id AS id,s2.student FROM Seat s1
INNER JOIN Seat s2 ON s2.id=s1.id-1 WHERE s1.id%2=0
     UNION
SELECT id,student FROM Seat WHERE id=(SELECT maxId FROM max_id) AND id%2=1
ORDER BY id          