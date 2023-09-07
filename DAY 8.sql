-- varchar and char
-- char is a fix size and have more memory waste
-- varchar => if we give size 20 and insert only 4 then remaining memory can be utilized somewhere else 
-- create database test;
use test;
create table emp(name char(20));
insert into emp values("asdfghjkyt");
insert into emp values("A  "); -- char does not count space
insert into emp values("A  B "); -- counts space
select name, length(name) from emp;
-- -----------------------------------------------------------
create table emp1(name varchar(4));
insert into emp1 values("a");
insert into emp1 values("A    "); -- varchar counts space
insert into emp1 values("A  B    ");
select name, length(name) from emp1;
-- ----------------------------------------------------------
create table emp3(eid int check(eid>2));
insert into emp3 values(1); -- gives error
insert into emp3 values(5); -- dont give error
-- ---------------------------------------------------------
create table emp4(gender char (1) check(gender in ("M","f","o")));
insert into emp4 values("M");  
insert into emp4 values("f"); 
insert into emp4 values("F"); 
insert into emp4 values("p"); 
select * from emp4;
-- ------------------------------------------------------------
create table emp5(age int(20) ,gender char (1) check(gender in ("M","f","o")));
insert into emp5 values(2,"M");  
insert into emp5 values(3,"f"); 
insert into emp5 values(5,"F"); 
insert into emp5 values(7,"p"); -- error
select * from emp5;
-- ---------------------------------------------------------------
-- ------------------------------------------------Delete DML
delete from emp5; -- delete alldata from table
select * from emp5;
delete from emp5 where age = 3; -- ony delete data where age = 3;
select * from emp5;
-- ------------------------------------------------update DML
update emp5 set age =22 where age = 5; -- update age 5 into 22
update emp5 set age =5 limit 22; -- can use limit in place of where
delete from emp5 order by age limit 2; -- delete certain data with condition
select * from emp5; 
-- ----------------------------------------------------------------

--  how truncate diff from delete ad drop?
-- when truncate used it comoletly drops the table and creates schema/only structure
-- truncate use kr kr apan data retrive nhi krr skte/(Faster)
-- delete removes data row by row/ can retrive data /(slower)
-- drop deletes data and schema/ structure