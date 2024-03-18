use ue11;

select * from employees;

select * from employees where employee_id < 150;
select * from employees where employee_id < 140 and employee_id > 120;
select * from employees where employee_id between 120 and 140;
select * from employees where employee_id between 120 and 140 order by first_name desc;
select * from employees where first_name like 'Alana';
select * from employees where first_name like 'A%';
select * from employees where not first_name like 'A%';
select * from employees where first_name like '%A%';
select * from employees where salary > 10000;
select * from employees where salary > 10000 and job_id like 'SA_MAN';
select avg(salary) Einkommen from employees;
select round(avg(salary), 2) Einkommen from employees;
select sum(salary) Gesamteinkommen from employees;
select * from employees where salary > (select avg(salary) from employees);
select distinct job_id from employees;
select avg(salary), job_id from employees group by job_id;
select avg(salary), job_id from employees group by job_id order by job_id;
select avg(salary), job_id from employees where job_id like 'st%' group by job_id order by job_id;

select first_name, last_name, 
(salary * commission_pct) as commission from employees;

select first_name, last_name, (salary + (salary * ifnull(commission_pct, 0)))
as Gesamt from employees;

select * from employees;

create or replace view commission as select last_name, salary,
coalesce(commission_pct, 0) as commission_new
from employees;

select * from commission;

drop view commission;

show full tables where table_type = 'VIEW';




