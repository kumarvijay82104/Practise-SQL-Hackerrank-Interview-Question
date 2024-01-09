Problem: - Retrieve information about consecutive login streaks for employees who have logged in for at least two consecutive days.
For each employee provide the emp_id, the number of consecutive days logged in, the start_date of the streak, and the end_date of the streak.

CREATE TABLE pwc_attandance_log (
emp_id INT,
log_date DATE,
flag CHAR
);

insert into pwc_attandance_log(emp_id,log_date,flag) values
(101,'02-01-2024','N'),
(101,'03-01-2024','Y'),
(101,'04-01-2024','N'),
(101,'07-01-2024','Y'),
(102,'01-01-2024','N'),
(102,'02-01-2024','Y'),
(102,'03-01-2024','Y'),
(102,'04-01-2024','N'),
(102,'05-01-2024','Y'),
(102,'06-01-2024','Y'),
(102,'07-01-2024','Y'),
(103,'01-01-2024','N'),
(103,'04-01-2024','N'),
(103,'05-01-2024','Y'),
(103,'06-01-2024','Y'),
(103,'07-01-2024','N');


WITH CTE AS (
SELECT EMP_ID,LOG_DATE,EXTRACT(DAY FROM LOG_DATE) AS LOGDATE,ROW_NUMBER()OVER(PARTITION BY EMP_ID ORDER BY EMP_ID ) AS ROWNUMBER 
			FROM PWC_ATTANDANCE_LOG
		WHERE FLAG = 'Y'),
		CTE2 AS (
		SELECT *, (LOGDATE - ROWNUMBER) AS GROUPDATA FROM CTE)
		
SELECT EMP_ID,MIN(LOG_DATE) AS START_DATE, MAX(LOG_DATE) AS END_DATE, COUNT(emp_id) AS CONSECUTIVE_DAYS FROM CTE2
GROUP BY EMP_ID,GROUPDATA
HAVING COUNT(emp_id) > 1
ORDER BY EMP_ID

