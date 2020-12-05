INSERT INTO EMPLOYEE (EMPLOYEE_ID,EMPLOYEENAME, EMPLOYEESURNAME,AGE,DEPARTMENT) VALUES (4,'Ahmet','Demir',25,'Accounting');
INSERT INTO EMPLOYEE (EMPLOYEE_ID,EMPLOYEENAME, EMPLOYEESURNAME,AGE,DEPARTMENT) VALUES (5,'Mehmet','Korkmaz',26,'CRM');
INSERT INTO EMPLOYEE (EMPLOYEE_ID,EMPLOYEENAME, EMPLOYEESURNAME,AGE,DEPARTMENT) VALUES (6,'Veli','Uyar',28,'Sales');
INSERT INTO EMPLOYEE (EMPLOYEE_ID,EMPLOYEENAME, EMPLOYEESURNAME,AGE,DEPARTMENT) VALUES (7,'Ali ','Tunç',30,'Finance');
INSERT INTO EMPLOYEE (EMPLOYEE_ID,EMPLOYEENAME, EMPLOYEESURNAME,AGE,DEPARTMENT) VALUES (8,'Ay?e','Inan',34,'IT');
INSERT INTO EMPLOYEE (EMPLOYEE_ID,EMPLOYEENAME, EMPLOYEESURNAME,AGE,DEPARTMENT) VALUES (9,'Fatma','Y?lmaz',38,'Sales');
INSERT INTO EMPLOYEE (EMPLOYEE_ID,EMPLOYEENAME, EMPLOYEESURNAME,AGE,DEPARTMENT) VALUES (10,'Furkan','Do?ru',39,'IT');
INSERT INTO EMPLOYEE (EMPLOYEE_ID,EMPLOYEENAME, EMPLOYEESURNAME,AGE,DEPARTMENT) VALUES (11,'Melis','Y?lmaz',24,'Marketing');
INSERT INTO EMPLOYEE (EMPLOYEE_ID,EMPLOYEENAME, EMPLOYEESURNAME,AGE,DEPARTMENT) VALUES (12,'Kerem','Güçlü',50,'IT');
INSERT INTO EMPLOYEE (EMPLOYEE_ID,EMPLOYEENAME, EMPLOYEESURNAME,AGE,DEPARTMENT) VALUES (13,'Tu?çe','Y?lmaz',44,'Finance');


INSERT INTO TASKSTATUS (TASKSTATUS_ID,TASKSTATUSNAME, ISACTIVE,CREATEDAT,UPDATEDAT) VALUES (4,'Quarterly Sales Performance Analysis',0,'01/01/2020','01/06/2020');
INSERT INTO TASKSTATUS (TASKSTATUS_ID,TASKSTATUSNAME, ISACTIVE,CREATEDAT,UPDATEDAT) VALUES (5,'Budget',1,'01/09/2020','01/12/2020');
INSERT INTO TASKSTATUS (TASKSTATUS_ID,TASKSTATUSNAME, ISACTIVE,CREATEDAT,UPDATEDAT) VALUES (6,'CRM Performance Analysis',0,'01/06/2020','01/11/2020');
INSERT INTO TASKSTATUS (TASKSTATUS_ID,TASKSTATUSNAME, ISACTIVE,CREATEDAT,UPDATEDAT) VALUES (7,'DWH Project',1,'01/06/2020','01/11/2020');

INSERT INTO TASK (TASK_ID,TASKNAME, TASKSTATUS_ID,EMPLOYEEID,DEADLINE) VALUES (4,'Accounting Specialist',5,4,'01/07/2020');
INSERT INTO TASK (TASK_ID,TASKNAME, TASKSTATUS_ID,EMPLOYEEID,DEADLINE) VALUES (5,'CRM Associate Manager',6,5,'31/12/2020');
INSERT INTO TASK (TASK_ID,TASKNAME, TASKSTATUS_ID,EMPLOYEEID,DEADLINE) VALUES (6,'Sales Associate',4,6,'01/04/2020');
INSERT INTO TASK (TASK_ID,TASKNAME, TASKSTATUS_ID,EMPLOYEEID,DEADLINE) VALUES (7,'Finance Specialist',5,7,'01/07/2020');
INSERT INTO TASK (TASK_ID,TASKNAME, TASKSTATUS_ID,EMPLOYEEID,DEADLINE) VALUES (8,'Software Developer',7,8,'01/12/2020');
INSERT INTO TASK (TASK_ID,TASKNAME, TASKSTATUS_ID,EMPLOYEEID,DEADLINE) VALUES (9,'Sales Manager',,9,'');
INSERT INTO TASK (TASK_ID,TASKNAME, TASKSTATUS_ID,EMPLOYEEID,DEADLINE) VALUES (10,'Senior Developer',7,10,'01/12/2020');
INSERT INTO TASK (TASK_ID,TASKNAME, TASKSTATUS_ID,EMPLOYEEID,DEADLINE) VALUES (11,'Marketing Specialist',,11,'');
INSERT INTO TASK (TASK_ID,TASKNAME, TASKSTATUS_ID,EMPLOYEEID,DEADLINE) VALUES (12,'IT Manager',7,12,'01/12/2020');
INSERT INTO TASK (TASK_ID,TASKNAME, TASKSTATUS_ID,EMPLOYEEID,DEADLINE) VALUES (13,'Finance Manager',1,13,'01/01/2021');

-- aktif projelerdeki çal??an insan say?s?
select ts.taskstatusname,count(t.taskname) from TASK t
left join taskstatus ts on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
where ts.isactive = 1
group by ts.taskstatusname
order by count(t.taskname) desc

--title'a göre çal??an say?s?
select t.taskname, count(e.employeename) from TASK t
left join taskstatus ts on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
group by t.taskname
order by count(e.employeename) desc

-- 40 ya??ndan büyük personelin title ve departman?
select e.employeename,e.employeesurname, t.taskname,e.department from TASKstatus ts
left join task t on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
where e.age >=40

--deadline'? geçti?i halde aktif olan görevler
select ts.taskstatusname , t.deadline  from TASKstatus ts
left join task t on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
where
t.deadline < Current_date and
ts.isactive = 1

--MINUS
select e.employeename,e.employeesurname, t.taskname,e.department from TASKstatus ts
left join task t on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
where e.age >=30
MINUS
select e.employeename,e.employeesurname, t.taskname,e.department from TASKstatus ts
left join task t on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
where e.age <=40

--UNION
select e.employeename,e.employeesurname, t.taskname,e.department from TASKstatus ts
left join task t on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
where e.age between 20 and 30
UNION
select e.employeename,e.employeesurname, t.taskname,e.department from TASKstatus ts
left join task t on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
where e.age between 40 and 50

--UNION ALL
select e.employeename,e.employeesurname, t.taskname,e.department from TASKstatus ts
left join task t on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
where e.age between 20 and 30
UNION ALL
select e.employeename,e.employeesurname, t.taskname,e.department from TASKstatus ts
left join task t on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
where ts.isactive = 1

--INTERSECT
select e.employeename,e.employeesurname, t.taskname,e.department from TASKstatus ts
left join task t on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
where e.age between 20 and 30
INTERSECT
select e.employeename,e.employeesurname, t.taskname,e.department from TASKstatus ts
left join task t on ts.taskstatus_id =t.taskstatus_id
left join employee e on e.employee_id=t.employeeid
where ts.isactive = 1


--FUNCTIONS

select length ('employeename') from employee;

select concat (employeename,concat(' ',employeesurname)) as employeefullname from employee;

select concat(employeename, substr (employeesurname,0,1)) as name1 from employee;

select row_number() OVER(ORDER BY age DESC ) row_num, employeename, employeesurname, department from employee;

select extract(month from deadline) from task

select deadline, round(deadline,'Q') from task; 

select  to_char(deadline, 'Month') from task;

select trim(to_char(deadline, 'Month')) from task;

SELECT deadline, ADD_MONTHS(deadline,2) new_deadline FROM  task

select  
    rank() OVER(PARTITION BY department ORDER BY age DESC ) rank,  
    employeename,
    employeesurname,
    department
from  employee ;

select extract(year from createdat) from taskstatus

select min(updatedat-createdat) from taskstatus ;

select upper (employeesurname) from employee;

select lower (employeename) from employee;

select initcap (concat(employeename,concat(' ',employeesurname))) from employee;