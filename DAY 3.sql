use sakila;
select actors, title from Film_list where actors like 'nat%';

-- logical AND or NOT
select * from actor;
select * from actor where first_name ='nick'and actor_id ='2';  -- in this and operator is used

select * from actor where first_name ='nick'or actor_id ='2';  -- in this or operator is used

select * from actor where first_name ='nick'or actor_id ='5'; 

show tables;
select * from actor_info;
select * from actor_info where film_info like 'animation%';

select * from actor_info where film_info like 'animation%' and first_name  = "goldie";
select * from actor_info where first_name  like "goldie";


-- AND operator is always executed first ,then  OR is executed with result of AND 
select * from actor_info where film_info like 'animation%' and first_name  = "goldie" or first_name = "nick";

-- if we change position of AND or OR , then we get only animation output acc. to provided condition
select * from actor_info where film_info like 'animation%' or first_name  = "goldie" and first_name = "nick";

-- -----------------------------------------------------------------------------------------------
select * from film_list;
select category, rating, title from film_list where category like 'sci-fi' and rating like "pg";

select category, rating, title from film_list where category like 'sci-fi' or category like "Family" and rating like "pg";

-- Parenthesis() sets priority
select category, rating, title from film_list where (category like 'sci-fi' or category like "Family") and rating like "pg";


select 2+2*3;
select (2+2)*3;
-- -------------------------------------------------------------------------------------------

-- between
-- range always starts from small values

select * from actor where actor_id between 2 and 5;
select * from actor where actor_id = 2 and actor_id =  5;

select * from actor where first_name between "b" and "dan";

select * from actor where first_name > "D";

select * from actor where actor_id = 1 or actor_id =  5;
select * from actor where actor_id in (1,5); -- another way of line 50 using in operator


# NOT operator
select * from actor where not(actor_id =1);


-- ---------------------------------ASSIGNMENT--------------------------------------
-- do everything in actor file--------
-- actor_id = 2 to 7 and First_name = nick or ED
select * from actor where actor_id between 2 and 7 and (first_name = "Nick" or first_name = "ED");

-- last_name mai "a" and "E"  saath mai nahi aaye
select * from actor where not (last_name like "%a%e%");

-- first_Name  mai grace or mathew or joe na ho|and actor_id < 15
select * from actor where not (first_name = "grace" or first_name = "matthew" or first_name = "joe") and actor_id < 15;

-- last name mai "a" nahi aana chaiye and first name mai "i" nahi aana chaiye or actor id 10-20 ke beech mai ho 
select * from actor where not (first_name like "%i%" or last_name like "%a%") and actor_id between 10 and 20;
