What is the total amount each customer spent at the restaurant?

select s.customer_id, sum(m.price) as total_spend from sales s join menu m on s.product_id = m.product_id
group by s.customer_id
---------------------------------------------------------------------------------------------------------------------
How many days has each customer visited the restaurant?

select customer_id, count(distinct order_date) as visited_days from sales
group by customer_id
-------------------------------------------------------------------------------------------------------------------------
What was the first item from the menu purchased by each customer?

with cte as (
		select s.customer_id,s.order_Date,m.product_name from sales s join menu m on s.product_id = m.product_id),
	cte2 as (
	select *,rank()over(partition by customer_id order by order_date) as flag from cte )
select customer_id,string_agg(distinct product_name, ' ,') as first_order from cte2 
where flag =1
group by customer_id
--------------------------------------------------------------------------------------------------------------------------------------
What is the most purchased item on the menu and how many times was it purchased by all customers?

select m.product_name, count(product_name) as most_purchased_product from sales s join menu m on s.product_id = m.product_id
group by m.product_name
order by 2 desc limit 1
--------------------------------------------------------------------------------------------------------------------------------------
Which item was the most popular for each customer?

with cte as(
		select s.customer_id,m.product_name from sales s join menu m on s.product_id = m.product_id),
	cte2 as (
		select customer_id,product_name ,row_number() over(partition by customer_id,product_name) as flag from cte),
	cte3 as (
		select *,max(flag) over(partition by customer_id) as mark from cte2) 
select customer_id, product_name,mark as order_time from cte3
where flag= mark
--------------------------------------------------------------------------------------------------------------------------------------
Which item was purchased first by the customer after they became a member?

with cte as (
		select s.customer_id,s.order_date,m1.product_name	
			from sales s join members m on s.customer_id = m.customer_id join menu m1 on m1.product_id= s.product_id
				where s.order_date >= m.join_date),
	cte2 as (		
	select customer_id, product_name,order_date,rank() over(partition by customer_id order by order_date) as flag from cte )
SELECT customer_id,product_name, order_date FROM CTE2
where flag = 1
--------------------------------------------------------------------------------------------------------------------------------------
Which item was purchased just before the customer became a member?
with cte as (
		select s.customer_id,s.order_date,m1.product_name	
			from sales s join members m on s.customer_id = m.customer_id join menu m1 on m1.product_id= s.product_id
				where s.order_date < m.join_date),
	cte2 as (		
	select customer_id, product_name,order_date,rank() over(partition by customer_id order by order_date) as flag from cte )
SELECT customer_id,product_name, order_date FROM CTE2
where flag = 1
--------------------------------------------------------------------------------------------------------------------------------------
What is the total items and amount spent for each member before they became a member?
with cte as (
		select s.customer_id,m1.product_name, m1.price	
			from sales s join members m on s.customer_id = m.customer_id join menu m1 on m1.product_id= s.product_id
				where s.order_date < m.join_date)
select customer_id,count(product_name) as total_items, sum(price) as amount_spent from cte
group by customer_id
order by customer_id
--------------------------------------------------------------------------------------------------------------------------------------
If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

with cte as (
		select s.customer_id,m.product_name, m.price from sales s join menu m on s.product_id = m.product_id),
	cte2 as (
	select customer_id, case when product_name = 'sushi' then price * 2 * 10 else price * 10 end as points from cte)
select customer_id, sum(points) as total_points from cte2 
group by customer_id
order by customer_id
--------------------------------------------------------------------------------------------------------------------------------------
In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how 
many points do customer A and B have at the end of January?

with cte as (
		select s.customer_id,s.order_date,m.join_date,m1.product_name, m1.price	
	from sales s join members m on s.customer_id = m.customer_id join menu m1 on m1.product_id= s.product_id
		 WHERE s.order_date <= '2021-01-31' ),
	cte2 as (
		select *,case when order_date between join_date and join_date + interval '7 days' then price * 2 * 10 
					  when product_name = 'sushi' then price *20  else price * 10 end points 
				from cte )
select CUSTOMER_id, sum(points) as total_points from cte2
group by customer_id
order by customer_id
--------------------------------------------------------------------------------------------------------------------------------------
The following questions are related creating basic data tables that Danny and his team can use to quickly derive insights without 
needing to join the underlying tables using SQL.
Recreate the following table output using the available data:	

with cte as (
		select s.customer_id,s.order_date,m1.product_name,m1.price ,m.customer_id as mark
			from sales s left join members m on s.customer_id = m.customer_id AND S.ORDER_DATE >= M.JOIN_DATE
								join menu m1 on m1.product_id= s.product_id	)
select customer_id,order_date,product_name,price,CASE WHEN MARK IS NULL THEN 'NO' ELSE 'YES' END AS MEMBER from cte 
ORDER BY CUSTOMER_ID
--------------------------------------------------------------------------------------------------------------------------------------
Danny also requires further information about the ranking of customer products, but he purposely does not need the ranking for 
non-member purchases so he expects null ranking values for the records when customers are not yet part of the loyalty program.
	
with cte as (
		select s.customer_id,s.order_date,m1.product_name,m1.price ,m.customer_id as mark
			from sales s left join members m on s.customer_id = m.customer_id AND S.ORDER_DATE >= M.JOIN_DATE
								join menu m1 on m1.product_id= s.product_id	)
SELECT customer_id,order_date,product_name,price,CASE WHEN MARK IS NULL THEN 'NO' ELSE 'YES' END AS MEMBER,CASE WHEN MARK IS NULL THEN NULL ELSE 
	RANK() OVER(PARTITION BY CUSTOMER_ID,MARK ORDER BY ORDER_DATE) END AS ranking FROM CTE
	ORDER BY CUSTOMER_ID, ORDER_DATE

























































