CREATE DATABASE adbtu60;
USE adbtu60;
CREATE TABLE Persons;
CREATE TABLE Persons (     PersonID int,     LastName varchar(255),     FirstName varchar(255),     Address varchar(255),     City varchar(255) );
INSERT INTO Persons VALUES ('1', 'Tavares', 'Rodrigo', 'Far away street', 'Dublin');
SELECT * FROM Persons;