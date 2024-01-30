create table user_activity(date date,user_id int,activity varchar(50));

insert into user_activity values('2022-02-20',1,'abc');
insert into user_activity values('2022-02-20',2,'xyz');
insert into user_activity values('2022-02-22',1,'xyz');
insert into user_activity values('2022-02-22',3,'klm');
insert into user_activity values('2022-02-24',1,'abc');
insert into user_activity values('2022-02-24',2,'abc');
insert into user_activity values('2022-02-24',3,'abc');


--Calculate unique user count for each day.

with cte as (
	select * from
		(select *, row_number() over(partition by user_id order by date) unique_user from user_activity) temp 
				where unique_user =1 )
select t1.date,case when t2.date is null then 0 else t2.unique_user_count end as unique_user_count from
	(select distinct date from user_activity) t1 left join 
			(select date,count(*) as unique_user_count from cte group by date) t2 
								on t1.date = t2.date
								order by date
