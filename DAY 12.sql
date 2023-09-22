use employees;
show tables;

create table a(id int);
insert into a values(10);
insert into a values(20);
insert into a values(2);
insert into a values(null);

create table b(id int);
insert into b values(15);

select * from b where id > 10;
select * from b where id > (select id from a);

select * from b where id >any (select id from a);
select * from b where id <any (select id from a);
select * from b where id =any (select id from a);

select * from a;
select * from b;
select * from b where id >all (select id from a);
select * from b where id <all (select id from a);
select * from b where id =all (select id from a);

select * from b where id =all (select id from a where id is not null);

select * from b;
select * from b where newid in(select id from a);

use employees;
select * from employees;
select * from titles;
select e.emp_no from employees as e inner join titles using (emp_no) where title <>'manager';
select emp_no from employees join titles using (emp_no) where title <> 'manager';

select emp_no ,first_name,last_name from employees join titles using (emp_no) where title="manager" and emp_no =any
(select e.emp_no from employees as e inner join titles using (emp_no) where title <>'manager');

select emp_no ,title from employees join titles using (emp_no) where title <>'manager'; 
-- count
select count(*) from employees join titles using (emp_no) where title <>'manager'; 

-- better approach goes to using join

-- scaler ek column ek value

-- mulitple value - column subquery

-- two or more columns - than we use row subquery 

-- using , on , where 


select employees.emp_no ,first_name,last_name ,title from employees ,titles where (employees.emp_no 
and first_name ='georgi' and last_name='klassen' and title ='staff');

-- row subquery-------------------
select mgr.emp_no,mgr.from_date,mgr.title as fd
from titles as mgr ,titles as other
where mgr.emp_no=other.emp_no and mgr.title='manager';

select mgr.emp_no,mgr.from_date,mgr.title, other.title as fd
from titles as mgr ,titles as other
where mgr.emp_no=other.emp_no and mgr.title='manager'
and mgr.title<>other.title;

select mgr.emp_no,year(mgr.from_date),year(other.from_date),mgr.title,other.title as fd
from titles as mgr ,titles as other
where mgr.emp_no=other.emp_no and mgr.title='manager'
and mgr.title<>other.title
and year(mgr.from_date)=year(other.from_date) ;

-- alternative (row subquery)
select emp_no,year(from_date) as fd from titles where title='manager' and
(emp_no,year(from_date)) IN 
(select emp_no , year(from_date) from titles where title <> 'manager');

-- find out the salary and the total count of the salary person for those data 
-- where the total number of salary person is greater than the salary person of the
--  salary greater than or equal to 60,175

show tables;
select * from salaries;
SELECT count(*) from salaries where salary = 60117;
select max(salary) from salaries;
select salary,count(emp_no) from salaries group by salary;

select salary,count(salary)
from salaries group by salary
having 
count(salary) >= (select count(salary) from salaries where salary = 60117 group by salary);