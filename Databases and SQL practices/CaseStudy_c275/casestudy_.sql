use imdb;



show tables;
select * from director_mapping;
select * from genre;
select * from movie;
select * from names;
select * from ratings;
select * from role_mapping;


-- actitvity 1
-- Find the total number of rows in each table of the schema?
select count(movie_id) from director_mapping;
select count(movie_id) from genre;
select count(id) from names;
select count(movie_id) from ratings;
select count(movie_id) from role_mapping;

select count(movie_id), count(name_id) from director_mapping where movie_id;
select count(name_id), count(movie_id) from director_mapping where name_id is null;
-- sai karthik patri

select count(movie_id) from genre where movie_id is null;
select count(genre) from genre where genre is null;

select count(id) from names where id is  null;

select count(known_for_movies) from names where known_for_movies is not null;
select count(name) from names where name is  null;
select count(height) from names where height is null;
select count(date_of_birth) from names where date_of_birth is null;
select count(known_for_movies) from names where known_for_movies is null;

select count(movie_id) from ratings where movie_id is null;
select count(avg_rating) from ratings where avg_rating is null;
select count(total_votes) from ratings where total_votes is null;
select count(median_rating) from ratings where median_rating is null;


select count(*) - count(movie_id), count(*)-count(name_id),count(*)-count(category) from role_mapping where movie_id is null or name_id is null or category is null;


select * from movie;
select count(*)-count(id), count(*)-count(title),count(*)- count(year), count(*)-count(date_published),count(*)-count(duration),
count(*)-count(country),count(*)-count(worlwide_gross_income),count(*)-count(languages),count(*)-count(production_company) from movie where 
id is null or title is null or year is null or  date_published is null or duration is null or country is null or worlwide_gross_income is null or languages is null or
production_company is null;

-- activity 3

select * from movie;

select year, count(id) from movie group by year;
-- sai karthik patri

select month(date_published) as mnth, count(id) from movie group by mnth;

select month(date_published) as mnth, count(id) from movie group by mnth ;

select year, month(date_published) as mnth,count(*) as mvs from movie where month(date_published)=3  group by year order by mvs desc limit 1;
-- sai karthik Patri

select count(id) from movie where country in ('India','USA') and year=2019;
-- sai Karthik Patri


-- 5 find the unique list of genre in data set

select * from genre;
select distinct(genre) from genre;
-- sai karthik patri


--  6 which genre has the highest number of movies

select * from genre;
select * from movie;

select count(m.id) as cnt,g.genre from movie m inner join genre g where m.id = g.movie_id group by genre order by cnt desc limit 1 ;
-- sai karthik patri

-- 7 movies with 1 genre

select * from genre;
create table newcpy select movie_id , genre from genre group by movie_id having count(distinct genre) = 1;
select count(*) from newcpy;
-- sai karthik patri

-- 8

select * from movie;
select g.genre,avg(m.duration) from genre g inner join movie m where g.movie_id = m.id group by genre;
-- sai Karthik patri 

-- 9
select * from movie;
select count(m.id) as cnt,g.genre from movie m inner join genre g where m.id = g.movie_id group by genre  order by cnt desc ; 
-- sai karthik patri

