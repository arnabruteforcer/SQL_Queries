-- 2)
-- Using simple case statements and altering the ID
SELECT 
    CASE 
       WHEN id%2=0 THEN id-1
       WHEN id%2=1 AND id!=0 AND id!=(SELECT MAX(id) FROM Seat) THEN id+1
       ELSE id
    END AS id, student
 FROM Seat ORDER BY id   
