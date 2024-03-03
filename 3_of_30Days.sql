DROP TABLE IF EXISTS FOOTER;
CREATE TABLE FOOTER 
(
	id 			INT PRIMARY KEY,
	car 		VARCHAR(20), 
	length 		INT, 
	width 		INT, 
	height 		INT
);

INSERT INTO FOOTER VALUES (1, 'Hyundai Tucson', 15, 6, NULL);
INSERT INTO FOOTER VALUES (2, NULL, NULL, NULL, 20);
INSERT INTO FOOTER VALUES (3, NULL, 12, 8, 15);
INSERT INTO FOOTER VALUES (4, 'Toyota Rav4', NULL, 15, NULL);
INSERT INTO FOOTER VALUES (5, 'Kia Sportage', NULL, NULL, 18); 

with cte as(
SELECT 
    STRING_AGG(car, ' ,') AS concatenated_cars,
    STRING_AGG(length::text, ' ,'::text) AS concatenated_lengths,
    STRING_AGG(width::text, ' ,'::text) AS concatenated_widths,
    STRING_AGG(height::text, ' ,'::text) AS concatenated_heights
FROM FOOTER)
select 
  TRIM(SPLIT_PART(concatenated_cars, ',', -1)) AS last_car,
  TRIM(SPLIT_PART(concatenated_lengths, ',', -1)) AS last_len,
  TRIM(SPLIT_PART(concatenated_widths, ',', -1)) AS last_wid,
  TRIM(SPLIT_PART(concatenated_heights, ',', -1)) AS last_hei
 from cte 



with cte as(
SELECT 
	STRING_AGG(length::text, ' ,') AS concatenated_lengths,
	STRING_AGG(width::text, ' ,') AS concatenated_wid,
	STRING_AGG(height::text, ' ,') AS concatenated_hei,
    STRING_AGG(car::text, ' ,') AS concatenated_car
FROM FOOTER)
select
 SPLIT_PART(concatenated_car, ',', -1) AS last_car,
  SPLIT_PART(concatenated_lengths, ',', -1) AS last_len,
   SPLIT_PART(concatenated_wid, ',', -1) AS last_wid,
 SPLIT_PART(concatenated_hei, ',', -1) AS last_hei
 from cte 

select * from (
select car from footer where car is not null order by id desc limit 1) cars cross join(
select length from footer where length is not null order by id desc limit 1) length cross join(
select width from footer where width is not null order by id desc limit 1) width cross join(
select height from footer where height is not null order by id desc limit 1) height


select * from footer

SELECT
    SPLIT_PART(STRING_AGG(length::text, ' ,'), ',', -1) AS last_len,
    SPLIT_PART(STRING_AGG(width::text, ' ,'), ',', -1) AS last_wid,
    SPLIT_PART(STRING_AGG(height::text, ' ,'), ',', -1) AS last_hei,
    SPLIT_PART(STRING_AGG(car::text, ' ,'), ',', -1) AS last_car
FROM FOOTER;



















































































