create table find_even (id int)

insert into find_even (id) values (1),(3),(5),(6),(7),(9),(10);


with cte2 as (with recursive cte as 
		(select min(id) as min_id,max(id) as max_id from find_even
		union all
		select min_id +1 ,max_id from cte 
		where min_id < max_id 
		)
select * from cte t1 left join find_even t2 on t1.min_id = t2.id )
select min_id from cte2
where id is null
order by 1
