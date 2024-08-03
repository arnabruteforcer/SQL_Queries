-- Write your PostgreSQL query statement below
WITH start_time AS
 ( 
    SELECT machine_id, process_id, SUM(timestamp) AS process_start_time
    FROM Activity WHERE activity_type='start' GROUP BY machine_id,process_id
 )
,end_time AS
 ( 
    SELECT machine_id,process_id, SUM(timestamp) AS process_end_time
    FROM Activity WHERE activity_type='end' GROUP BY machine_id,process_id
 )

 SELECT s.machine_id, round( CAST( (SUM(process_end_time)-SUM(process_start_time))/COUNT(DISTINCT s.process_id) AS Numeric), 3)
 AS processing_time FROM start_time s INNER JOIN end_time e ON s.machine_id=e.machine_id AND s.process_id=e.process_id 
 GROUP BY s.machine_id