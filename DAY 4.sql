use sakila;
select * from Sakila.city where (city_id = 3 or city_id = 4) and country_id = 60;

select fid, title from film_list where fid < 7 and (fid = 4 or fid = 6);
select fid, title from film_list where fid < 7 and  not (fid = 4 or fid = 6);


-- if we are using like operator then we can not use '%' at starting
-- because is se humara data from first line to last line check hota h orr hunara time consumption bdh jata h

-- %abc% => %
select * from film list;

-- order by clause => sort ascending or descending
select * from film_list order by category asc;
select * from Film_list order by category desc;
select * from Film_list order by 5;
select * from Film_list order by fid asc;
select * from Film_list order by description asc;
select fid, title, category from film_list order by 3;
select fid, title, category from film_list order by 5;
select fid, title, category from film_list order by price;

-- -------------------------------------------------------------------------------------------
select * from address;
select * from address order by district;
select district, address, address_id from address order by district;
select district, address, address_id from address order by district, address_id;
select district, address, address_id from address order by district, address_id desc ;
select district, address, address_id from address order by district desc;
select district, address, address_id from address order by district desc, address_id asc;

-- -------------------------------------LIMIT CLAUSE----------------------------------------------------------
select * from address;
select * from address limit 3;
-- limit hum sorting k baad he laga sakte h;
-- limit lgane k baad sorting nahi krr skte;

-- --------------------------------------OFFSET CLAUSE---------------------------------------------------------
select * from address;
select * from address limit 3,2; -- 3 is offset here, hume 1,2,3 ka data nhi dikhega orr 4,5 he dikhega
select * from address limit 3 offset 5; -- if we use OFFSET keyword then last number is  offset skip number and if nt use the first number is offset skip
-- -----------------------------------------------------------------------------------------------------------------

# table => dual dummy table, with one row and one column to check or test our logic operating or not, this does not have schema.
select 1+2 from dual;
select 1+2, 2+3,3+4 from dual;
select now() from dual;

