show databases;

-- ctrl + enter => 單行執行

-- 建立資料庫

create database myShop;

-- 進入資料庫, use完接select

use myShop;

-- 刪除資料庫

drop database myShop;

select database();

use world;

show databases;

select true, true, true, true;

-- 進入database - myShop

use myShop;

-- 確認where

select database();

-- 在myShop內建立member表格

create table members( memberName varchar(50), memberAge int );

show tables;

show columns from members;

desc members;

-- 刪除資料表members

drop table members;

show tables;

-- 建立資料表nembers2

create table
    nembers2(
        memberId int,
        memberName varchar(100),
        memberLocation varchar(50),
        memberOrder tinyint
    );

show tables;

desc nembers2;

-- table 新增內容

INSERT INTO
    nembers2(
        memberId,
        memberName,
        memberLocation,
        memberOrder
    )
values (1001, "sunny", "USA", 3), (1001, "leo", "USA", 3), (1001, "leo", "USA", 3), (1001, "leo", "USA", 3);

SELECT * FROM nembers2;

-- #41 新增資料 inser into data

show tables;

create table
    phone_products(
        product_name varchar(50),
        brand varchar(50),
        price int
    );

insert into
    phone_products(product_name, brand, price)
values ("iphone 12", "Apple", 19900), ("Pixel 5", "Google", 18900), ("Galaxy s21", "Samsung", 19800);

SELECT * FROM phone_products;

show tables;

-- #44  NULL

show tables;

create table
    phone_products2(
        product_name varchar(50) not null,
        brand varchar(50) not null,
        price int
    );

desc phone_products2;

insert into phone_products2(brand) values("iphone 12");

-- #45  default

show tables;

-- default 預設不為null 可以避免未傳值報錯

create table
    phone_products3(
        product_name varchar(50) not null default "unname",
        brand varchar(50) not null default "not sure",
        price int default 0
    );

desc phone_products3;

insert into phone_products3(brand) values("iphone 12");

SELECT * FROM phone_products3;

-- #47  不含 not null 的 default

show tables;

-- null 和 default 可以同時存在

create table
    phone_products4(
        product_name varchar(50) default "unname",
        brand varchar(50) default "not sure",
        price int default 0
    );

desc phone_products4;

insert into
    phone_products4(product_name, brand)
values("iphone 12", null);

SELECT * FROM phone_products4;

-- #51

show tables;

-- 主健primary key

create table
    phone_products5(
        product_id int not null,
        product_name varchar(50) default "unname",
        brand varchar(50) default "not sure",
        price int default 0,
        primary key(product_id)
    );

desc phone_products5;

insert into
    phone_products5(
        product_id,
        product_name,
        brand
    )
values (1001, "iphone 12", null);

SELECT * FROM phone_products5;

drop table phone_products5;

-- #52

-- auto increment

show tables;

create table
    phone_products6(
        product_id int auto_increment,
        product_name varchar(50) default "unname",
        price int default 0,
        primary key(product_id)
    );

insert into
    phone_products6(product_name, price)
values ("iphone 12", 1000), ("iphone 12", 1000), ("iphone 12", 1000);

select * from phone_products6;

-- #54

-- auto increment

show tables;

create table
    phone_products7(
        product_id int auto_increment,
        product_name varchar(50) default "unname",
        price int default 0,
        primary key(product_id)
    );

-- id值會 follow 前一個

insert into
    phone_products7(product_name, price)
values("iphone 12", 1000);

insert into
    phone_products7(
        product_id,
        product_name,
        price
    )
values (1001, "iphone 13", 1000);

insert into
    phone_products7(product_name, price)
values("iphone 12", 1000);

select * from phone_products7;

-- #55

-- 指定auto_increment

show tables;

create table
    phone_products8(
        product_id int auto_increment,
        product_name varchar(50) default "unname",
        price int default 0,
        primary key(product_id)
    );

alter table phone_products8 auto_increment = 100;

insert into
    phone_products8(product_name, price)
values("iphone 12", 1000);

insert into
    phone_products8(product_name, price)
values("iphone 12", 1000);

select * from phone_products8;

-- #56

-- 表格實作

show tables;

create table
    my_food(
        food_id int auto_increment,
        food_name varchar(50),
        food_location varchar(50),
        food_price int,
        primary key(food_id)
    );

insert into
    my_food(
        food_name,
        food_location,
        food_price
    )
values ("薯條", "賣噹噹", 100), ("薯條", "賣噹噹", 100), ("薯條", "賣噹噹", 100);

select * from my_food;

-- #59

-- 資料操作 CRUD

show tables;

create table
    employee(
        emp_id int not null auto_increment,
        emp_name varchar(50),
        emp_department varchar(50),
        emp_age int,
        primary key(emp_id)
    );

insert into
    employee(
        emp_name,
        emp_department,
        emp_age
    )
values ('Tony', 'HR', 35), ('Amy', 'RD', 30), ('Jenny', 'Sells', 28), ('Tom', 'RD', 22), ('Betty', 'HR', 25), ('John', 'Account', 36), ('Mary', 'Sells', 22);

select * from employee;

select emp_name, emp_age from employee;

select emp_department, emp_age from employee;

select emp_age from employee;

select * from employee where emp_age > 28;

select * from employee where emp_name = "Tom" or emp_name = "Betty" ;

select * from employee where binary emp_name = "Tom";

-- #63 練習

select emp_name ,emp_department from employee;

select emp_id from employee;

select emp_name, emp_age from employee where emp_department = 'HR';

-- Aliases

select
    emp_name as "name",
    emp_age as "age"
from employee
where emp_department = 'HR';

update employee
set
    emp_department = "Accounting"
where
    emp_department = "Account";

select * from employee;

update employee set emp_age = "31" where emp_name = "Amy";

select * from employee;

update employee set emp_name = "Johnny" where emp_name = "John";

select * from employee;

select * from employee where emp_name="johnny";

DELETE FROM employee WHERE emp_name = "johnny";

select * from employee;