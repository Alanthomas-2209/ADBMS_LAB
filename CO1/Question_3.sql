show databases;
use  organisation;
show tables;
select * from department;
select * from employee;
select avg(salary) from employee;

select emp_no , emp_name, salary from employee where salary > ( select avg(salary) from employee);

select emp_no , emp_name from employee where Designation = (select Designation from employee where emp_name = "shiva");

select emp_no , emp_name from employee where salary > (select salary from employee where emp_no = 3);