WITH id_count AS
( 
    SELECT id,COUNT(id) AS num FROM
    (
        SELECT requester_id AS id FROM RequestAccepted
            UNION ALL
        SELECT accepter_id AS id FROM RequestAccepted
    )
    GROUP BY id
)  

SELECT id,num FROM id_count WHERE num=(SELECT MAX(num) FROM id_count) 