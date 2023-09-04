select length("	不");
select char_length("不");
select concat("h", "-","y") from dual; -- character joining method/ works only on string/if we give integer then it can convert into string by default

select concat_ws("-", "hi","hello","bye") from dual; -- ws says that first symbol in parenthesis acts as a seprator among all next strings
select upper("hi"); -- converts into uppercase;
select substr("hello",3); -- shows output from index provided - here 3rd index
select substr("hello",-2); -- negative (-2) allows from last side or end side
select substr("hello",2,3); -- 2 is starting index and 3 is end index
select substr(substr("hello",1,3),2); -- nested substring
select instr("Hello", "e"); -- (string, substring) here shows index of e
select locate("a","rajasthan",3); -- (substring , data , start index)
select ltrim("     xyz");-- only removes white space from left side only
select rtrim("xyz       ");-- only removes white space from right side only
select trim(leading " " from "        xyz          ");-- removes white space only from start
select trim(trailing " " from "        xyz          ");-- removes white space only from end
select trim(both " " from "        xyz          ");-- removes white space only from both side/ by default it is both;
select length(trim("        xyz          "));  -- proof of end space romoved
select trim(both "z" from "zzzzzzz y zz x zzzzz"); -- remove all z from start and end only
select lpad("Hello",6,"#"); -- agar char kam hai to # add kar dega left side se
select rpad("Hello",6,"#"); -- agar char kam hai to # add kar dega right side se
select replace("tushars","s", "#"); -- removes all 's' with '#'

use sakila;
select name from customer_list limit 5,5;
select id,name from customer_list;
select count(*) from language;

-- --------------------------DML-------------------------------
-- insert statement insert into table values(val1,val2,val3);
select * from language;
insert into language values(10,"portguese1",now());
select * from language;
insert into language values(NULL,"portguese",now());
describe language;
