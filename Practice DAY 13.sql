-- ------------------------------------------------------------------------------
use employees;
show tables;
select * from employees;
-- 1) get employee numbr first name and full name of every person where 
-- the birth year is > than the birth year of employy no 10003 
-- and the hire year is < than the hire year of employee no 10005
SELECT *,emp_no, first_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE year(birth_date) > (SELECT year(birth_date) FROM employees WHERE emp_no = 10003)
AND year(hire_date) < (SELECT year(hire_date) FROM employees WHERE emp_no = 10005) order by hire_date;




-- 2) get the info of those user where the hire year is greater among all 
--  the hire year of employee no 10003 to 10007 

select * from employees;
select *,emp_no, CONCAT(first_name, ' ', last_name) as fullname from employees 
where year(hire_date)> all (select year(hire_date) from employees where emp_no between 10003 and 10007);


-- 3) find out the employee number and department number and department name of those user 
-- whohas work into my company for more than 28 years
use employees;
show tables;
select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_emp_latest_date;
select departments.emp_no,dept_emp.dept_no,dept_name from dept_emp,departments where deptarments_emp.emp_no in
(select emp_no from dept_emp_latest_date where ((YEAR(to_date))-Year(from_date))>28);

select emp_no from dept_emp_latest_date where ((YEAR(to_date))-Year(from_date))>28;


-- 4) find out the employee no , dept no. and the name of employee and the next working monday
-- from the day of join
SHOW TABLES;
select * from dept_emp;
select * from employees;
SELECT dept_emp.EMP_NO,CONCAT(first_name, ' ', last_name) as fullname,dept_no from employees join dept_emp on dept_emp.emp_no=employees.emp_no;

SELECT DAYOFYEAR(hire_date)
FROM employees;


-- 5) find emp,name , emp no, dept no, dept name and the year , the total no of months he has work into your
-- company only for those user where the total no of of working  is greater than 400 months
show tables;
select * from dept_emp;
select * from departments;
select emp_no,dept_emp.dept_no,departments.dept_name,TIMESTAMPDIFF( month,hire_date,CURRENT_TIMESTAMP()) as months
from employees inner join dept_emp
using (emp_no) inner join departments using(dept_no)
 where TIMESTAMPDIFF( month,hire_date,CURRENT_TIMESTAMP())>400;

select * from employees;
SELECT
  first_name,
  emp_no,
  dept_no,
  dept_name,
  EXTRACT(YEAR FROM hire_date) AS hire_year,
  DATEDIFF(MONTH, hire_date, CURRENT_DATE) AS total_months_worked
FROM employees
WHERE DATEDIFF(MONTH, hire_date, CURRENT_DATE) > 400;


-- 6) deploy/ create a foreign key from ont table to another table
drop table friends;
create table friends(id int,name varchar(20),primary key(id));
insert into friends values(1,"amit");insert into friends values(2,"arpit");insert into friends values(3,"aniket");insert into friends values(1,"amit");
drop table friendsbirthday;
create table friendsbirthday(id int,birthyear varchar(20),foreign key(id) REFERENCES friends (id));
insert into friendsbirthday values(1,"2022-10-09");insert into friendsbirthday values(2,"2021-10-21");insert into friendsbirthday values(3,"2023-05-11");
select * from friends;
select * from friendsbirthday;
select friends.id,friends.name,friendsbirthday.birthyear from friends join friendsbirthday on friends.id=friendsbirthday.id;
