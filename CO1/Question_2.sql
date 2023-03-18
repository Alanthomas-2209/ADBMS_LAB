show databases;
use  organisation;
show tables;
select * from department;
select * from employee;
describe employee;
describe department;
alter table employee add Designation varchar(20);
update employee set Designation = 'teacher' where emp_no =3;
update employee set Designation = 'typist' where emp_no =2;
update employee set Designation = 'Data scientist' where emp_no =5;
update employee set Designation = 'software engineer' where emp_no =1;
update employee set Designation = 'teacher' where emp_no =4;
update employee set salary = 2200 where emp_no =4;
update employee set salary = 4500 where emp_no =3;
update employee set salary = 25000 where emp_no =5;
select emp_no,emp_name,Designation,dept_no,salary from employee order by salary desc;
select emp_no,emp_name from employee where salary between 2000 and 5000;
select distinct Designation from employee;
insert into employee values (6,'john',2001-12-09,'banglore',2020-03-10,1203,4,3400,'Data Scientist');
update employee set Designation = "typist" where salary = 25000;
update employee set mobile_no = 87584567 where  emp_name = "john";
delete from employee where salary = 7000;
-- select dept_name, sum(salary) from department,employee where department.dept_no = 1 and department.dept_no = 1 and department.dept_no = 2;
-- select employee.sum(salary), department.dept_name  from employee inner join department where  employee.dept_no = department.dept_no;

select department.dept_name, sum(employee.salary) as total_salary from department join employee on department.dept_no = employee.dept_no group by department.dept_name;


select department.dept_name, sum(employee.salary) as total_salary from department join  employee on ( department.dept_no = employee.dept_no)  group by department.dept_name having sum(employee.salary) > 25000;