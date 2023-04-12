-- Question 3
create database customer;
use customer;

-- a
create table customer (
CID int,
NAME varchar(20),
 primary key(CID));
 
create table product (
  PCODE int primary key,
  PNAME varchar(50),
  UNIT_PRICE decimal(10,2)
  );
  
create table  cust_order (
OCODCE int primary key,
ODATE date,
CID int,
foreign key(CID) references customer(CID)
);

create table order_product (
OCODE int,
PCODE int,
NOU int ,
primary key(OCODE , PCODE),
foreign key (OCODE) references cust_order (OCODCE),
foreign key (PCODE) references product (PCODE)
);

alter table cust_order change column OCODCE  OCODE int; 
describe product;
describe cust_order;
describe order_product;
describe customer;

-- b
insert into customer (CID, NAME) values (1,'john');
insert into customer (CID, NAME) values (2,'jane');
insert into customer (CID, NAME) values (3,'Bob');
insert into customer (CID, NAME) values (4,'Alice');

insert into product (PCODE,PNAME,UNIT_PRICE) values (1,'Laptop',1200),
(2,'Mouse',20),
(3,'Server',5000),
(4,'Air conditioner',800);

insert into  cust_order (OCODE,ODATE,CID) values (1001,'2022-01-01',1),
(1002,'2022-08-02',2),
(1003,'2022-09-03',3),
(1004,'2022-01-01',4);
insert into cust_order (OCODE,ODATE,CID) values (1005,'2022-01-03',1);

insert into order_product (OCODE,PCODE,NOU) values (1001,1,2),
(1002,2,3),
(1003,3,1),
(1004,4,2),
(1005,2,4);
update order_product set PCODE = 4 where OCODE = 1004;
select * from product;
select * from customer;
select * from order_product;
select * from cust_order;

-- c
alter table product add constraint ck_pname check(PNAME IN ('Laptop','Server','Mouse','Air conditioner'));

-- d
select PCODE,PNAME,UNIT_PRICE from product where UNIT_PRICE > (select avg(UNIT_PRICE) from product);

-- e
select customer.NAME,order_product.NOU from (customer inner join cust_order on (cust_order.CID = customer.CID) inner join order_product on (cust_order.OCODE = order_product.OCODE) ) where order_product.NOU = (select max(NOU) from order_product) ;

-- f
create view Display as (select product.PCODE,product.PNAME,order_product.NOU from product left join order_product on product.PCODE = order_product.PCODE  where product.PCODE = order_product.PCODE);
select * from Display;
-- create or replace view Display as (select product.PNAME, order_product.PCODE,order_product.NOU from product  join order_product on product.PCODE = order_product.PCODE group by product.PNAME);
-- select * from Display;
-- create or replace view Display as(select product.PCODE,product.PNAME,order_product.NOU from product left join order_product on product.PCODE = order_product.PCODE  where product.PCODE = order_product.PCODE);

