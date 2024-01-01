# Given an increasing sequence of numbers present in a column of a table, certain numbers are missing from the column due to some fauty entries.
# The goal is to find the missing numbers from the sequence

# Here is te example  with ID field representing an increasing sequence with initial ID as 1:

  ID  | Value    | More fields...
---------------------------------
 2   | Cat      | ... 
 3   | Fish     | ...
 6   | Dog      | ...
 7   | Aardvark | ...
 9   | Owl      | ...
 10  | Pig      | ...
 11  | Badger   | ...
 15  | Mongoose | ...
 19  | Ferret   | ...


# O/P:
  ID 
----
 1
 4
 5
 8
 12
 13
 14
 16
 17
 18
  

  
## Ans: 
SELECT DISTINCT rating_id+1
FROM student_rating
WHERE rating_id+1 NOT IN (SELECT DISTINCT rating_id FROM student_rating) 
AND rating_id+1<=(select max(rating_id) from student_rating);
