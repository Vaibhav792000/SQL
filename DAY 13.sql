use employees;
select emp_no,year(from_date),title as fd 
from titles 
where title<>"manager";

-- co-related query
-- exist keyword
use sakila;
show tables;
select count(*) from dept_emp;

select count(*) from departments
where exists(select * from dept_emp where emp_no <100); -- our inner nested query is not returning any o/p

select first_name, last_name from staff;

select first_name, last_name from staff
where exists(select* from customer where customer.first_name = staff.first_name);

select inventory.film_id,count(*) from inventory,film
where inventory.film_id = film.film_id
group by film_id;

select inventory.film_id from inventory,film
where inventory.film_id = film.film_id
group by film_id;

select count(*) from film;

select count(*) from film
where exists (select count(*) from inventory, film
where inventory.film_id = film.film_id);

select count(*) from film where exists
(select count(*) from inventory , film
where inventory.film_id = film.film_id
group by inventory.film_id having count(*) > 8);

use employees;
select * from
(select emp_no, year(birth_date) from employees) as xyz;

select birthy from
(select emp_no, year(birth_date) as birthy from employees) as xyz;

-- nested query in from clause
select emp_no, monthly_salary from
(select emp_no, salary/12 as monthly_salary from salaries) as ms
limit 5;

use sakila;
select amount , film_id
from payment join rental using (rental_id)
join inventory using (inventory_id)
join film using ( film_id);

select sum(amount) , film_id
from payment join rental using (rental_id)
join inventory using (inventory_id)
join film using ( film_id)
group by film_id;

select * from
(select sum(amount) , film_id
from payment join rental using (rental_id)
join inventory using (inventory_id)
join film using ( film_id)
group by film_id) as groupMovie;

use sakila;
show tables;
select * from payment;

select payment_id, rental_id,amount from payment;

select 
case rental_id
when rental_id <= 76 then"xyz"
else rental_id
end "new",
payment_id , amount from payment;

select 
case 
when rental_id <= 76 then"xyz"
when rental_id >= 1000 then rental_id+100
else rental_id
end "new Col",
payment_id , amount from payment; -- this is best approach among


select 
case rental_id
when rental_id <= 76 then rental_id+10
when 1000 then rental_id+100
else rental_id
end "new Col",
rental_id,payment_id , amount from payment;

select truncate(644.429,-4) from dual;
