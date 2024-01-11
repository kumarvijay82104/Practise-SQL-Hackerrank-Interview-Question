CREATE TABLE sustainable_clothing (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
size VARCHAR(10),
price FLOAT
);
-- Insert data into the table
INSERT INTO sustainable_clothing (product_id, product_name, category, size, price)
VALUES
(1, 'Organic Cotton T-Shirt', 'Tops', 'S', 29.99),
(2, 'Recycled Denim Jeans', 'Bottoms', 'M', 79.99),
(3, 'Hemp Crop Top', 'Tops', 'L', 24.99),
(4, 'Bamboo Lounge Pants', 'Bottoms', 'XS', 49.99),
(5, 'Eco-Friendly Hoodie', 'Outerwear', 'XL', 59.99),
(6, 'Linen Button-Down Shirt', 'Tops', 'M', 39.99),
(7, 'Organic Cotton Dress', 'Dresses', 'S', 69.99),
(8, 'Sustainable Swim Shorts', 'Swimwear', 'L', 34.99),
(9, 'Recycled Polyester Jacket', 'Outerwear', 'XL', 89.99),
(10, 'Bamboo Yoga Leggings', 'Activewear', 'XS', 54.99),
(11, 'Hemp Overalls', 'Bottoms', 'M', 74.99),
(12, 'Organic Cotton Sweater', 'Tops', 'L', 49.99),
(13, 'Cork Sandals', 'Footwear', 'S', 39.99),
(14, 'Recycled Nylon Backpack', 'Accessories', 'One Size', 59.99),
(15, 'Organic Cotton Skirt', 'Bottoms', 'XS', 34.99),
(16, 'Hemp Baseball Cap', 'Accessories', 'One Size', 24.99),
(17, 'Upcycled Denim Jacket', 'Outerwear', 'M', 79.99),
(18, 'Linen Jumpsuit', 'Dresses', 'L', 69.99),
(19, 'Organic Cotton Socks', 'Accessories', 'M', 9.99),
(20, 'Bamboo Bathrobe', 'Loungewear', 'XL', 69.99);
---------------------------
-- Create the table
CREATE TABLE marketing_campaigns (
campaign_id INT PRIMARY KEY,
campaign_name VARCHAR(100),
product_id INT,
start_date DATE,
end_date DATE,
FOREIGN KEY (product_id) REFERENCES sustainable_clothing (product_id)
);
-- Insert data into the table
INSERT INTO marketing_campaigns (campaign_id, campaign_name, product_id, start_date, end_date)
VALUES
(1, 'Summer Sale', 2, '2023-06-01', '2023-06-30'),
(2, 'New Collection Launch', 10, '2023-07-15', '2023-08-15'),
(3, 'Super Save', 7, '2023-08-20', '2023-09-15');
------------------------
-- Create the table
CREATE TABLE transactions (
transaction_id INT PRIMARY KEY,
product_id INT,
quantity INT,
purchase_date DATE,
FOREIGN KEY (product_id) REFERENCES sustainable_clothing (product_id)
);
-- Insert data into the table
INSERT INTO transactions (transaction_id, product_id, quantity, purchase_date)
VALUES
(1, 2, 2, '2023-06-02'),
(2, 14, 1, '2023-06-02'),
(3, 5, 2, '2023-06-05'),
(4, 2, 1, '2023-06-07'),
(5, 19, 2, '2023-06-10'),
(6, 2, 1, '2023-06-13'),
(7, 16, 1, '2023-06-13'),
(8, 10, 2, '2023-06-15'),
(9, 2, 1, '2023-06-18'),
(10, 4, 1, '2023-06-22'),
(11, 18, 2, '2023-06-26'),
(12, 2, 1, '2023-06-30'),
(13, 13, 1, '2023-06-30'),
(14, 4, 1, '2023-07-04'),
(15, 6, 2, '2023-07-08'),
(16, 15, 1, '2023-07-08'),
(17, 9, 2, '2023-07-12'),
(18, 20, 1, '2023-07-12'),
(19, 11, 1, '2023-07-16'),
(20, 10, 1, '2023-07-20'),
(21, 12, 2, '2023-07-24'),
(22, 5, 1, '2023-07-29'),
(23, 10, 1, '2023-07-29'),
(24, 10, 1, '2023-08-03'),
(25, 19, 2, '2023-08-08'),
(26, 3, 1, '2023-08-14'),
(27, 10, 1, '2023-08-14'),
(28, 16, 2, '2023-08-20'),
(29, 18, 1, '2023-08-27'),
(30, 12, 2, '2023-09-01'),
(31, 13, 1, '2023-09-05'),
(32, 7, 1, '2023-09-05'),
(33, 6, 1, '2023-09-10'),
(34, 15, 2, '2023-09-14'),
(35, 9, 1, '2023-09-14'),
(36, 11, 2, '2023-09-19'),
(37, 17, 1, '2023-09-23'),
(38, 2, 1, '2023-09-28'),
(39, 14, 1, '2023-09-28'),
(40, 5, 2, '2023-09-30'),
(41, 16, 1, '2023-10-01'),
(42, 12, 2, '2023-10-01'),
(43, 1, 1, '2023-10-01'),
(44, 7, 1, '2023-10-02'),
(45, 18, 2, '2023-10-03'),
(46, 12, 1, '2023-10-03'),
(47, 13, 1, '2023-10-04'),
(48, 4, 1, '2023-10-05'),
(49, 12, 2, '2023-10-05'),
(50, 7, 1, '2023-10-06'),
(51, 4, 2, '2023-10-08'),
(52, 8, 2, '2023-10-08'),
(53, 16, 1, '2023-10-09'),
(54, 19, 1, '2023-10-09'),
(55, 1, 1, '2023-10-10'),
(56, 18, 2, '2023-10-10'),
(57, 2, 1, '2023-10-10'),
(58, 15, 2, '2023-10-11'),
(59, 17, 2, '2023-10-13'),
(60, 13, 1, '2023-10-13'),
(61, 10, 2, '2023-10-13'),
(62, 9, 1, '2023-10-13'),
(63, 19, 2, '2023-10-13'),
(64, 20, 1, '2023-10-14');

select * from sustainable_clothing
select * from marketing_campaigns
select * from transactions

-----------------------

-- Questions

-- 1. How many transactions were completed during each marketing campaign?

select t2.campaign_name,count(t1.transaction_id) from transactions t1 join marketing_campaigns t2 on t2.product_id = t1.product_id
WHERE
   t1.purchase_date BETWEEN t2.start_date AND t2.end_date
group by 1 order by 2 desc 

-- 2. Which product had the highest sales quantity? 

select t1.product_id,t2.product_name,sum(t1.quantity) as highest_quantity
from transactions t1 join sustainable_clothing t2 on t2.product_id = t1.product_id
group by t1.product_id,t2.product_name order by sum(t1.quantity) desc limit 1

-- 3. What is the total revenue generated from each marketing campaign?  

with cte as 
(select t1.product_id,t2.campaign_name,sum(t1.quantity) as total_quantity  from transactions t1 
join marketing_campaigns t2 on t2.product_id = t1.product_id 
WHERE t1.purchase_date BETWEEN t2.start_date AND t2.end_date group by 1,2 )
select  c1.campaign_name,(c1.total_quantity* t3.price) as total_revenue from cte c1 
join sustainable_clothing t3 on c1.product_id = t3.product_id order by total_revenue desc 

-- 4. What is the top-selling product category based on the total revenue generated?

with cte as (
		select t1.category,t2.quantity,t1.price from sustainable_clothing t1 natural join transactions t2 ),
	cte2 as (
		select category,(quantity * price) as total_revenue from cte)
select category,sum(total_revenue) from cte2
group by 1 order by 2 desc limit 1

-- 5. Which products had a higher quantity sold compared to the average quantity sold?

select t1.product_name, sum(t2.quantity) from sustainable_clothing t1 join transactions t2 on t2.product_id = t1.product_id
group by 1
having sum(t2.quantity) > (select avg(quantity) from transactions )
order by 2 desc 

-- 6. What is the average revenue generated per day during the marketing campaigns?

select t3.campaign_name,(SUM(t2.quantity*t1.price) / 30) AS avg_revenue_per_day from sustainable_clothing t1 join transactions t2 on t2.product_id = t1.product_id 
join marketing_campaigns t3 on t2.product_id = t3.product_id 
WHERE purchase_date BETWEEN start_date AND end_date 
group by 1 order by 2 desc

-- 7. What is the percentage contribution of each product to the total revenue?

with cte as (
			select t1.product_name,sum(t2.quantity*t1.price) as revenue_by_product from sustainable_clothing t1 
		join transactions t2 on t2.product_id = t1.product_id group by 1 order by 2 desc ),

	cte2 as 
			(Select sum(t2.quantity*t1.price) as total_revenue from sustainable_clothing t1 
		join transactions t2 on t2.product_id = t1.product_id)

select *, ((revenue_by_product / total_revenue) * 100) revenue_percentage_product from cte , cte2 

-- 8. Compare the average quantity sold during marketing campaigns to outside the marketing campaigns

with cte as 
		(select avg(t2.quantity) AS avg_quantity_During_camp from sustainable_clothing t1 join transactions t2 on t2.product_id = t1.product_id 
		join marketing_campaigns t3 on t2.product_id = t3.product_id 
						WHERE purchase_date BETWEEN start_date AND end_date ),
	cte2 as(select avg(t2.quantity) AS avg_quantity from sustainable_clothing t1 join transactions t2 on t2.product_id = t1.product_id 
		join marketing_campaigns t3 on t2.product_id = t3.product_id 
		WHERE purchase_date NOT BETWEEN start_date AND end_date)
select round((avg_quantity - avg_quantity_During_camp),2) as revenue_diffirence from cte,cte2

-- 9. Compare the revenue generated by products inside the marketing campaigns to outside the campaigns.
with cte as
		(select t1.product_name,sum(t1.price * t2.quantity) camp_revenue from sustainable_clothing t1 
			join transactions t2 on t2.product_id = t1.product_id join marketing_campaigns t3 on t2.product_id = t3.product_id 
					WHERE purchase_date BETWEEN start_date AND end_date group by 1),
	cte2 as 
		(select t1.product_name,sum(t1.price * t2.quantity) camp_N_revenue from sustainable_clothing t1 
				join transactions t2 on t2.product_id = t1.product_id join marketing_campaigns t3 on t2.product_id = t3.product_id 
							WHERE purchase_date NOT BETWEEN start_date AND end_date group by 1)
Select c1.product_name, c1.camp_revenue ,c2.camp_N_revenue
from cte c1 join cte2 c2 on c1.product_name = c2.product_name

-- 10. Rank the products by their average daily quantity sold

with cte as(
		select t1.product_name,round(avg(t2.quantity),2) as avg_quantity from sustainable_clothing t1 
				join transactions t2 on t2.product_id = t1.product_id group by 1 order by 2 desc)
select Product_name,avg_quantity,dense_rank()over(order by avg_quantity desc ) as prodcuct_rank from cte 	
