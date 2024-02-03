create table tableA(colA int);
create table tableB(ColB int);
insert into tableA(colA) values(1),(2),(1),(5),(NULL),(NULL);
insert into tableB(colB) values(NULL),(2),(5),(5);

SELECT * FROM tableA inner join tableB on tableA.cola = tableB.colb or (tableA.cola is null and tableB.colb is null)
