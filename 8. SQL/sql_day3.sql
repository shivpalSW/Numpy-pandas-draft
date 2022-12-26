set autocommit=0; 
set sql_safe_updates=0;

select * from emp_data;
select * from dept;

select distinct location from dept;
select location,count(1) from dept group by location;

-- query to display duplicate records
select location,count(1) from dept group by location having count(1)>1;

-- SQL joins
-- inner join : all matching rows from both tables
-- left join : all rows from left table and matching rows from right table
-- right join : all rows from right table and matching rows from left table
-- self join : joins the table with itself

select * from table1;
/* 
a         a
a         a
b         d
c         b
null
d */

select * from table2;
/* 
a
a
d
b
*/

select * from table1 right join table2 on table1.col1 =table2.col2;

select * from emp_data;
select * from dept;
select * from emp_data inner join dept on emp_data.empid=dept.empid;

select emp_data.empid,dept.empid from emp_data inner join dept on emp_data.empid=dept.empid;

-- union and union all

select * from table1 left join table2 on table1.col1 =table2.col2
union -- union will remove duplicates
select * from table1 right join table2 on table1.col1 =table2.col2;


select * from table1 left join table2 on table1.col1 =table2.col2
union all -- union will remove duplicates
select * from table1 right join table2 on table1.col1 =table2.col2;

-- fetch the list of employees who are mgrs
select e.empid,d.email 
from emp_data e join emp_data d
on e.empid= d.mgr;

-- find max salary
select salary from emp_data order by salary desc;
select max(salary) from emp_data; -- 197537

select max(salary) from emp_data where salary not in (select max(salary) from emp_data);

/* 50
40
30
20
10 */

select max(salary) from emp_data where salary != (select max(salary) from emp_data);

select salary from (
select salary from emp_data order by salary desc limit 2)
as emp order by salary limit 1;


select salary from (
select salary from emp_data order by salary desc limit 3)
as emp order by salary limit 1;


select min(salary) from (
select salary from emp_data order by salary desc limit 3)
as emp;


/* select min(salary) from (
select salary from emp_data order by salary desc limit n)
as emp; */

select e.empid,d.empid from emp_data e right join dept d on e.empid=d.empid;
select count(1) from emp_data; -- 100
select count(1) from dept; -- 37

-- case statement
select * from emp_data;

update emp_data set mgr=
case empid
when 677509 then 539712
when 940761 then 539712
end 
where empid in (677509,940761);

update emp_data set mgr= 539712 where empid=408351;


update emp_data set mgr=
case empid
when 153989 then 528509
when 441771 then 539712
end 
where empid in (153989,441771);

select * from emp_data where empid in (153989,441771);

-- connect to the database using jupyter notebook
-- pip install mysql-connector-python










 






