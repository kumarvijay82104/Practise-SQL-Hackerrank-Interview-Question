create table supplier(
Sup_No varchar(5) primary key,
Sup_Name varchar(20),
Item_Supplied varchar(20),
Item_Price int,
City varchar(20)
);
insert into supplier
values('S1','Suresh','Keyboard',400,'Hyderabad'),
('S2','Kiran','Processor',8000,'Delhi'),
('S3','Mohan','Mouse',350,'Delhi'),
('S4','Ramesh','Processor',9000,'Bangalore'),
('S5','Manish','Printer',6000,'Mumbai'),
('S6','Srikanth','Processor',8500,'Chennai');

--𝐐𝐮𝐞𝐬𝐭𝐢𝐨𝐧𝐬
--Write a SQL query to display the supplier numbers and supplier names whose name starts with 'R'.

select sup_no,sup_name from supplier where sup_name like 'R%'

--Write a SQL query to display the name of suppliers who supply processors and whose city is Delhi.

select * from supplier where item_supplied = 'Processor' and city = 'Delhi'

--Write a SQL query to display those suppliers who supply the same items as supplied by Ramesh.

select sup_name from supplier where item_supplied =(select item_supplied from supplier where sup_name = 'Ramesh' ) 
and sup_name != 'Ramesh'

--Write a SQL query to increase the price of keyboard by 200.

select sup_name,item_supplied,item_price + 200 from supplier where item_supplied = 'Keyboard'

--Query to display the supplier numbers, supplier names and item price for suppliers in Delhi in the ascending of item price.

select sup_no, sup_name,item_price from supplier where city = 'Delhi' order by 3 asc 

--Write a SQL query to add a new column named CONTACTNO.

alter table supplier add column contact_no int;
ALTER TABLE supplier DROP COLUMN contact_no;

--Write a SQL query to delete the record whose item price is the lowest of all the items supplied.

delete from supplier where item_price in (select item_price from supplier order by item_price limit 1 );
insert into supplier (sup_no ,sup_name,item_supplied,item_price,city) values ('S3','Mohan','Mouse',350,'Delhi') 

--Create a view on the table which displays only supplier number and their names.

create view vijay as (select sup_no, sup_name from supplier)  --select * from vijay -- for display view data 

--Write a SQL query to display the records in the descending order of item price for each item supplied.

select sup_no, sup_name,item_price from supplier order by 3 desc

--Write a SQL query to display the records of suppliers who supply items other than processor or keyboard.

select * from supplier where item_supplied != 'Processor' and item_supplied != 'Keyboard'
