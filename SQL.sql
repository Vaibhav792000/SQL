

show databases;
use sakila;
show tables;
-- hyphen hyphen is used for comment

describe actor; -- describe shows the about of table...here actor is table name;
desc actor; -- desc also does same an describe;
-- DQL statement
select * from actor; -- * is used to access all data from table
select actor_id from actor; -- only shows actor_id column
select actor_id, first_name from actor; -- shows actor_id column and first_name column

desc Actor_info;  -- actor_info is table name

-- Projection and Selection
-- selecting a column ia projection
select * from actor_info;
select first_name from actor_info;
select actor_id * 10 from actor_info; -- we can perform arithmetic operations as well
select * from actor_info;

-- if we want to access only one row use (where clause)
select * from Actor_info where actor_id = 2;
select Actor_id, first_name
 from Actor_info
 where actor_id = 2;
 
 select Actor_id, first_name
 from Actor_info
 where actor_id > 2;
 
  select *
 from Actor_info
 where First_name = "ed";
