use employees;

desc employees;

-- 1
select first_name , last_name from employees;
-- 2
select * from employees where first_name = 'Denis';
-- 3
desc employees;
select * from employees where first_name = 'Denis' and gender = 'M';
-- 4
select * from employees where first_name in ('Denis','Elvis');
-- 5
select * from employees where last_name='Denis' and gender = 'M' or gender = 'F';
-- 6
select * from employees where not first_name in ('Cathie','Mark','Nathan');



use world;
show tables;
-- 7

desc countrylanguage;
select * from countrylanguage where percentage between 80 and 90 and Isofficial='T';


-- 8

select Name from city where Name like '%ing';

-- 9
select Name from city where Name like 'Mo%';

-- 10

select Name from city where Name like '%ee%';

-- 11

select Name from city where Name like '____';
select name from city where length(name)=4;

-- 12

select Name from city where Name like '_a__';

-- 13

select name,independence_year from country where indepencdenYear = 'null';

-- NULL TREATMENT
-- -- ifnull()
-- -- coalesce()

select ifnull('c','d');

-- coalesce 
-- accept any number of args
-- returns first not null value

select coalesce(null, null, 'Dr.stange',null,null);
select coalesce(null,'ironman','a',null,'b');

-- ifnull is null replaceer
select name,ifnull(indepyear,'N/A') as 'newindepyear' from country ;

 -- coalesce is not replcaer but to fetch from assosciated columns
 
 desc country;
select name,indepyear,gnpold,coalesce(indepyear,gnpOld,'Kuch Nahi Mila') from country;


select concat('avengers',' endgame');


desc country;
select Name,ifnull(IndepYear,concat('N/A ',Name)) from country limit 5 ;

-- activity 14

-- 10th most populated city

desc city;
select * from city  where  CountryCode = 'Ind' order by Population desc limit 6,8;

-- activity 15
select * from city  where  CountryCode = 'CHN' order by Population desc limit 10;
select * from city  where  CountryCode = 'CHN' order by Population desc limit 2,1;

-- act 16 aggregate functions

select max(population) from city;
select min(population) from city;
select avg(population) from city;
select sum(population) from city;
select count(population) from city;

-- act 17
 select  count(Name)-count(indepYear) from country;
 
-- act 18
select count(distinct continent) from country;

select continent , count(name) as CountCountry from country group by continent;
 
 
--  act 19

desc city;

select countrycode, count(District) as DIS from city group by countryCode  order by DIS desc limit 5;

-- having clause to filter aggregate 

-- act 20

show tables;
desc countrylanguage;

select * from countrylanguage;
select language, count(language) as lngcnt from countrylanguage group by language order by lngcnt desc;

-- 21

desc city;
desc country;

select District,count(District) as dsit from city where CountryCode='Ind' group by District order by  dsit desc limit 10;
select District,count(name) as dsit from city where CountryCode='Ind' group by District order by  dsit desc limit 10;


-- 22
desc country;

select name, avg(lifeexpectancy) as le from country group by region  order by le asc limit 3; 

-- ===================================================================================================================================
-- 02-08-2022 =========================================================================================================================
use employees;
show tables;

select first_name,count(first_name) as fn from employees group by first_name having fn>250 order by fn desc ; 


use world;
show tables;

desc city;
select Name from city;

-- how to find duplicates in data
select Name, count(Name)as c from city group by Name having c>1 order by c desc;

-- target 
-- find name of countries where spoken is hindi
-- interview question

desc country;
select * from country;
desc countrylanguage;


select Name from country inner join countrylanguage on country.Code = countrylanguage.countrycode where Language='Hindi';


















