use employees;
show tables;
select * from employees;
-- e,[1003 = >hiring date]

select hire_date from employees where emp_no=1003;
select * from employees where hire_date>"1986-08-28";

select hire_date from employees 
where first_name = "Georgie" and birth_date = "1953-09-02";

-- nested sub Query
select * from employees 
where hire_date>(select hire_date from employees where emp_no=10003);-- () are applied whose o/p we want first

select * from employees 
where hire_date>(select hire_date from employees where emp_no=10003);
select hire_date from employees 
where first_name = "Georgie" and birth_date = "1953-09-02";

show tables;
select * from titles;
-- title = emp_no =10001;
select title from titles where emp_no = "10001";

-- if your sub query returns one row then we can use (<,>,= ,<=,>=)
select * from titles where title = (select title from titles where emp_no = "10001"); -- nested sub query


select * from titles where title = (select title from titles where emp_no in (10001, 10002));-- error because we used =

select * from titles where title =ANY (select title from titles where emp_no in (10001, 10002));


select salary from salaries where emp_no = 10002;
select * from salaries where salary = ANY (select salary from salaries where emp_no = 10002); -- (=ANY) equivalent to all the result set value

select * from salaries where salary > ANY (select salary from salaries where emp_no = 10002); -- (>ANY) result set m lowest value se compare karega

select * from salaries where salary < ANY (select salary from salaries where emp_no = 10002); -- (<ANY) result set m largestt value se compare karega

select * from salaries where salary < ALL (select salary from salaries where emp_no = 10002);