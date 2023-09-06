-- create database test;
-- structure table row and column
-- row column and datatype
use test;
create table student(sid int, email char(20));
select * from student;

-- dml insert
insert into student values(20,null);

create table student2(sid int, email char(20) default 'hii'); -- to set default value
insert into student2(sid) values(2);
insert into student2(sid,email) values(2, null);
select * from student2;

-- constraints = conditions that will not allow invalid data to be inserted
-- not null constraint
create table student1(sid int not null default 0 ,email char(20) default 'gmail.com');
insert into student1(email) values('user');
insert into student1(sid,email) values(null, 'user'); -- error because of null
select * from student1;

-- unique /if any constraint is unique then there is no limit for null
-- can not insert same value and natural number again and again
create table student3(sid int unique default 0 ,email char(20) default 'gmail.com');
insert into student3(email) values('user@');
insert into student3(sid,email) values(2, 'user@'); -- error because of null
select * from student3;

-- unique /if any constraint is unique then there is no limit for null
-- can not insert same value and natural number again and again

create table student5(sid int unique default 0 ,email char(20) default 'gmail.com');
insert into student5(email) values('user@');
insert into student5(sid,email) values(1, 'user@');
insert into student5(sid,email) values(2, 'user@');
insert into student5(sid,email) values(2, 'user@'); -- error beacuse of 2 entered again
insert into student5(sid,email) values(null, 'user@');
insert into student5(sid,email) values(null, 'user@'); -- null = no reference null ko unique constraint m itni baar bhi likh skte h
insert into student5(sid,email) values('user@');
insert into student5(sid,email) values('user@'); -- eror because default set ho chuka h
select * from student5;

drop table employee;
-- primary key 
create table employee(e_id int primary key, e_name char(20));
insert into employee values(1,'tushar');
insert into employee values(2,'tushar');
insert into employee values(2,'tushar'); -- error because 2 is not unique
insert into employee values(null,'tushar'); -- error bcoz primary key can not be null
select * from employee;

create table employee1(e_id int, e_name char(20), primary key(e_id));-- 2nd defining of primary key
insert into employee1 values(1,'tushar');
insert into employee1 values(2,'tushar');
insert into employee1 values(2,'tushar'); -- error because 2 is not unique
insert into employee1 values(null,'tushar'); -- error bcoz primary key can not be null
select * from employee1;

-- datatype 
-- INT [(width)] [(unsigned)] [(zerofill)]
-- -2,147,483,648 to 2,147,483,647 (4 byte)
-- unsigned = no negative number // signed = +ive and -ive numbers both

create table ex1(eid int(2) zerofill);
insert into ex1 values(322);
insert into ex1 values(3);
select * from ex1;
drop table ex1;-- table ex1 is deleted

create table ex1(eid int unsigned); -- unsigned removes 0 from 0322|v
insert into ex1 values(0322);
insert into ex1 values(3);
select * from ex1;
drop table ex1;

-- BIG INT = 8 Bytes
create table ex1(eid bigint unsigned);
insert into ex1 values(8765432112345678765-1);
insert into ex1 values(3);
insert into ex1 values(8765432112378456789*100);
select * from ex1;
drop table ex1;

-- Boolean stored as tinyINT in database
create table test_bool(i bool);
insert into test_bool values(True),(false);
insert into test_bool values(1),(0),(-128),(127);
select * from test_bool;
drop table test_bool;