create table marks_data(student_id int, subject varchar(50), marks int);
insert into marks_data values(1001, 'English', 88);
insert into marks_data values(1001, 'Science', 90);
insert into marks_data values(1001, 'Maths', 85);
insert into marks_data values(1002, 'English', 70);
insert into marks_data values(1002, 'Science', 80);
insert into marks_data values(1002, 'Maths', 83);


select student_id,sum(marks) filter(where subject= 'English') as English,
  sum(marks) filter(where subject= 'Science') as Science,
				sum(marks) filter(where subject= 'Maths') as Maths 
  from marks_data group by 1 order by 1
----------------------------------

select student_id,sum(case when subject = 'English' then marks else null end) as English,
				  sum(case when subject = 'Science' then marks else null end) as Science,
				  sum(case when subject = 'Maths' then marks else null end) as Maths 
                  from marks_data group by 1 order by 1
