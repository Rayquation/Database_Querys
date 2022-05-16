alter table Department drop constraint if exists dept_manager_fk

Use Company

drop table if exists _Dependent
drop table if exists DepartmentLocation
drop table if exists WorksOn
drop table if exists Project
drop table if exists Employee
drop table if exists Department

create table Employee
(
Empno int constraint emp_empno_pk primary key,
Fname varchar(20) not null,
Minint char(1),
Lname varchar(20) not null,
Gender char(1),
Birthdate Date,
Hiredate Date,
Job varchar(20),
Trainne bit,
Salary decimal(10,2) not null,
Comm decimal(10,2),
constraint emp_gender_ck check(Gender = 'F' or Gender = 'M'),
)

create table Department
(
DeptNo int identity(10,10) constraint dept_deptno_pk primary key,
Dname varchar(20) unique,
)

create table Project
(
ProNo int primary key,
ProName varchar(30) unique not null,
_Location varchar(30) not null
)

create table _Dependent
(
DptEmpNo int constraint Dependent_DptEmpNo_FK foreign key references Employee(Empno) on delete Cascade,
DptName varchar(20),
Gender char(1),
Birthday Date,
Relation varchar(10),
Primary key (DptName,DptEmpNo),
check (Gender = 'F' or Gender = 'M'),
)

alter table Employee add EmpDeptNo int constraint emp_dept_fk  foreign key references Department(DeptNo) not null
alter table Project add ConDeptNo int foreign key references Department(DeptNo)
alter table Employee add SuperEmpNo int constraint emp_supervisor_fk foreign key references Employee(Empno)

create table WorksOn
(
EmpNo int foreign key references Employee(Empno),
ProNo int foreign key references Project(ProNo),
_Hours Decimal
)
create table DepartmentLocation
(
LocDeptno int foreign key references Department(DeptNo),
_Location varchar(20)
)
insert into Department values ('ACCOUNTING')
insert into Department values ('RESEARCH')
insert into Department values ('SALES')
insert into Department values ('OPERATIONS')

insert into DepartmentLocation values (10,'New York')
insert into DepartmentLocation values (10,'Houston')
insert into DepartmentLocation values (20,'Dallas')
insert into DepartmentLocation values (30,'Chicago')
insert into DepartmentLocation values (30,'Tafford')
insert into DepartmentLocation values (30,'New York')
insert into DepartmentLocation values (40,'Boston')

insert into Employee values(7839,'James','L','King','M','1942-12-31','1972-11-30','President',0,5000,null,10,null)
insert into Employee values(7782,'Terry','A','Clerk','M','1982-10-12','2010-09-26','Manager',1,2450,null,10,7839)
insert into Employee values(7566,'Jack','K','Jones','M','1942-12-31','1972-11-30','Manager',0,2975,null,20,7839)
insert into Employee values(7698,'Horace','O','Blake','M','1972-11-30','1993-10-28','Manager',0,2850,null,30,7839)

insert into Employee values(7844,'Tina','E','Turner','F','1978-05-11','1992-04-12','Salesman',1,1500,0,30,7698)
insert into Employee values(7499,'Dave','J','Allen','M','1949-09-13','1983-08-25','Developer',0,1600,300,30,7698)
insert into Employee values(7521,'Samuel','D','Ward','M','1934-08-14','1985-07-01','Salesman',0,1250,500,30,7698)
insert into Employee values(7654,'Jeans','J','Martin','F','1978-07-23','1995-06-04','Salesman',1,1250,1400,30,7698)

insert into Employee values(7788,'Taylor','R','Scott','M','1956-06-21','1989-05-24','Analyst',0,3000,null,20,7566)
insert into Employee values(7876,'John','R','Ford','M','1985-04-01','2002-03-17','Analyst',0,3000,null,20,7566)
insert into Employee values(7369,'Harald','H','Smith','M','1966-02-23','2004-01-27','Clerk',1,800,null,20,7566)

insert into Employee values(7934,'Marcus','G','Miller','M','1981-03-09','2003-02-12','Clerk',1,1300,null,10,7782)

insert into Employee values(0001,'Aksel','M','Fabricius','M','2003-05-18','2018-02-11','Clerk',1,9999,null,10,7782)


alter table Department add Manager int constraint dept_manager_fk foreign key references Employee(Empno)
alter table Department add Startdate Date
alter table Department add NumOfEmps int

update Department set Manager = 7499 where DeptNo = 10
update Department set Manager = 7788 where DeptNo = 20
update Department set Manager = 7566 where DeptNo = 30
update Department set Manager = 7698 where DeptNo = 40

update Department set Startdate = GETDATE() where DeptNo = 10
update Department set Startdate = GETDATE() where DeptNo = 20
update Department set Startdate = GETDATE() where DeptNo = 30
update Department set Startdate = GETDATE() where DeptNo = 40

update Department set NumOfEmps = (select count(*) from Employee where Employee.EmpDeptNo = Department.DeptNo);

insert into Project values(1,'PRODUCTX','NEW YORK',10)
insert into Project values(2,'PRODUCTY','HOUSTON',20)
insert into Project values(3,'PRODUCTZ','DALLAS',30)
insert into Project values(10,'COMPUTERIZATION','CHICAGO',30)
insert into Project values(20,'REORGGANIZATION','STAFFORD',30)
insert into Project values(30,'NEWBENEFITS','NEW YORK',30)

insert into WorksOn values(7499,1,12)
insert into WorksOn values(7934,2,10)
insert into WorksOn values(7839,10,5)
insert into WorksOn values(7844,2,23)
insert into WorksOn values(7782,30,58)
insert into WorksOn values(7934,3,6)

insert into _Dependent values(7839,'Prince','M','1987-11-01','son')
insert into _Dependent values(7839,'Princess','F','1987-11-01','daughter')
insert into _Dependent values(7839,'Queen','M','1965-12-24','wife')
insert into _Dependent values(7788,'Sammy','M','1932-05-21','father')
insert into _Dependent values (0001,'Oliver','M','2004-10-28','son')

select * from _Dependent
delete from Employee where Empno=0001
select * from _Dependent

-- Opgave 1
select Empno as [Employee Number],Fname as [First Name], Lname as [Last name] from Employee where Lname = 'Smith' or Lname='smith'
-- Opgave 2 https://www.w3schools.com/sql/sql_like.asp
select Empno as [Employee Number],Fname as [First Name], Lname as [Last name] from Employee where Lname Like 'A%'
-- Opgave 3
select Empno as [Employee Number],Fname as [First Name], Lname as [Last name] from Employee where Lname Like '_l%'
-- Opgave 4
select Empno as [Employee Number],Fname as [First Name], Lname as [Last name],Hiredate,Job from Employee where Hiredate<'01-01-1981'
select BirthDate from Employee
select Empno as [Employee Number],Fname as [First Name], Lname as [Last name] from Employee where Datediff(year,hiredate,GetDate())>5
select Lname,Datediff(year,Birthdate,Hiredate) as [Age] from Employee
-- Opgave 5
select Empno as [Employee Number],Fname as [First Name], Lname as [Last name],Job,SuperEmpNo as [Supperior] from Employee where SuperEmpNo is null
-- Opgave 6
select Empno as [Employee Number],Fname as [First Name], Lname as [Last name],Job from Employee where Job = 'Clerk' and Salary >1000
-- Opgave 7 https://www.w3schools.com/sql/sql_count_avg_sum.asp
select AVG(Salary) as[Genemsnitlig salary] from Employee where EmpDeptNo=10
-- Opgave 8 https://stackoverflow.com/questions/7686049/sql-select-to-make-a-value-appear-only-once
select distinct Employee.Job from Employee
-- Opgave 9
select * from Employee,Department
-- Opgave 10
select EmpNo as[Employee Number],DeptNo as[Department Number],Fname as [First Name], Lname as [Last name] from Employee join Department on EmpDeptNo = DeptNo
-- Opgave 11
select Empno as [Employee Number],Fname as [First Name], Lname as [Last name],Salary from Employee where Salary >1500
-- Opgave 12 https://learnsql.com/cookbook/how-to-find-the-maximum-value-of-a-numeric-column-in-sql/
select Salary as [Max salary],Fname as [First Name] from Employee where Salary = (select MAX(Salary) from Employee)
-- Opgave 13
select Empno as [Employee Number] ,Fname as [First Name],Dname as[Department Name] from Employee join Department on Department.Dname='Sales' where Employee.EmpDeptNo=DeptNo
select Empno as [Employee Number],Fname as [First Name],_Location as [Location] from Employee join DepartmentLocation on _Location='New York' where LocDeptno=Employee.EmpDeptNo
select Empno as [Employee Number],Fname as [First Name],Dname as[Department Name],_Location as [Location] from Employee,Department join DepartmentLocation on DepartmentLocation._Location = 'New York' where Employee.EmpDeptNo=DepartmentLocation.LocDeptno and Department.DeptNo=Employee.EmpDeptNo
-- Opgave 14
select Empno as [Employee Number],Fname as [First Name], Lname as [Last name] from Employee where EmpNo not in (select SuperEmpNo from Employee where SuperEmpNo is not null)
-- Opgave 15 https://stackoverflow.com/questions/41450663/selecting-same-column-twice-from-a-single-table-but-with-different-conditions
--select a.Empno,a.Fname as Supervisor ,b.SuperEmpNo, b.Fname as Supervisee from Employee A join Employee B on b.SuperEmpNo = a.Empno
select e.Empno,e.Fname as Supervisee,(select top 1 Fname From Employee b where b.Empno = e.SuperEmpNo) as Supvervisor from Employee e
-- Opgave 16 https://stackoverflow.com/questions/13999817/reason-for-column-is-invalid-in-the-select-list-because-it-is-not-contained-in-e
select Department.Dname as [Department Name], AVG(Salary) as [Genemsnitlig salary] from Employee join Department on Department.DeptNo=EmpDeptNo Group by Dname 
-- Opgave 17
select distinct Dname as[Department Name],DeptNo as [Department Number] from Employee join Department on Department.NumOfEmps=0
-- Opgave 18
select Manager as [Manager ID],Employee.Fname as [Manager Name],Dname as [Department Name], ProName as [Project Name] from Project,Employee join Department on Manager=Empno where DeptNo=EmpDeptNo and Project.ConDeptNo = DeptNo
-- Opgave 19
select Fname as[First Name] from Employee where Fname='James' Union select DptName from _Dependent 
