
use sakila;




-- dql select statement
select database();
show tables;

-- desc table name/ show columns
show columns from actor_info;
desc actor;
select * from actor;
select * from sakila.actor;  -- database.table

-- where clause
select * from language where name ="English";

-- compare data with string
select * from language where name <"E";

-- <> not equals to / != not equalss to
select * from language where language_id <> 3;
select * from language where name ="English";

select * from language where name > "I";

-- in mysql data is not case sensitive;
select * from language where name > "i";

select * from actor;
select first_name from actor where First_name > "bette";

select * from film;
select * from film where title like "A % R" ; -- like operator- for pattern/ all movies start from A and ends with R

select * from film where title like "% dinosaur" ; -- dinosaur at end

select * from film where description like "%drama%";
select title, description,release_year from film where title like "a%les";

select * from film where title like "a_e%"; -- _ represents one character and % denotes 0 and 1;

-- i need to get all the movie title, film_id, release year, description 
-- 2nd char = c;
select film_id, title, description, release_year from film where title like "_c%";

-- last 2 char = an; and starting char = a;
select film_id, title, description, release_year from film where title like "a%an";

-- min 4 char; last 4th char = t;
select film_id, title, description, release_year from film where title like "%t___";

-- 2nd char = f; 4th char = i; end char = egg;
select film_id, title, description, release_year from film where title like "_f_i%egg";

-- min 5 char; 3rd char = a;
select film_id, title, description, release_year from film where title like "__a__%";
