-- Write your PostgreSQL query statement below
SELECT DISTINCT(query_name),
round(AVG((rating * 1.0)/position),2) AS quality,
round(SUM(CASE WHEN rating<3 THEN 1.0 ELSE 0.0 END)/COUNT(*) * 100,2) AS poor_query_percentage
FROM Queries WHERE query_name IS NOT NULL GROUP BY query_name  