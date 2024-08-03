1) ----- Using CTEs -----------------------
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
  
  
2) ----- Using self join --------------------
--- a) Self join the same table on the machine_id and process_id to combine the data of 2 rows 
  ----into 2 separate columns in 
--- b) As there are start and end timestamp for every process the join query has 4 combinations
------ the combination of start and end timestamp is considered with activity_type as 'start'
--- c) The consideration is taking the start_time from the 1st table and end_time from the 2nd table
--- d) The average is obtained by subtracting the endtime and starttime for every row and finding the average of it
  
SELECT a1.machine_id, round( CAST (AVG(a2.timestamp - a1.timestamp) AS numeric) ,3) AS processing_time FROM Activity a1
INNER JOIN Activity a2 ON a1.machine_id=a2.machine_id AND a1.process_id=a2.process_id
AND a1.activity_type='start' AND a2.activity_type='end'
GROUP BY a1.machine_id
