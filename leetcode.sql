'''Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).'''
with cte as (
            Select *,coalesce(lead(salary) over(order by salary desc ),null) as rnsal, 
               row_number() over(order by salary desc) as rn from
                                 (select distinct salary from Employee))
select  rnsal as SecondHighestSalary from cte 
where rn = 1;

'''Find all numbers that appear at least three times consecutively.'''
with cte as 
        (select *,lead(num,1) over( )as next1,lead(num,2)over() as next2 from logs )
select distinct num as ConsecutiveNums from cte
where num = next1 and num = next2 ;

'''Write a solution to find employees who have the highest salary in each of the departments.'''
with cte as (
            select e.id,e.name ,e.salary,d.name as Department from employee e join department d 
                    on e.departmentid = d.id ),    
    cte_2 as (
             select *,rank() over(partition by Department order by salary desc ) as drsal from cte )
select Department,name as Employee,Salary from cte_2
where drsal = 1
order by Employee
