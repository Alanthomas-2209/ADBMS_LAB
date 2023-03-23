create database organisation;
show databases;
use organisation;
create table employee(emp_no int primary key,emp_name varchar(20),DOB date, address varchar(30),doj date,mobile_no int not null, dept_no int not null,salary int);
describe employee;