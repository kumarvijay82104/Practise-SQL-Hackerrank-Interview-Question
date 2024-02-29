1. '''Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).'''
with cte as (
            Select *,coalesce(lead(salary) over(order by salary desc ),null) as rnsal, 
               row_number() over(order by salary desc) as rn from
                                 (select distinct salary from Employee))
select  rnsal as SecondHighestSalary from cte 
where rn = 1;

2. '''Find all numbers that appear at least three times consecutively.'''
with cte as 
        (select *,lead(num,1) over( )as next1,lead(num,2)over() as next2 from logs )
select distinct num as ConsecutiveNums from cte
where num = next1 and num = next2 ;

3. '''Write a solution to find employees who have the highest salary in each of the departments.'''
with cte as (
            select e.id,e.name ,e.salary,d.name as Department from employee e join department d 
                    on e.departmentid = d.id ),    
    cte_2 as (
             select *,rank() over(partition by Department order by salary desc ) as drsal from cte )
select Department,name as Employee,Salary from cte_2
where drsal = 1
order by Employee ;
            
4. '''Write a solution to find the rank of the scores.'''
select score,e.dk as rank from 
        (select *,dense_rank() over( order by score desc) as dk from scores) e;

5.'''A companys executives are interested in seeing who earns the most money 
      each of the companys departments. A high earner in a department is an employee who has a salary in 
            the top three unique salaries for that department.'''

with cte as (
        select e.name,d.name as Department, e.salary from employee e 
                        join Department d on e.departmentId = d.id),
     cte_2 as (   
        select *,dense_rank() over(partition by Department order by salary desc ) as rnksal from cte)
select department as Department, name as Employee,Salary  from cte_2 
where rnksal <= 3  
order by salary desc ;

'''6.Write a solution to find managers with at least five direct reports.'''
            
with cte as(
    select * from 
        (select *,count(*) over(partition by managerId ) as mcount from employee) e 
               where e.mcount >= 5 ),
    cte_2 as           
            (select distinct e.name, e.id  from cte c join employee e on c.managerid = e.id
            group by e.id ,e.name )
select name from cte_2 ;

'''Write a solution to find the people who have the most friends and the most friends number.
The test cases are generated so that only one person has the most friends.'''
with cte as (
        select requester_id as id from RequestAccepted
        union all
        select accepter_id as id from RequestAccepted)
select id, count(*) as num from cte
group by id 
order by count(*) desc limit 1

'''Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.'''
with cte as(
    select * from
        (select *,row_number()over(partition by customer_id,product_key order by customer_id)  as rn
        from Customer ) e 
        where e.rn = 1),
    cte_2 as 
    (select customer_id,count(*) pcn from cte where product_key in (select product_key from cte) group by 1)
select customer_id from cte_2
where pcn = (select count(distinct product_key) from Product )

'''Write a solution to select the product id, year, quantity, and price for the first year of every product sold.'''
with cte as 
        (select product_id,year,quantity,price,rank() over(partition by product_id order by year ) rn
                from sales) 
select product_id,year as first_year,quantity,price from cte 
where rn = 1

'''Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019.'''
with cte as (
        select buyer_id,count(order_date) as order_count from orders
        where order_date BETWEEN '2019-01-01' AND '2019-12-31'
        group by buyer_id)
select u.user_id as buyer_id,u.join_date,coalesce(c.order_count,0) as orders_in_2019
        from cte c right join users u on c.buyer_id = u.user_id



