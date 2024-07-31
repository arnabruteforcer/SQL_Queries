SELECT u.name, COALESCE(SUM(distance),0) AS travelled_distance FROM Users u 
LEFT OUTER JOIN Rides r ON u.id=r.user_id
GROUP BY (u.id,name) ORDER BY travelled_distance DESC, u.name ASC
