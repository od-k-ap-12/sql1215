--USE master

--IF EXISTS (SELECT name FROM master.sys.databases WHERE name='MusicCollection')
--DROP DATABASE MusicCollection
--GO

--CREATE DATABASE MusicCollection
--GO

USE MusicCollection; 
GO

--CREATE TABLE Genres
--( 
--GenreID int PRIMARY KEY IDENTITY(1,1), 
--GenreName nvarchar(100) NOT NULL
--);
--GO

--CREATE TABLE Artists
--( 
--ArtistID int PRIMARY KEY IDENTITY(1,1), 
--ArtistName nvarchar(100) NOT NULL
--);
--GO

--CREATE TABLE Publishers
--( 
--PublisherID int PRIMARY KEY IDENTITY(1,1), 
--PublisherName nvarchar(100) NOT NULL,
--Country nvarchar(100) NOT NULL
--);
--GO

--CREATE TABLE Discs
--( 
--DiscID int PRIMARY KEY IDENTITY(1,1),
--DiscTitle nvarchar(100) NOT NULL,
--ArtistID int FOREIGN KEY REFERENCES Artists(ArtistID), 
--GenreID int FOREIGN KEY REFERENCES Genres(GenreID), 
--PublisherID int FOREIGN KEY REFERENCES Publishers(PublisherID), 
--Release date NOT NULL
--);
--GO

--CREATE TABLE Songs
--( 
--SongID int PRIMARY KEY IDENTITY(1,1),
--SongTitle nvarchar(100) NOT NULL,
--DiscID int FOREIGN KEY REFERENCES Discs(DiscID), 
--ArtistID int FOREIGN KEY REFERENCES Artists(ArtistID), 
--GenreID int FOREIGN KEY REFERENCES Genres(GenreID), 
--SongLength time NOT NULL
--);
--GO

--INSERT INTO Genres
--VALUES ('Electro Swing'),('Jazz'),('Lo-fi'),('Pop'),('Metal')
--GO
--INSERT INTO Artists
--VALUES ('Artist1'),('Artist2'),('Artist3'),('Artist4'),('Artist5')
--GO
--INSERT INTO Publishers
--VALUES ('P1','Ukraine'),('P2','USA'),('P3','France'),('P4','Italy'),('P5','Korea')
--GO
--INSERT INTO Discs
--VALUES ('Title1',1,1,1,'2023-12-12'),('Title2',2,2,2,'2022-2-3'),('Title3',3,3,3,'2022-6-3'),('Title4',4,4,4,'2023-12-11'),('Title5',5,5,5,'2023-1-11')
--GO
--INSERT INTO Songs
--VALUES ('Title1',1,1,1,'00:02:12'),('Title2',2,2,2,'00:02:30'),('Title3',3,3,3,'00:03:40'),('Title4',4,4,4,'00:05:55'),('Title5',5,5,5,'00:01:30')
--GO

SELECT *
FROM (
   SELECT GenreName,ArtistName
   FROM Discs,Genres,Artists
   WHERE Discs.ArtistID=Artists.ArtistID AND Discs.GenreID=Genres.GenreID
) AS SourceTable
PIVOT (
	COUNT(GenreName) FOR ArtistName IN ([Artist1],[Artist2],[Artist3],[Artist4],[Artist5])
) AS PivotTable;

SELECT *
FROM (
   SELECT GenreName,PublisherName
   FROM Discs,Publishers,Genres
   WHERE Discs.PublisherID=Publishers.PublisherID AND Discs.GenreID=Genres.GenreID
) AS SourceTable
PIVOT (
	COUNT(GenreName) FOR PublisherName IN ([P1],[P2],[P3],[P4],[P5])
) AS PivotTable;
