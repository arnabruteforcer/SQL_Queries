WITH distance AS
  (
   SELECT user_id, SUM(distance) AS travelled_distance FROM Rides 
        GROUP BY user_id
  )

SELECT name, COALESCE(travelled_distance,0) AS travelled_distance FROM Users u LEFT OUTER JOIN distance
 ON u.id=distance.user_id ORDER BY travelled_distance DESC, name ASC