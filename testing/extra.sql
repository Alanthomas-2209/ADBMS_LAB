select avg(salary) from employee;

select emp_no , emp_name from employee where Designation = (select Designation from employee where emp_name = "shiva");

select emp_no , emp_name from employee where salary > (select salary from employee where emp_no = 3);

-- DELETE FROM table_name; 