use sakila;
select * from language;
insert into language values(null,'South African',now()); -- (index,name,last update) use insert for new entry in language table
insert into language values(16,'russian',now()); -- for new entry only at unique index of primary key here (language ID)
desc language; -- gives description of language table

-- ignore command will be used for giving the warning if the data is already created in table/ if not then will execute without warning.(primarly work on primary key)
insert ignore language values(16,'caribeaian',now()); -- it just give warning not error
insert into language(name,last_update) values('indian_hindi',now()); -- to insert data in language table by (parameter)(arguement)
desc language;

-- insert multiple data at once
insert into language values(null,'Armani',now()),(null,'russian2',now()),(null,'arbian',now()); -- for new entry in language table
insert into language set name="abc";  -- set is also used to insert data(rarely used) 
-- ------------------------------------------------------------------------------------------------------------------
create database if not exists Vaibhav; -- creating database named vaibhav
create database test; -- creating database named vaibhav
use vaibhav;
show tables;

create table vibhu(id int , name varchar(20) , Email varchar(20));
insert into vibhu values(1 , 'Vaibhav', 'vaibhav@gmail.com');
insert into vibhu values(1 , 'mohit', 'vaibhav@gmail.com');
-- if we dont provide primary key then we can use same data repeatedly without any error(line 22,23)
insert into vibhu values(null , 'mohit', 'vaibhav@gmail.com');
insert into vibhu values(1 , null, 'vaibhav@gmail.com');
insert into vibhu values('mohit', null);-- number of arguements must be same as parameters
select * from vibhu;
drop table vibhu;

create table company1 (eid int default 0 ,ename varchar(40),address varchar(40) default null);
insert into company1 values(null,'ankit',null);
insert into company1 values(1,'ankit','jaipur');
insert into company1 values(2,'arpit','udaipur');
insert into company1(ename) values('vaibhav');-- this shows default set valuesfor eid and address
select * from company1; -- to show table data

-- truncate keyword
truncate table company1; -- to delete all data within a table

-- alter keyword
alter table company1 add Date int; -- to add extra column (add column name)
alter table company1 add Day int;
alter table company1 modify Date datetime;
insert into company1 values(3,'rohit','jaipur',now());
select * from company1;
set sql_safe_updates = 0; -- prevents from getting safe mode error from sql
delete from company1 where eid =1; -- delete all data with eid=1
select * from company1;
drop table company1;