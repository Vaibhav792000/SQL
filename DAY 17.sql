-- views --
use sakila;
show tables;
select * from actor;
select actor_id, first_name from actor;

-- virtual table --
create view actor_view as 
select actor_id, first_name from actor;

select * from actor_view;

drop table test;
create table test(id int, name varchar(20));
insert into test values(1,"Tushar");
insert into test values(2,"Aman");
insert into test values(3,"Aditya");

select name from test;

create view testview as
select name from test;

select * from testview;

-- insert
insert into testview values("REGex");
select * from testview;
select * from test;

insert into test values(100,"Navi");
select * from testview;
select * from test;

-- delete
delete from testview where name = "Navi";
select * from testview;
select * from test;

create view testview as
select id,name from test; -- error as test view already exist

create or replace view testview as
select id,name from test;

-- another way to update view table
alter view testview as select name from test where id >2;

-- to delete view (virtual) table
drop view testview;
show tables;

-- typicall wala view
select * from country;
select * from city;

select * from country 
inner join city using (country_id);

select country_id,country,city_id,city from country
inner join city using (country_id);

create view cityFinder_V as
select country_id,country,city_id,city from country
inner join city using (country_id);

select * from cityFinder_V;
insert into cityFinder_V values(999,'yyy',999,'Japan');-- error because if we create view using from, group_by, join etc;

select count(name) from test;
select count(id) from test; -- null count m count nahi hota

select id, ifnull(id,0) from test;
select count(id) from test;

select count(ifnull(id,0) ) from test;
select count(id) from test;

alter table test add column salary int;
select * from test;
insert into test values(4,null,100);
insert into test values(null,null,200);
insert into test values(100,null,null);
select * from test;

-- coalesce()
select id,name salary, coalesce(id,name,salary) from test;

-- create table with constraints movie_id, movie_name, movie_duration and price
-- create table with constraints customer name, movie_id, Watch_Date
-- link both tables with primary key and foreign key in id column
-- 1) get all customer id, customer name and movie name jo kisi bhi customer ne dekhi hai
-- 2) get all info of customer whether they have watched movie or not
-- 3) get the customer id and total number of movies that have been watched by a user after year 2000
-- 4) find total amount spent by user to watch movie and average time duration he has watched movie
-- 5) get only the customer id, customer name of those who has watched the max number of movies

CREATE TABLE movies (
  movie_id INT NOT NULL PRIMARY KEY,
  movie_name VARCHAR(255) NOT NULL,
  movie_duration INT NOT NULL,
  release_date DATE NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE customers (
  customer_id INT NOT NULL PRIMARY KEY,
  customer_name VARCHAR(255) NOT NULL,
  watch_date DATE NOT NULL,
  movie_id INT NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies (movie_id)
);

-- Movies table
INSERT INTO movies (movie_id, movie_name, movie_duration, release_date, price)
VALUES  (2, 'The Godfather', 175, '1972-02-28', 12.00),
        (3, 'The Dark Knight', 152, '2008-03-20', 14.00),
        (4, '12 Angry Men', 96, '1957-06-29', 8.00),
        (5, 'The Lord of the Rings', 178, '1957-06-29', 16.00);

-- Customers table
INSERT INTO customers (customer_id, customer_name, watch_date, movie_id)
VALUES (1, 'John Doe', '2023-10-03', 1),
       (2, 'Jane Doe', '2023-10-04', 2),
       (3, 'Peter Doe', '2023-10-05', 3),
       (4, 'Susan Doe', '2023-10-06', 4),
       (5, 'Michael Doe', '2023-10-07', 5);
       
INSERT INTO customers (customer_id, customer_name, watch_date, movie_id)
VALUES (6, 'Vaibhav', '2023-10-03', 1),
       (7, 'vishal', '2023-10-04', 2),
       (8, 'Arvind', '2023-10-05', 3),
       (9, 'Sushil', '2023-10-06', 4),
       (10, 'Mahima', '2023-10-07', 5);
       
select * from movies;
select * from customers;

-- 1) get all customer id, customer name and movie name jo kisi bhi customer ne dekhi hai

SELECT customers.customer_id, customers.customer_name, movies.movie_name
FROM customers
INNER JOIN movies ON customers.movie_id = movies.movie_id;

-- 2) get all info of customer whether they have watched movie or not

SELECT customers.customer_id, customers.customer_name,
  CASE WHEN EXISTS (SELECT 1 FROM customers
    INNER JOIN movies ON customers.movie_id = movies.movie_id) THEN 'Watched' ELSE 'Not Watched' END AS watched_status
FROM customers;

-- 3) get the customer id and total number of movies that have been watched by a user after year 2000
SELECT customer_id, COUNT(DISTINCT movies.movie_id) AS total_movies_watched
FROM customers
INNER JOIN movies ON customers.movie_id = movies.movie_id
WHERE movies.release_date > 2000
GROUP BY customer_id
ORDER BY total_movies_watched DESC
LIMIT 0, 1000;

-- 4) find total amount spent by user to watch movie and average time duration he has watched movie
SELECT customer_id, SUM(movies.price) AS total_amount_spent, AVG(movies.movie_duration) AS average_watch_duration
FROM customers
INNER JOIN movies ON customers.movie_id = movies.movie_id
GROUP BY customer_id
ORDER BY total_amount_spent DESC;

-- 5) get only the customer id, customer name of those who has watched the max number of movies

SELECT customers.customer_id, customers.customer_name
FROM customers
INNER JOIN (
  SELECT customer_id, COUNT(DISTINCT movies.movie_id) AS total_movies_watched
  FROM customers
  INNER JOIN movies ON customers.movie_id = movies.movie_id
  GROUP BY customer_id
  ORDER BY total_movies_watched DESC
  LIMIT 1
) AS max_movies_watched ON customers.customer_id = max_movies_watched.customer_id
LIMIT 0, 1000;
