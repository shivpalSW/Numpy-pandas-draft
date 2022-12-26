set autocommit=0;
set sql_safe_updates=0;
use FirstDB;
show tables;

-- import csv to database:
select * from emp_data;
select 'emp id' from emp_data;
select count('emp id') from emp_data;-- if you have spaces in column name,write it inside quotes while accessing the column

CREATE TABLE EMP(EMP_ID INT,FNAME VARCHAR(10),LNAME VARCHAR(10),SALARY INT,LOC VARCHAR(10));
desc emp;

SELECT * FROM EMP;

INSERT INTO EMP VALUES(1001,'AKSHAY','SHAH',10000,'PUNE'),
                       (1002,'SAMEER','GUPTA',20000,'PUNE'),
                       (1003,'SWAPNIL','K',30000,'MUMBAI'),
                       (1004,'SHITAL','M',40000,'HYDERABAD'),
                       (1005,'KUNAL','KUNDRA',70000,'MUMBAI');

SELECT * FROM EMP;

-- like operator
-- % : used for 0 or more charecters
-- _ : used for single charecter

SELECT * FROM EMP WHERE FNAME LIKE 'S%';
SELECT * FROM EMP WHERE FNAME LIKE 'S__%';
SELECT * FROM EMP WHERE FNAME LIKE 'S__'; -- should not give any output as we dont have name starting with s and having length 3

-- case statement

select fname,lname,salary,
case
when salary<=10000 then 'underpaid'
when salary between 10000 and 30000 then 'correctly paid'
else 'highly paid'
end
as salary_group
from emp;

-- delete 
delete from emp; -- will delete all the records from table emp
delete from emp where empid=1001; -- will delete row of empid 1001
truncate table emp; -- used to empty the table
drop table emp; -- delete data as well as struture of the table from database
drop database MyDatabase; -- used to drop database 

-- mathematical operations
select max(salary) from emp;
select min(salary) from emp;
select sum(salary) from emp;
select avg(salary) from emp;

-- select top n rows from a table
select * from emp limit 2;

-- AUTO_INCREMENT :
-- used to increment any col value
-- mandatory to have the column as primary key if you want to auto increment it
-- no need to insert a seprate value if you are using auto increment
-- default start value will be 1 ,change it using alter table

create table emp_auto_inc(empid int auto_increment,fname varchar(10),primary key (empid));
insert into emp_auto_inc(fname) values ('kanchan'); -- insert 1 as empid
insert into emp_auto_inc(fname) values ('subodh'); -- insert 2 as empid

select * from emp_auto_inc;

ALTER TABLE emp_auto_inc AUTO_INCREMENT=100; -- use to change the default start value for auto incremented column

insert into emp_auto_inc(fname) values ('pavitra');

select * from emp_auto_inc;

-- trim,ltrim,rtrim : used to trim unwanted charecters from a string
select trim('  string  '); -- string
select trim(fname) from emp;
select ltrim(fname) from emp; 
select rtrim(fname) from emp; 

-- replace 
select replace(fname,'A','@') from emp;

-- upper, lower
select upper('string');
select upper(fname) from emp;
select lower(fname) from emp;

-- grant ,select : totally resides with Admit team
-- grant <privillage list> on <tbl_name> to <user>
-- revoke <privilage list> on <tbl_name> from <user>

-- distinct : used to fetch unique values from that column
select distinct(salary) from emp;

-- substr

select substr('mydb',2,2);
select substr(fname,2,2) from emp;
select substr(fname,-1,2) from emp;

-- group by
select salary from emp group by salary;
select salary from emp group by salary having salary>1000;

-- primary and foreign key
create table emp_pk(empid int auto_increment,fname varchar(10),
primary key (empid));

create table dept_fk(deptid int auto_increment,empid int,fname varchar(10),
primary key (deptid),
foreign key(empid) references emp_pk(empid));

-- can not insert a key in child table if it is not present in parent
-- can not delete a key from child table if it is present in parent table








