create table EmpDetails(
Eid int primary key,
Ename varchar(20),
DOB date,
Designation varchar(20),
Salary int,
DOJ date
)

insert into EmpDetails
values(101,'Sudha','1989-12-29','Designer',20000,'2010-04-01'),
(102,'David','1995-01-10','Programmer',25000,'2018-02-18'),
(103,'Preethi','1985-08-15','Tester',35000,'2011-06-13'),
(104,'Kiran','1990-04-20','Programmer',40000,'2014-03-07'),
(105,'Meenal','1983-05-29','DBA',50000,'2011-12-09'),
(106,'Sunitha','1970-05-01','Analyst',60000,'2018-09-25'),
(107,'Akhil','1985-01-13','Programmer',45000,'2016-02-14'),
(108,'Sushma','1976-12-22','DBA',45000,'2012-01-31');

select * from EmpDetails

𝐐𝐮𝐞𝐬𝐭𝐢𝐨𝐧𝐬
--Write a SQL query to display all the employees whose designation is 'Programmer'.

select * from EmpDetails where designation = 'Programmer'

--Write a SQL query to display all those employees who have joined after 2014.

select * from EmpDetails where doj > '2014-01-01'

--Write a SQL query to display those employees whose name ends with 'a'.

select * from EmpDetails where ename like '%a'  

--Write a SQL query to display the total salary of all those employees whose designation is 'Programmer'.

select sum(salary) from EmpDetails where  designation = 'Programmer'

--Write a SQL query to display all employees' names in upper case.

select upper(ename) from EmpDetails

--Write a SQL query to display the details of employee with highest experience.

select * from EmpDetails order by doj limit 1 

--Write a SQL query to display those employees whose name contains 'ee'.

select * from EmpDetails where ename like '%ee%' 

--Write a SQL query to increase the salaries of employees by 5000 whose designation is 'DBA'.

select eid, ename , designation, sum(salary + 5000) as updated_salary from empdetails
group by 1,2,3
having designation = 'DBA'

--Write a SQL query to display the employees whose salary is more than the average salary of all the employees.

select * from EmpDetails where salary > (select avg(salary) from EmpDetails)
