drop database if exists Company
Create database Company
go
Use Company
create table Employee
(
Empno int primary key,
Fname varchar(20) not null,
Minint char(1),
Lname varchar(20) not null,
Gender char(1),
Birthdate Datetime,
Hiredate Datetime,
Job varchar(20),
Trainne bit,
Salary decimal(10,2) not null,
Comm decimal(10,2),
check (Gender = 'F'),
check (Gender = 'M')
)
create table Department
(
DeptNo int identity primary key,
Dname varchar(20) unique,
ManEmpNo int foreign key references Employee(Empno) unique not null,
ManStartDate datetime
)
create table Project
(
ProNo int identity primary key,
ProName varchar(30) unique,
_Location varchar(30)
)
create table _Dependent
(
DptEmpNo int foreign key references Employee(Empno),
DptName varchar(20),
Gender char(1),
Birthday Datetime,
Relation varchar(10),
Primary key (DptName,DptEmpNo),
check (Gender = 'F'),
check (Gender = 'M')
)
alter table Employee add EmpDeptNo int foreign key references Department(DeptNo) not null
alter table Project add ConDeptNo int foreign key references Department(DeptNo)
alter table Employee add SuperEmpNo int foreign key references Employee(Empno)

create table WorksOn
(
EmpNo int foreign key references Employee(Empno),
ProNo int foreign key references Project(ProNo),
_Hours Decimal
)
create table DepartmentLocation
(
_Location varchar(20),
LocDeptno int foreign key references Department(DeptNo)
)