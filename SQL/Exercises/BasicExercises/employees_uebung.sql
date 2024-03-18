use employees;

select ename, job from emp where deptno = 30;

select ename, sal from emp where deptno = 30 and sal >= 1500;

select ename, deptno from emp where job like 'manager' and deptno != 30; 

select ename, job from emp where deptno = 10 and job not in ('Manager', 'Clerk');

select ename, sal, deptno from emp where sal between 1200 and 1300;

select ename, (comm - sal) from emp where sal < comm;

select ename, sal, job from emp where char_length(ename) = 5 and ename like 'all%';

select ename, job, deptno from emp where job in ('clerk','analyst','salesman','manager');

