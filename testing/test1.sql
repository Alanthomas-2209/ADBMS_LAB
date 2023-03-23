create table employee(emp_no int,emp_name varchar(20),DOB date, address varchar(30),doj date,mobile_no int, dept_no int,salary int);
select * from employee;
create table department(dept_no int, dept_name varchar(20),location varchar(20)); 
select * from department;
insert into department values(1,'MCA','MCABLOCK');
select * from department;
insert into department values(2,'BCA','BCABLOCK'),(3,'Electrical','EEE block');
select * from department;
delete from  department where dept_name = 'MCA';
show databases;
use  organisation;
show tables;
insert into employee values(1,'jithin','2008-11-11','cherthala','2018-11-21',12323131,2,120000);
insert into employee values(2,'Abhinand','2001-01-14','pathanamthitta','2018-11-21',4545131,2,120000),
(3,'Hrishiraj GL','2001-12-09','banglore/tvm/kollam','2018-11-21',78793131,1,230000),
(4,'Shiva','1998-01-23','tvm','2016-11-21',98723131,3,12000);
select employee.dept_no, department.dept_name 
from employee inner join department where  employee.dept_no = department.dept_no;
select * from department where dept_no >2;
alter table employee add primary key(emp_no);
alter table department add primary key(dept_no);
select avg(salary) from employee where salary > 0;
select count(emp_no) from employee;
select sum(salary) from employee where salary > 0;
select max(salary) from employee where salary > 0;
select min(salary) from employee where salary > 0;
update employee set salary = 55000 where emp_no = 2; 
insert into employee values(5,'amjad','2001-01-22','Alappuzha','2018-10-21',123445435,1,450000);
insert into department values(4,'mech','mechblocjk'),(5,'AI','computer block');
alter table employee add foreign key(dept_no) references department(dept_no);
describe employee;
 select emp_no , emp_name from employee where dept_no=2;
 drop database organisation;