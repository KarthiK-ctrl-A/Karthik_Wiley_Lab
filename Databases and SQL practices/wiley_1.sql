-- create database --
create database wiley_275;

use wiley_275;

-- create table --

Create table Products(
	product_id int primary key,
    pname varchar(255),
    price float not null,
    pdesc varchar(500)
);
-- table's data suing select -- 

select * from Products;

-- inseert record using insert syntax --
-- syntax insert <tab_name> values (????);

insert Products values(101,'Victus Laptop',60000,'Gaming and performance
 Laptop');
 
 select * from Products;
insert Products values(102,'HP Pavilion',70000,'Gaming Laptop');
insert Products values(103,'Acer Predator',100000,'Gaming');
insert Products values(104,'Lenovo Ideapad 3',45000,'Budget Laptop');

select * from Products;

-- quick primaru key check -- 

insert Products values(101,'jfkdng',3974,'rfg');

-- working with forign keys --

create table sales(
	prod_id int,
    qty int,
    orderdate date,
    foreign key (prod_id) references Products(product_id)
);

select * from sales;

insert sales values(102,24,'2021-02-26');

select * from sales;

-- checking for ref intergrity -- 
insert sales values(110,22,'2000-09-00');

-- Boost your confidence activity -- 

create database Academy;

use Academy;
create table students(
	studetn_id int primary key,
    student_name varchar(100),
    student_address varchar(255),
    student_city varchar(100),
    nationality varchar(100),
    student_age int
);

create table Courses(
	course_id int primary key,
    cname varchar(200),
    cduration int,
    cdescription varchar(500),
    course_fee float not null
);

create table subscriptions(
	stud_id int,
    course_id int,
    foreign key (stud_id) references students(studetn_id),
    foreign key (course_id) references Courses(course_id)
);


insert students values(1,'mark','Wall street','NYC','American',21);
insert Courses values(101,'CSE',200,'Computer Engg',50000);

insert subscriptions values(1,101);

select * from students;
select * from Courses;
select * from subscriptions;

--
--
 -- 29 - 07 2022 --
--
--
--



































