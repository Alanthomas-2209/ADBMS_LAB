show databases;
use  organisation;
show tables;
select * from department;
select * from employee;

-- 	Display the empno, name, and salaries for employees whose average salary is higher than the average salary of the organization
select emp_no , emp_name, salary from employee where salary > ( select avg(salary) from employee);

-- 	Display the details of employees whose salary is equal to the minimum salary of organisation.
select * from employee where salary = (select min(salary) from employee);

-- 	Display all the employees whose designation is same as that of ‘Arun’
select emp_name from employee where Designation = (select Designation from employee where emp_name = 'Arun');

-- 	display the empno and name of employees who earn more than any Employee in dept 1.
select emp_no, emp_name from employee where salary > (select salary from employee where dept_no = 1 );

-- 	Display the empno,name , departments that the departments are same in both the emp and dept


-- 	Display the employee details by implementing left inner join
select * from employee E left join department D on E.dept_no = D.dept_no;

-- 	Display employee details by implementing a right outer join.
select * from employee E right join department D on E.dept_no = D.dept_no;
