SELECT sell_date, COUNT( DISTINCT product) AS num_sold, string_agg(DISTINCT product,',' ORDER BY product) 
AS products FROM Activities GROUP BY sell_date 
ORDER BY sell_date