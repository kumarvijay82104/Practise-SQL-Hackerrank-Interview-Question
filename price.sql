create table sku 
(
sku_id int,
price_date date ,
price int
);
delete from sku;
insert into sku values 
(1,'2023-01-01',10)
,(1,'2023-02-15',15)
,(1,'2023-03-03',18)
,(1,'2023-03-27',15)
,(1,'2023-04-06',20)

--Find the start date price and price diffirence at the end of the month.
WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY sku_id, EXTRACT(year FROM price_date), EXTRACT(month FROM price_date) 
                              ORDER BY price_date DESC) AS rn FROM sku)
SELECT sku_id,price_date,price FROM sku WHERE EXTRACT(day FROM price_date) = 1
union all
SELECT sku_id, date_trunc('month', (price_date + INTERVAL '1 month')) AS next_date,price
FROM cte WHERE rn = 1 and date_trunc('month', (price_date + INTERVAL '1 month')) not in (SELECT price_date FROM sku
																						 WHERE EXTRACT(day FROM price_date) = 1)
order by price_date
