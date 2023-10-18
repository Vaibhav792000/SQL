-- transaction starts when we start DML statement
-- TCL 
-- Transaction:- A database transaction a logical unit of work which consist of many operations
-- transaction take our data from one consistant state

use sakila;
drop table test;
create table test(id int, name varchar(20));

insert into test values(10,"Hey"), (20,"abc"), (30,"def");
select * from sakila.test;

select @@autocommit; -- by default value of autocommiit is 1;

update test set name = "Tushar" where id = 10;
select @@autocommit;

set autocommit = 0;
update test set name = "Aman" where id = 10;
-- ----------------------------------------------------------------------
start transaction;
update test set name = "Hungary" where id = 10;
select * from sakila.test;
commit;

rollback; -- transaction ends when we performs a rollback operations
-- ---------------------------------------------------------------------

start transaction;
update test set name = "Goa" where id = 10;
select * from sakila.test;
commit;

-- --------------------------------------------------------------------
select * from sakila.test;
set autocommit = 0;
update test set name = "new" where id = 10;
commit;
update test set name = "Yash" where id = 10;
-- --------------------------------------------------------------------

-- savepoint is just like a bookmark...to stop transaction at certion level
start transaction;
update test set name = "Tushar" where id = 10;
savepoint test_name_tushar;
update test set name = "new abc" where id = 20;
savepoint test_name_newabc;
select * from sakila.test;


rollback to test_name_tushar;
-- ---------------------------------------------------------------------
-- DDL -- DDL in Sql are the auto commit statement

-- transaction starts when we start DML statement
-- transaction ends when we start DDL statement
-- what is difference in Table and Schema
-- isolation
-- how to create view(all types)
-- interview Questions