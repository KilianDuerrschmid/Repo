drop database if exists ue11;
create database ue11;
use ue11;
 
 create table if not exists tasks(
 task_id int auto_increment primary key,
 title varchar(255) not null,
 start_date date,
 due_date date,
 status tinyint not null,
 priority tinyint not null,
 description text,
 created_at timestamp default current_timestamp
 ) engine=InnoDB;
 
 show tables;
 
 insert into tasks(title, start_date, due_date,status,priority,description)
 values('task1', now(), now(), 1, 1, 'Text1'),
 ('task2', now(), now(), 2, 2, 'Text2'),
 ('task3', now(), now(), 3, 3, 'Text3');
 
 select* from tasks;
 
 create table employees(
 employee_id int(6) not null,
 first_name	varchar(20) default null,
 last_name varchar(25) default null,
 email varchar(25) default null,
 phone_number varchar(20) default null,
 hire_date date default null,
 job_id varchar(10) default null,
 salary float default null,
 commission_pct float default null,
 manager_id int(6) default null,
 department_id	int(4) default null
 ) engine = innoDB default charset=utf8mb4;
 
 show tables;
 
 desc employees;
 
 select*from employees;
 
 