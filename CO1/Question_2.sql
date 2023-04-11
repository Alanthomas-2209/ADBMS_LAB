show databases;
use  organisation;
show tables;

-- Add 5 rows in the employee and dept tables.
insert into employee values(1,'jithin','2008-11-11','cherthala','2018-11-21',12323131,2,5000,'software engineer'),
(2,'Abhinand','2001-01-14','pathanamthitta','2018-11-21',4545131,2,1000,'typist'),
(3,'Hrishiraj GL','2001-12-09','banglore/tvm/kollam','2018-11-21',78793131,1,3000,'teacher'),
(4,'Shiva','1998-01-23','tvm','2016-11-21',98723131,3,4500,'teacher'),
(5,'john','2001-11-11','cherthala','2018-11-21',8111568424,5,7000,'Data scientist');

insert into department values (1,'MCA','MCABLOCK'),
(2,'BCA','BCABLOCK'),
(3,'Electrical','EEE block'),
(4,'mech','mechblocjk'),
(5,'AI','computer block');

-- Display all the records from the above tables
select * from department;
select * from employee;
describe employee;
describe department;

-- Display the empno and name of all the employees from department no2
select emp_no,emp_name from employee where dept_no = 2;

-- Display empno,name,designation,dept no and salary in the descending order of salary
select emp_no,emp_name,Designation,dept_no,salary from employee order by salary desc;

-- Display the empno and name of all employees whose salary is between 2000 and 5000
select emp_no,emp_name from employee where salary between 2000 and 5000;

-- Display all designations without duplicate values.
select distinct Designation from employee;

-- Display the dept name and total salary of employees of each department.
select department.dept_name, sum(employee.salary) as total_salary from department join employee on department.dept_no = employee.dept_no group by department.dept_name;

-- Change the salary of employees to 25000 whose designation is ‘Typist’
update employee set Designation = "typist" where salary = 25000;

-- Change the mobile no of employee named ‘john’
update employee set mobile_no = 87584567 where  emp_name = "john";

-- Delete all employees whose salaries are equal to Rs.7000
delete from employee where salary = 7000;

-- Select the department that has total salary paid for its employees more than 25000
select department.dept_name, sum(employee.salary) as total_salary from department join  employee on ( department.dept_no = employee.dept_no)  group by department.dept_name having sum(employee.salary) > 25000;
