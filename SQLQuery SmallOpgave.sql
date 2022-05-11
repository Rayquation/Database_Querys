drop table if exists Movie
go
drop table if exists Genre
go
Create table Genre
(
ID int identity primary key,
GenreName varchar(255) not null unique
)

insert into Genre values('Sci-fi')
insert into Genre values('Fantasy')
insert into Genre values('Comedy')
Create table Movie
(
ID int identity primary key,
Title varchar(255) unique,
PlayTime int,
GenereID int foreign key references Genre(ID),
check (Playtime>0),
check (Playtime<180)
)

Insert into Movie values('Last jedi',88,1)
Insert into Movie values('Last airbender',99,3)
Insert into Movie values('Harry potter lost horcorcs',69,2)

select Movie.ID,Movie.Title,Movie.PlayTime,Genre.GenreName from Movie join Genre on Movie.GenereID = Genre.ID