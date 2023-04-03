--  Question 1

delete from  department where dept_name = 'MCA';
show databases;
use  organisation;
show tables;
select employee.dept_no, department.dept_name 
from employee inner join department where  employee.dept_no = department.dept_no;
select * from department where dept_no >2;
alter table employee add primary key(emp_no);
select avg(salary) from employee where salary > 0;
select count(emp_no) from employee;
select sum(salary) from employee where salary > 0;
select max(salary) from employee where salary > 0;
select min(salary) from employee where salary > 0;
update employee set salary = 55000 where emp_no = 2; 
describe employee;
 select emp_no , emp_name from employee where dept_no=2;
 drop database organisation;
 
--  Question 2

update employee set salary = 2200 where emp_no =4;
update employee set salary = 4500 where emp_no =3;
update employee set salary = 25000 where emp_no =5;
insert into employee values (6,'john',2001-12-09,'banglore',2020-03-10,1203,4,3400,'Data Scientist');

-- select dept_name, sum(salary) from department,employee where department.dept_no = 1 and department.dept_no = 1 and department.dept_no = 2;
-- select employee.sum(salary), department.dept_name  from employee inner join department where  employee.dept_no = department.dept_no;