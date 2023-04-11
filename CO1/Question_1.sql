create database organisation;
show databases;
use organisation;
show tables;
create table employee(emp_no int primary key,emp_name varchar(20),DOB date, address varchar(30),doj date,mobile_no int not null, dept_no int not null,salary int);
describe employee;
select * from employee;
create table department(dept_no int, dept_name varchar(20),location varchar(20)); 
alter table department add primary key(dept_no);
select * from department;
describe department;
alter table employee add foreign key(dept_no) references department(dept_no);

insert into employee values(1,'jithin','2008-11-11','cherthala','2018-11-21',12323131,2,5000);
insert into employee values(2,'Abhinand','2001-01-14','pathanamthitta','2018-11-21',4545131,2,1000),
(3,'Hrishiraj GL','2001-12-09','banglore/tvm/kollam','2018-11-21',78793131,1,3000),
(4,'Shiva','1998-01-23','tvm','2016-11-21',98723131,3,4500);
insert into employee values(5,'Alan','2001-11-11','cherthala','2018-11-21',8111568424,5,3000);

insert into department values (1,'MCA','MCABLOCK'),
(2,'BCA','BCABLOCK'),
(3,'Electrical','EEE block'),
(4,'mech','mechblocjk'),
(5,'AI','computer block');

-- Add a new column Designation to the employee table
alter table employee add Designation varchar(20);

update employee set Designation = 'teacher' where emp_no =3;
update employee set Designation = 'typist' where emp_no =2;
update employee set Designation = 'Data scientist' where emp_no =5;
update employee set Designation = 'software engineer' where emp_no =1;
update employee set Designation = 'teacher' where emp_no =4;

-- Drop the column location from Dept table
alter table department DROP COLUMN location;


-- Drop the tables
drop table employee;
drop table department;
# drop table employee,department;

-- Delete the database
drop database organisation;