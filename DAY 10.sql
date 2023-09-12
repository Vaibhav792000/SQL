use world;
show tables;
select* from country;
select count(continent) from country;
select distinct(continent) from country;
select continent,count(*) from country group by continent;
select continent,count(*),sum(population) from country group by continent;
-- --------------------------------------------------------------------------------------------
--                               SET OPERATIONS
use sakila;
show tables;
drop table employee,employee1;
drop table student,student1,student2,student3,student4,student5;

desc actor;
desc actor_info;
select * from actor;
select first_name from actor limit 3;
select first_name from actor_info order by first_name;

--             UNION -> combine the result set of two select queries./and shows distinct values only
select first_name from actor
union
select first_name from actor_info order by first_name;

create table xyz(id int);
insert into xyz values(10);
insert into xyz values(30);
insert into xyz values(20);

create table abc(id int);
insert into abc values(10);
insert into abc values(20);
insert into abc values(40);
insert into abc values(50);

select * from xyz                        
union                              -- combination of xyz or abc and distinct value
select * from abc;

select * from xyz
union all
select * from abc;

-- -------------------------------INTERSECT----------------------------------
select * from xyz
intersect                           -- common element
select * from abc;

select * from xyz
except                                   -- jo first me h second me nhi h vo data aayega
select * from abc;

select * from abc
except                                   -- jo first me h second me nhi h vo data aayega
select * from xyz;

create table xyz1(id int,salary int);
select id from xyz1                        
union                              
select * from abc;

select salary from xyz1                        
union                              
select id from abc;

-- ----------------------------JOINS------------------------
-- inner join   
-- left join
-- right join
-- full outer

-- primary or foreign key
-- what is join
-- join and set operation