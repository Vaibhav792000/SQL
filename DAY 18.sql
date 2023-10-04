use sakila;

create table employee (id int primary key auto_increment,
depat varchar(20), salary int);

insert into employee (depat, salary) values ("HR",200),
("HR",300),("HR",100),
("Marketing",70),("Marketing",50),
("Marketing",200),("Marketing",400),
("DSA",150),("DSA",120),
("DSA",40),("DSA",90),("DSA",500);

select avg(salary) from employee;

alter table  employee rename column depat to dept;
select dept, avg(salary) from employee group by dept;

-- windows: aggregate
-- aggregate for every row
select id, dept, salary from employee;

select id, dept, salary, avg(salary) from employee; -- avg will not run as this is a group by function

select id, dept, salary, 
avg(salary) over()
 from employee;
 
 select id, dept, salary, 
avg(salary) over()as avgsalary,
max(salary) over()
from employee;

select id, dept, salary, 
avg(salary) over(order by salary) as avgsalary,
max(salary) over()
from employee;

select id, dept, salary, 
avg(salary) over(partition by dept) as avgsalary
from employee;

select id, dept, salary, 
sum(salary) over(order by salary) as avgsalary
from employee;

select id, dept, salary, 
sum(salary) over(order by salary desc) as avgsalary
from employee;

select id, dept, salary, 
sum(salary) over(order by dept) as avgsalary
from employee;

select id, dept, salary, 
sum(salary) over(order by salary) as rollingSum,
sum(salary) over(partition by dept) as partitionSum
from employee;

select id, dept, salary, 
sum(salary) over(partition by dept) as partitionSum,
sum(salary) over(partition by dept order by salary) as rollingSumDept
from employee;

select id, dept, salary, 
sum(salary) over(partition by dept) as partitionSum,
sum(salary) over(partition by dept order by salary) as rollingSumDept,
sum(salary) over(order by salary) as rollingSum
from employee;

select id, dept, salary, 
sum(salary) over(partition by dept) as partitionSum,
avg(salary) over(partition by dept order by salary) as rollingSumDept
from employee;

select id, dept, salary, 
avg(salary) over(partition by dept) as dept_Avg,
avg(salary) over() as Company_Avg
from employee;


select id, dept, salary, 
min(salary) over(partition by dept) as dept_Min,
min(salary) over() as Company_Min
from employee;

select id, dept, salary, 
min(salary) over(partition by dept order by salary desc) as dept_Min,
min(salary) over() as Company_Min
from employee;

select id, dept, salary, 
sum(salary) over(partition by dept order by salary) as Rolling_dept_Salary,
sum(salary) over(partition by dept) as total_Dept_Salary
from employee;

select id, dept, salary, 
rank() over()
from employee;

insert into employee(dept,salary) values("Marketing", 200);

select id, dept, salary, 
rank() over(order by salary)
from employee;

select id, dept, salary, 
rank() over(partition by dept order by salary)
from employee;

select id, dept, salary, 
rank() over(partition by dept order by salary),
dense_rank() over(partition by dept order by salary)
from employee;

-- ranking pe where clause kaise lagega
-- how can we filter out data on basis of Ranking
-- study variance()