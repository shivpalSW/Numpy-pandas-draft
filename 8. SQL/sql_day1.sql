SELECT * FROM NewDB.emp_data;

/* create table tbl_name( col1 datatype,
				col2 ddatatype,
                
                coln datatype); */
                
create table emp (empid int,fname varchar(10),lname varchar(10),salary int,loc varchar(10));
create table emp_bkp as select * from emp;
select * from emp;

desc emp;
show tables;

INSERT INTO EMP VALUES(1001,'AKSHAY','SHAH',10000,'PUNE');

INSERT INTO EMP (EMPID,FNAME,LNAME,SALARY) VALUES('1002','SAMEER','GUPTA',20000);

INSERT INTO EMP (EMPID,FNAME,LNAME,SALARY) VALUES('1002','SAMEER','GUPTA');

INSERT INTO EMP VALUES(1003,'SWAPNIL','K',30000,'MUMBAI'),
                       (1004,'SHITAL','M',40000,'HYDERABAD');
                       
                       
INSERT INTO EMP (FNAME,LNAME) VALUES('SAMEER','GUPTA');

INSERT INTO EMP (FNAME,LNAME) VALUES('sameer','gupta');
/*NOT NULL */

CREATE TABLE EMP_NOT_NULL (EMPID INT NOT NULL);

SELECT * FROM EMP_NOT_NULL;
DESC EMP_NOT_NULL;
INSERT INTO EMP_NOT_NULL VALUES(NULL);

/* UNIQUE --ALLOW NULLS, IT WILL NOT ALLOW DUPLICATES*/

CREATE TABLE EMP_UNIQUE (EMPID INT NOT NULL,
UNIQUE (EMPID));
DESC EMP_UNIQUE;

SELECT * FROM EMP_UNIQUE;
INSERT INTO EMP_UNIQUE VALUES(1001);

/* PRIMARY KEY ---uniquely identifies a row*/ 

create table emp_pk (empid int,
primary key(empid));

/* Check constraint */
create table emp_check(empid int,fname varchar(10),age int, check (age >20));
insert into emp_check (age) values(30);

/* dafault */

create table emp_default( empid int,empdept varchar(10) default 'HR',city varchar(5) default 'pune';
INSERT INTO emp_default (EMPID) VALUES (1005);
select * from emp_default;

/* alter table--add column drop column,modify data type */
desc emp;
alter table emp add age int;
alter table emp modify column age varchar(10);
alter table emp drop age;

/* update */
select * from emp;
update emp set loc='pune' where empid=1004;
 
set sql_safe_updates=0;

/* where -specify a condition to retrive data*/
select * from emp where loc='pune';
select * from emp;

select * from emp where loc ='pune' or loc='mumbai';

select * from emp where loc ='pune' and  loc='mumbai';
select * from emp where loc  in ('pune','mumbai');
select * from emp where loc not in ('pune');

select * from emp;
select * from emp where loc is null;
select * from emp where loc is not null;
select * from emp where salary between 10000 and 30000;
select salary,salary*1.25 as new_sal from emp ;/*new_sal is a alias for calculated column*/

/*count*/
select count(*) from emp;
select count(1) from emp;

/*order by */ 
select * from emp;
select * from emp order by loc;/*default order is assending */
select * from emp order by loc desc;
select * from emp order by salary desc;

insert into emp (fname) values('sw@pnil');
select * from emp where fname like '%@%';

create table keyword_details(command varchar(20),description varchar(300))
select * from keyword_details;
insert into keyword_details values ('show_databse','gives list of databases present');
/*create database
use database
create table
show tables
desc
insert into
select
update
not null
unique
primary key
between
drop
default
alter table
modify column
check constraint
order by
or,and
where
distinct
count
in,not in
like
alias
*/ 	






