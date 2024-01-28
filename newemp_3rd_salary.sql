CREATE TABLE newemp(
 emp_id int NULL,
 emp_name  varchar(50) NULL,
 salary int NULL,
 manager_id int NULL,
 emp_age int NULL,
 dep_id int NULL,
 dep_name varchar(20) NULL,
 gender varchar(10) NULL
) ;
INSERT INTO newemp VALUES (1, 'Ankit', 14300, 4, 39, 100, 'Analytics', 'Female');
INSERT INTO newemp VALUES (2, 'Mohit', 14000, 5, 48, 200, 'IT', 'Male');
INSERT INTO newemp VALUES (3, 'Vikas', 12100, 4, 37, 100, 'Analytics', 'Female');
INSERT INTO newemp VALUES (4, 'Rohit', 7260, 2, 16, 100, 'Analytics', 'Female');
INSERT INTO newemp VALUES (5, 'Mudit', 15000, 6, 55, 200, 'IT', 'Male');
INSERT INTO newemp VALUES (6, 'Agam', 15600, 2, 14, 200, 'IT', 'Male');
INSERT INTO newemp VALUES (7, 'Sanjay', 12000, 2, 13, 200, 'IT', 'Male');
INSERT INTO newemp VALUES (8, 'Ashish', 7200, 2, 12, 200, 'IT', 'Male');
INSERT INTO newemp VALUES (9, 'Mukesh', 7000, 6, 51, 300, 'HR', 'Male');
INSERT INTO newemp VALUES (10, 'Rakesh', 8000, 6, 50, 300, 'HR', 'Male');
INSERT INTO newemp VALUES (11, 'Akhil', 4000, 1, 31, 500, 'Ops', 'Male');

select * from (select *,row_number()over(partition by dep_name order by emp_id) as highest_salary from newemp)
where highest_salary = 1

select t1.emp_id,t1.emp_name as manager_name ,t2.emp_id, t2.emp_name from newemp t1 join newemp t2 on t1.emp_id = t2.manager_id

--write a sql query to find the details of the employee with the 3rd highest salary in each dept
--in case if there are less than 3 emp in dept then return the lowest salary with there emp details 

with cte as(
select *,row_number()over(partition by dep_name order by emp_id) as highest_salary ,
		count(1)over(partition by dep_name) as n_dep from newemp)
select * from cte
		where highest_salary  = 3 or (n_dep<3 and highest_salary = n_dep)
	
