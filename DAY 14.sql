-- integer
-- float, double,decimal
-- double (total,precission)
use sakila;
drop table xyz;
create table xyz(price double(5,2));
insert into xyz values(15.2);
insert into xyz values(15.2);
insert into xyz values(151.2325);
select * from xyz;

drop table xyz;
-- float - 4 byte
-- double - 8 byte
create table xyz(price1 float, price2 double);
insert into xyz values(1.123456,1.1234567);
select * from xyz;


drop table xyz;

create table xyz(birthdate date); -- date is a datatype
-- date datatype format is fixed -- yyyy-mm-dd
insert into xyz values('2023-09-26');
insert into xyz values(curdate());
select * from xyz;

drop table xyz;
create table xyz(birthdate date,birth time, birthData datetime); -- date is a datatype and ime also
-- date datatype format is fixed -- yyyy-mm-dd
--  time datatype format -- hh:mm:ss
insert into xyz values('2023-09-26', '10:58:15' , '2023-12-26');
insert into xyz values(curdate(), curtime(), now());
select * from xyz;
select birthData,year(birthData),year(birthData),yearweek(birthData) from xyz;
select birthData,year(birthData),year(birthData),quarter(birthData) from xyz;
select birthData,year(birthData),year(birthData),last_day(birthData) from xyz;
select birthData,year(birthData),year(birthData),monthname(birthData) from xyz;
select birthData,year(birthData),year(birthData),yearweek(birthData),
datediff(birthData,now()) from xyz;

select birthData,date_add(birthData,5) from xyz; -- wrong format for date_add()method
select birthData,date_add(birthData,interval 5 day) from xyz;
select birthData,date_add(birthData,interval 5 year) from xyz;


-- Q1) Date
--    year -> Month -> Date -> Week of the Year -> Day of the Date
SELECT CONCAT(year(birthDate), " ", month(birthDate), " ", date(birthDate), " ", week(birthDate), " ", DAYOFWEEK(birthDate))
FROM xyz;
-- another way
select birthdata, date_format(birthdata, '%b %c') from xyz; -- using predefined functions(%b %c) (this is not complete query of Ques.

-- -----------------------------------------------------------------------------------------------------

use sakila;
create table captions(text VARCHAR(150),
created_at TIMESTAMP default current_timestamp);
insert into captions values(150);
-- -------------------------------------------------------------------------------------------------

create table captions2(
text VARCHAR(150),
created_at TIMESTAMP default current_timestamp,
updated_at timestamp on update current_timestamp);

insert into captions2 (text,created_at) values("Hey", now() );
update captions2 set text = "Hey2";
select * from captions2;


-- -----------------------------------------------------------------------------------------
-- To Study
-- Alter statement
-- Foreign Key
-- Transaction control language (TCL)