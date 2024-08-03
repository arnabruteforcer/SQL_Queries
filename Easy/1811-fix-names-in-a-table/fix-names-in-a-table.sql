SELECT user_id, 
concat( upper(left(name,1)),lower(substring(name from 2)) ) AS name 
FROM Users ORDER BY user_id 