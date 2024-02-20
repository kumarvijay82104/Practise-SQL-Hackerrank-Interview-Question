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




