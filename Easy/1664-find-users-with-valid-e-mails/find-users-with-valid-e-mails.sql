-- Write your PostgreSQL query statement below
SELECT * FROM Users WHERE split_part(mail,'@',2)='leetcode.com'
AND split_part(mail,'@',1) SIMILAR TO '[a-zA-Z]+[-_.\d\w]*'