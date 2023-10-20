use sakila;
show tables;
select*from city;
drop table test;
create table test (id int,value varchar(20));
insert into test values(1,'10'),(2,'20%'),(3,'10'),(4,'40%');
select*from test;
select*from test where value like'%\%%';

-- view
-- stored query(query(store) => table format mai)
-- data(name => view)
-- access() virtual table
-- 2 types of view
-- Simple and Complex
-- Simple:- 

-- manage complexity
-- resuability
-- Security

create table employee1234(id int, name varchar(20), salary int);
insert into employee1234 values (10,"abc", 100),(20,"def", 200),(30,"ghi", 300);
select * from employee1234;
select id, name from employee1234;

create view empView as select id,name from employee1234;

select * from empView;

insert into empView values(40,"Japan");
select * from empView;

alter view empView as select id,name from employee1234 where id = 30;
select * from empView;

insert into empView values(50,"Iraq");
select * from empView;

create table dept(id int, deptname varchar(20));
insert into dept values (10,"HR"),(20,"Marketing"),(100,"oops");
select * from dept;

select * from employee1234 inner join dept using (id);
create view empjoin as 
select employee1234.id,name,deptname 
from employee1234 inner join dept using(id);
select * from empjoin;

insert into empjoin(id,name,deptname) values (60,"kilo", "new");

-- correct 
insert into empjoin(id,name) values (60,"kilo");
insert into empjoin(id,deptname) values (60,"yak");

select * from employee1234;
select * from dept;
select salary,salary


create view complex as
select
    c.CustomerID,
    c.CustomerName,
    SUM(o.OrderAmount) AS TotalOrderAmount
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.CustomerName;
    
    
    
    
    
    
-- group by rollup
-- normalization