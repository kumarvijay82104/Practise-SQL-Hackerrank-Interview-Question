'''Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).'''
with cte as (
            Select *,coalesce(lead(salary) over(order by salary desc ),null) as rnsal, 
               row_number() over(order by salary desc) as rn from
                                 (select distinct salary from Employee))
select  rnsal as SecondHighestSalary from cte 
where rn = 1
