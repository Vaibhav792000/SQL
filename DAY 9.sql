-- alias (as) name => nickname
-- expression => accha naam (readability)
use sakila;
select first_name, concat("mr." , first_name) from actor;
select first_name, concat("mr." , first_name) as Full_Name from actor; -- to present concat column in table nicely, we use alias function(as)
select first_name, concat("mr." , first_name)  Full_Name from actor; -- we can do without (as) also
select first_name, concat("mr." , first_name)  Full_Name from actor where full_name ="mr. JAYNE"; -- can not use that column in where(join where) clause coz it dosen't know which column is ailased
select first_name, concat("mr." , first_name)  Full_Name from actor order by full_name;
-- --------------------------------------------------------------------------------------------
-- GROUP BY-------------------------------
select first_name,length(first_name) from actor;
-- multiple row => output
-- similar value collect => perform operation
-- group => group operation
-- ----------------------------GROUP BY OPERATION----------------------------
use world;
show tables;
select * from country;
desc country;
create table t1(id int , city varchar(20) );
insert into t1 values(1,"Hii");
insert into t1 values(2,"Hii1");
insert into t1 values(3,"Hii2");
insert into t1 values(4,"Hii3");
insert into t1 values(5,"Hii4");
insert into t1 values(6,"Hii5");
insert into t1 values(null,"Hii6");

select count(*) from t1; -- count * store value that is not null
select count(id) from t1;

select sum(id) from t1;
select distinct(city),id from t1; -- distinct find unique value/ shows value of first occurance

select count(distinct(id)) from t1; --
-- ----------------------------------------------------------------------------------------------------
show tables;
select * from city;
select * from city where countrycode = "AFG";

select countrycode from city group by countrycode;
select distinct countrycode from city;

select countrycode, count(id) from city group by countrycode;

select * from city;
select countrycode, count(id), sum(population) from city group by countrycode;
select countrycode, count(id), sum(population)  as total_Population from city group by countrycode;

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
--                             QUESTION
-- total population with name() with the count
-- country afg has total count of ()
-- and sum is (population sum)
select countrycode,concat('country ' ,(select countrycode ), ' has total population ' ,(select sum(population) )) as result from city group by countrycode;



-- where function group function par kam nhi krta

-- having     #group by pr apply hota h
select countrycode,count(id),sum(population) as totalPopulation
 from city 
 group by countrycode 
 having sum(population)>500 
 order by totalPopulation;

select countrycode,count(id),sum(population) as totalPopulation
 from city 
 group by countrycode 
 having sum(population)>500  and count(id)>1
 order by totalPopulation;

select countrycode,sum(population) from city
where population>200000
group by countrycode;

select countrycode,sum(population) from city
group by countrycode;

select * from country;
select continent,count(*) from country group by continent;

select continent,region from country 
where continent='europe'
group by continent,region;

select continent from country 
where continent='europe'
group by continent;

desc country;
select continent,region,count(*) from country 
where continent='europe'
group by continent,region;

select continent,region,count(code) from country 
where continent='europe'
group by continent,region;

select continent,region,count(code) from country 
where continent='europe'
group by continent,region order by region,continent;