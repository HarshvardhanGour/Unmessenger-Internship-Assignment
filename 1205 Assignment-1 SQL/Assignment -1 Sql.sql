create database ORG;


use ORG;
CREATE TABLE ORG
(
Customer_ID INT (23),
Full_Name varchar (23) ,
Email varchar(50),
JoinDate Date
);
select * from ORG;
insert into ORG values(101, "Manu gour", "Manugour2@gmail.com", "2020-10-20");
insert into ORG values(102, "Tanu gour", "Tanugour2@gmail.com", "2021-10-22");
insert into ORG values(103, "Priya verma", "Priya02@gmail.com", "2023-12-01");
insert into ORG values(104, "Saloni gour", "Salonigour99@gmail.com", "2024-01-20");
insert into ORG values(105, "Tanmay neeley", "Tanmayneeley202@gmail.com", "2010-10-25");
insert into ORG values(106, "Rohanraj ", "Rohanraj020@gmail.com", "2019-12-10");
insert into ORG values(107, "Poojagour", "poojagour454@gmail.com", "2021-11-22");
insert into ORG values(108, "riyaverma", "riya02@gmail.com", "2009-12-01");
insert into ORG values(109, "Saloni verma", "Saloniverma909@gmail.com", "2018-01-20");
insert into ORG values(110, "Tanmay gour", "Tanmaygour2@gmail.com", "2010-04-25");

create database orders;

use orders;
CREATE TABLE orders
(
Order_ID INT (23),
Customer_1D int (23) ,
OrderDate Date,
TotalAmount decimal
);
select * from orders;

insert into orders values(101, "0201", "2022-02-02", "4000");
insert into orders values(102, "0202", "2019-08-10", "500");
insert into orders values(103, "0203", "2021-03-23", "5500");
insert into orders values(104, "0204", "2022-04-25", "6000");
insert into orders values(105, "0205", "2022-02-09", "3000");
insert into orders values(106, "0206", "2022-03-12", "2500");
insert into orders values(107, "0207", "2022-11-23", "4200");
insert into orders values(108, "0208", "2022-01-29", "4120");
insert into orders values(109, "0209", "2022-02-04", "4300");
insert into orders values(110, "0210", "2022-03-05", "3500");




create database orderdetails;

use orderdetails;
CREATE TABLE orderdetails
(
OrderDetail_ID INT (23),
Order_ID int (23) ,
Product_ID int(50),
Quantity int (32),
PricePerUnit decimal (10,2)

);
select * from orderdetails;

insert into orderdetails values(123,"01","02","20","2000");
insert into orderdetails values(124,"02","03","22","2250");
insert into orderdetails values(125,"03","04","09","2100");
insert into orderdetails values(126,"04","05","23","2034");
insert into orderdetails values(127,"05","06","30","3122");
insert into orderdetails values(128,"06","07","29","2345");
insert into orderdetails values(129,"07","08","65","2400");
insert into orderdetails values(110,"08","09","77","1900");
insert into orderdetails values(111,"09","10","33","3000");
insert into orderdetails values(112,"10","11","09","5000");

create database Products;

use Products;
CREATE TABLE Products
(
Product_ID INT (23),
Name_full varchar (23),
Category varchar (50),
Price decimal (10,2)
);

select * from Products;

insert into Products values(101,"Iphone","Smartphones","1.50000");
insert into Products values(102,"samsung","Flip Phones","1.2900");
insert into Products values(103," galaxy Z filp","Flip Phones","1.3900");
insert into Products values(104,"Nokia 6700","Slider Phones","1500");
insert into Products values(105,"BlackBerry","QWERTY Phones","12900");
insert into Products values(106,"Sonim Xp5","Rugged Phones","10000");
insert into Products values(107,"samsung galaxy Note20","Phablets","13500");
insert into Products values(108," Oneplus","Foldable Phones","12000");
insert into Products values(109,"Nokia","Slider Phones","45000");
insert into Products values(110,"BlackBerry 354","QWERTY Phones","12900");

