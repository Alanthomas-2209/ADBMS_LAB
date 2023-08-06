create database exam;
use exam;

create table department(deptno int primary key, dname varchar(10),loc varchar(10));
create table employee(empno int primary key, ename varchar(10),job varchar(10),mgr varchar(10),hiredate date, sal int,commission varchar(10) ,deptno int,foreign key(deptno) references department(deptno));

SELECT * FROM employee;
desc employee;

SELECT * FROM department;
desc department;

INSERT INTO `exam`.`employee`
(`empno`,
`ename`,
`job`,
`mgr`,
`hiredate`,
`sal`,
`commission`,
`deptno`)
VALUES
(1,'alan','dev','amjad','2020-12-5',30000,'abcd',30),
(2,'hari','clerk','amjad','2020-12-5',15000,'abcd',30),
(3,'naveen','clerk','amjad','2020-12-5',15000,'abcd',30),
(4,'kevin','clerk','rais','2020-12-5',15000,'abcd',55),
(5,'amal','clerk','nidal','2020-12-5',15000,'abcd',10),
(6,'LARAVEL','designer','amjad','2020-12-5',50000,'abcd',10),
(7,'shiva','tester','rais','2020-12-5',20000,'abcd',55)
;

select * from employee where deptno=10;
select * from employee where deptno=55;

INSERT INTO `exam`.`department`
(`deptno`,
`dname`,
`loc`)
VALUES
(10,'design','tvm'),
(30,'deploy','ekm'),
(55,'test','alappy');

select count(empno) as counts from employee where job = 'clerk';

select  employee.deptno, department.dname from employee inner join department on employee.deptno = department.deptno  where employee.job = 'clerk' group by employee.deptno having count(employee.empno) = 1;

select employee.deptno, department.dname, count(employee.empno) as counts from employee inner join department on employee.deptno = department.deptno  group by deptno;

select employee.deptno, department.dname , avg(sal) as avgsalary from employee inner join department on employee.deptno = department.deptno group by deptno order by avgsalary asc limit 1;

select ename from employee where ename like "LA%";

select * from employee where deptno = 10 and sal >= (select min(sal) from employee where deptno=30);