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

