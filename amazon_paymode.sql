create table SALE (merchant varchar(30), amount int, pay_mode varchar(10));

insert into SALE values('merchant_1',150,'cash');
insert into SALE values('merchant_1',500,'online');
insert into SALE values('merchant_2',450,'online');
insert into SALE values('merchant_1',100,'cash');
insert into SALE values('merchant_3',600,'cash');
insert into SALE values('merchant_5',200,'online');
insert into SALE values('merchant_2',100,'online');

---------First Method

SELECT merchant, COALESCE(SUM(amount) FILTER (WHERE pay_mode = 'cash'), 0) AS mode_cash,
COALESCE(SUM(amount) FILTER (WHERE pay_mode = 'online'), 0) AS mode_online
FROM sale
GROUP BY 1
ORDER BY 1;

---------Second Method

select merchant,sum(case when pay_mode ='cash' then amount else 0 end) cash_mode,
sum(case when pay_mode ='online' then amount else 0 end) online_mode from sale
group by 1 order by 1;
