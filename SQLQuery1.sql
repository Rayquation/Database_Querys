--use master
--drop database xH1Database
--create database xH1Database
--go (går ikke videre før ovenstående kommando er kørt)
use xH1Database
drop table  if exists Student
go
drop table  if exists Team
go
create table Team(
ID int primary key identity,
TeamName varchar(255)
)
insert into Team values('Data')
insert into Team values('Specialpatruljen')
insert into Team values('Tec sutter masiv pik')
insert into Team values('Ånsvage elever')
create table Student
(
ID int identity constraint Student_StudentID_PK primary key,
FirstName varchar(255) not null,
LastName varchar(255) not null,
Addr varchar(255) not null,
ShoeNumber decimal(5,2) not null,
Salary float not null,
Internship bit not null,
Partimejob varchar(255)not null,
TeamID int constraint Student_TeamID_FK foreign key references Team(ID)
)
insert into Student values( 'Elias','Kouly','Jacobsvej 7',42.5,1234.5,0,'Animator',1)
insert into Student values('Oliver','Laursen','Juelsmindevej 7',40,1900,0,'Tiger',4)
insert into Student values('Carl-Emil','Olsen','Tunøvej 59',48.5,8000,0,'Hardcore Gamer',3)
insert into Student values('Oskar','Urban','TætvedØsterbrovej 7',44.5,1300,1,'Driver virksomhed',1)
insert into Student values( 'Emil','Lundqvist','Grantofteparken 7',45,22222,0,'Sofa',1)
insert into Student values( 'Julius','Schwaner','Kagså 117',42.5,13600,1,'Supporter',2)
insert into Student values( 'Surbana','Grg','Thorsgade 117',42.0,12734,0,'Manager',2)
insert into Student values( 'Mark','Robbers','Titangade 117',42,71234,0,'Robber',2)
insert into Student values( 'Joshi','Tonakie','Jacobs Boulevard 7',42,91234,0,'President',4)
insert into Student values( 'Aksel','Fabricius','Danmark 7 tv',45.5,1000000,1,'Pusher',3)
insert into Student values( 'Noah','Tågehorn','Rusland 17',39,123477,1,'Skinneskidtskraber',3)
insert into Student values( 'Marko','Peddersen','Ballerup boulevard 17',49,77777,0,'Tagrenderenser',4)
select * from Student
select * from Team
--select * from Student where TeamID = 1
--select * from Student, Team where Team.ID = Student.TeamID
--select * from Student, Team
--select * from Student where ShoeNumber = 42.5
--select * from Student where FirstName = 'Elias'
--select * from Studen where FirstName is null
select Student.ID,Student.FirstName,Student.LastName,Student.Addr,Student.ShoeNumber,Student.Salary,Student.Internship,Student.Partimejob,Student.TeamID,Team.TeamName from Student right join Team on Team.ID=Student.TeamID
--Data: Insert, Delete Upadte
--Tabel: Create, Drop, Alter
--PK:Primary key 
--FK:Foreign Key
--NN:Not Null 
--CK:Check 
--UK:Unique