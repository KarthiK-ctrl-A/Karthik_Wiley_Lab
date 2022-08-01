-- DDL Commands --
-- Data Definition Language
-- create and alter

create database if not exists salesdb;

use salesdb;

create table test(
	firstcol decimal
);

select * from test;

drop table test;

create table Test( 
	firstcol decimal(5,3)  -- total lenght 5 includeing decimal, 3 precsion i.e. after decimal
);

insert Test values(10.5432);
select * from Test;

insert Test values(34.2345);

select * from Test;

-- altering table, adding column

alter table Test add column secondCol int after firstcol;

select * from Test;

-- Auto increment or identity columns : are those columns which generate values on there own

create table Customers (
	purchase_number int not null auto_increment primary key,
    date_of_purchase date not null,
    customer_id int unique,
    item_code varchar(10) not null
);

insert Customers (date_of_purchase, customer_id, item_code) values ('2022-07-22',101,'P001');
insert Customers (date_of_purchase, customer_id, item_code) values ('2022-07-25',102,'P010');
insert Customers (date_of_purchase, customer_id, item_code) values ('2022-07-24',103,'P011');
insert Customers (date_of_purchase, customer_id, item_code) values ('2022-07-23',104,'P000');

select * from Customers;

create table orders(
	orderid int auto_increment primary key,
    qty int not null,
    txnvalue int not null,
    orderdate date not null
);

insert orders (qty,txnvalue,orderdate) values (12, 30000,'2022-07-09');

select * from orders;

create table transactions(
	transactionid int primary key,
    txnvalue int,
    cust_id int,
    txndate date,
    
    foreign key(cust_id) references Customers(customer_id)
);

insert transactions values(1001,300000,101,'2022-07-022');
insert transactions values(1002,300000,108,'2022-07-023');

select * from transactions;

-- deafault contraint
create table customer_complaints(
	customer_id int auto_increment primary key,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(200),
    numberofcompalints int default 0
);

insert customer_complaints values(1201,'mark','zukerberg','mark@meta.com',1000);
insert customer_complaints values(1202,'sundar','pichai','sundar@google.com',default);

select * from customer_complaints;

desc customer_complaints;
-- drop constraint
alter table customer_complaints alter column numberofcompalints drop default;

desc customer_complaints;

alter table customer_complaints modify numberofcompalints varchar(255);

desc customer_complaints;

alter table customer_complaints change column numberofcompalints greviances int not null default 0;

desc customer_complaints;

-- alter => to add/ remove column
-- modify toi change datatype of col
-- change to change name and datatype of column

-- select queries

use world;
show tables;

select * from city;
select * from country;
select * from countrylangiuage;

select name,district,population from city; 

-- we can compute column mathematically

select name, district, population, population+1000 as newPop from city;

-- filter rows using where keyword

select * from city where id=24;

select * from city where population < 1000;

select * from city where id%2=0;

select * from city where district ='Nevada';













