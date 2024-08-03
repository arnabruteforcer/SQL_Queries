-- Write your PostgreSQL query statement below
SELECT * FROM Users WHERE mail SIMILAR TO '[a-zA-Z]+[-_.\d\w]*@leetcode.com'