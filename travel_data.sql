CREATE TABLE travel_data (
    customer VARCHAR(10),
    start_loc VARCHAR(50),
    end_loc VARCHAR(50)
);

INSERT INTO travel_data (customer, start_loc, end_loc) VALUES
    ('c1', 'New York', 'Lima'),
    ('c1', 'London', 'New York'),
    ('c1', 'Lima', 'Sao Paulo'),
    ('c1', 'Sao Paulo', 'New Delhi'),
    ('c2', 'Mumbai', 'Hyderabad'),
    ('c2', 'Surat', 'Pune'),
    ('c2', 'Hyderabad', 'Surat'),
    ('c3', 'Kochi', 'Kurnool'),
    ('c3', 'Lucknow', 'Agra'),
    ('c3', 'Agra', 'Jaipur'),
    ('c3', 'Jaipur', 'Kochi');
with cte as (
			select customer,start_loc as loc,'start_loc' as start_loc from travel_data
						union all			
			select customer,end_loc as loc,'end_loc' as end_loc from travel_data),
	cte_2 as 
			(select *,count(*) over(partition by customer, loc) as rnt from cte)
select customer,max(case when start_loc= 'start_loc' then loc else null end) as start_location,
		max(case when start_loc= 'end_loc' then loc else null end) as end_location
					from cte_2
where rnt = 1
group by customer
