#      functions in SQL
# single row
# Multi row

# String 
# Numeric
# Date


# -------- String Function -------- #
use sakila;

show tables;
select * from actor;

# length function  tells storage of character in (bytes);
select first_name, length(first_name) from actor;

# char_length()
select 1 from dual;
select char_length("hello") from dual;


select concat("Hey" , " ", "Hello" , " !") from dual;
select concat_ws(" & " , "Hey" , "Hello" , "!") from dual;

select * from actor;
select first_name, concat(first_name, " ", last_name) as FullName;
select * from actor where last_name =  concat("%", "A"); -- no outut bcoz of "="
select * from actor where last_name like  concat("%", "A");

select first_name, substr(first_name, 5)from actor;
select first_name, substr(first_name, 5, 3)from actor;
select first_name, replace(first_name, "P", "2") from actor;

select first_name, rpad(first_name, 5, "$") from actor;
select first_name, lpad(first_name, 5, "$") from actor;

select trim("  japan  ") from dual; -- only removes white Space
select trim("cccccccjapan  ") from dual;

select trim("c" from "cccccccjapan  ") from dual;
select trim("c" from "  cccccccjapan  ") from dual;
select trim("c" from "cccccccjacccccpan  ") from dual;
select trim(Leading "c" from "cccccccjacccccpancccccccccccc  ") from dual;
select trim(trailing "c" from "cccccccjacccccpancccccccccccc  ") from dual;
select trim(trailing "c" from "cccccccjacccccpanccccccccccc") from dual;

select first_name, instr(first_name, "P") from actor;
select first_name, Locate("P",first_name, 2) from actor;

# ------------ Numeric Function --------------
select round(14.85) from dual;
select round(14.34) from dual;

select round(14.85, 1) from dual;
select round(14.34, 1) from dual;
select round(14.85, 2) from dual;
select round(14.857, 2) from dual;

select round(14.857, -2) from dual;
select round(19.857, -1) from dual;
select round(78.857, -2) from dual;

# -------- truncate ---------
select truncate(78.857, 1) from dual;
select truncate(78.857, 2) from dual;
select truncate(78.857, -1) from dual;
select truncate(78.857, -2) from dual;
select truncate(80.857, 1) from dual;
select truncate(80.857, -1) from dual;

# ----------- DATE FUNCTION ------------
select last_update, adddate(last_update, 2) from actor;
select now() from dual;
select extract(year from last_update) from actor;
select last_update, date_format(last_update, "%w") from actor;