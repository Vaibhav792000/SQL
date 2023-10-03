use employees;
-- -row subquery--------------------------------------------------------------


select emp_no,year(from_date) from titles
where title='manager'
and (emp_no,year(from_date)) IN
(select emp_no,year(from_date) from titles
where title<>'manager');

-- -------------------------------co-related query---------------outer query ka inner query me use hota h or inner query ka data aa rha h 
-- to hi outer query ka data aayega otherwise nhi aayega
-- ----------------exits keyword--------------------

select * from departments;
select * from dept_emp;

select count(*) from departments
where exists (select * from dept_emp where emp_no<100);

use sakila;
select first_name,last_name from staff;
select * from customer where first_name='jon';
select first_name,last_name from staff
where exists (select * from customer 
where customer.first_name=staff.first_name
AND customer.last_name=staff.last_name);

select * from customer,staff
where customer.first_name=staff.first_name
AND customer.last_name=staff.last_name;

select inventory.film_id, count(*) from inventory,film
where inventory.film_id=film.film_id
group by film_id;

select count(*) from film;

select count(*) from film;
select count(*) from inventory,film
where inventory.film_id=film.film_id group by film.film_id
having count(*)>2;

select count(*) from film where exists
(select count(*) from inventory,film
where inventory.film_id=film.film_id
group by film.film_id having count(*)>2);

select count(*) from film where exists
(select count(*) from inventory,film
where inventory.film_id=film.film_id
group by film.film_id having count(*)>8);

-- nested query FROM clauses

use employees;
select emp_no,year(birth_date) from employees;

select * from
(select emp_no,year(birth_date)  from employees) as xyz;

select emp_no,monthly_salary FROM
(select emp_no,salary/12 as monthly_salary from salaries) as ms
limit 5;

use sakila;
select amount,film_id 
FROM payment JOIN rental USING(rental_id)
JOIN inventory USING (inventory_id)
JOIN film USING (film_id);

select * FROM
(
  select film_id ,sum(amount)
  FROM payment JOIN rental USING(rental_id)
  JOIN inventory USING (inventory_id)
  JOIN film USING (film_id)group by film_id ) as pqr;

select sum(newamount) FROM
(
  select film_id ,sum(amount) as newamount
  FROM payment JOIN rental USING(rental_id)
  JOIN inventory USING (inventory_id)
  JOIN film USING (film_id)group by film_id ) as pqr;
  
  -- ---------CASE STATMENT--------------------------------------
  select * from payment;
  
  select payment_id,rental_id ,amount from payment;
  select
         case 
         when rental_id=76 then "xyz"
         end "newcol",
         rental_id,payment_id ,amount from payment;
  

  select
         case 
         when rental_id=76 then rental_id+10
         when rental_id>=1000 then rental_id+100
         else rental_id
     end "newcol",
         rental_id,payment_id ,amount from payment;


-- select ,constraints,joins,group by,
-- data types
-- string function,round

select floor(192.16) from dual;
select round(192.16) from dual;
select round(192.56) from dual;

select round(192.48,1) from dual;
select round(192.41,1) from dual;

select round(192.439,2) from dual;

select round(192.439,-1) from dual;       -- agr 5 se kam h to convert in 0  -- yha 2 ,5 vse km h
select round(197.539,-1) from dual;  
select round(147.439,-1) from dual;       -- agr 5 se jyada h to convert in 0 then add 10  -- 7 ,5 se bda h so 140+10=150


select round(142.439,-2) from dual;  
select round(162.439,-2) from dual;  

select mod(7,2) from dual;
select truncate(162.439,2) from dual;
select truncate(162.439,-2) from dual;

-- 1)find to get employee no,first name and full name of every person where birth year is greater than the birth year of employee no 10003 
-- and the hire year is less than the hire date of 10005
use employees;
select * from employees;
select emp_no,first_name ,last_name from employees where year(birth_date)>(select year(birth_date) from employees where emp_no=10003) 
And year(hire_date)<(select year(hire_date) from employees where emp_no=10005);

-- 2) get the inforation of those user where is the hire year > among all these hire year of employee no 10003-10007
select * from employees where year(hire_date)>all(select year(hire_date) from employees where emp_no between 10003 and 10007);

-- 3) find out the emp-no ,department no and department name of those user who has worked in my company for more than 28 years
-- 4) find out the emp.no ,department.no and name of emp and next working monday from the date column
-- 5) find out the emp.name,emp.no.depaat.no.depart.name, and the year the total no of month in your company only for users where the total
-- no of months of working is > 33
-- create a foreign key one table to another table