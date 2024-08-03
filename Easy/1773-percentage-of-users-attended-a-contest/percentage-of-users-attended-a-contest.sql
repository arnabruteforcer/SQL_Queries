SELECT contest_id, round( (COUNT(user_id)*1.0)/(SELECT COUNT(*) FROM Users)* 100.0,2) AS percentage
FROM Register GROUP BY contest_id ORDER BY percentage DESC, contest_id ASC