create database Lesson3_homework

--BULK INSERT is a command in SQL Server that is used to quickly import a large amount of data from a file (e.g. .txt, .csv) directly into a database table.

--.CSV .TXT .JSON .XML

create table Products(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(50),
	Price DECIMAL (10,2)
);

insert into Products values
	(1, 'TV', 79.99),
	(2, 'Keyboard', 13.49),
	(3, 'Chair', 24.99);

--NULL: means the value is unknown or missing.
CREATE TABLE Example1 (ID INT, Price DECIMAL(10,2) NULL);

insert into Example1 values (1, NULL)

--NOT NULL: means the value must be specified.
CREATE TABLE Example2 (ID INT, Price DECIMAL(10,2) NOT NULL);

insert into Example2 values (1, NULL)


ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

--Inserting a new record into the Products table
insert into Products values (4, 'Laptop', 247.19)

create table Categories (
	CategoryID INT PRIMARY KEY,
	CategoryName VARCHAR(50) UNIQUE
);

--IDENTITY automatically creates unique values ​​in a column, such as for ID.
	
	CREATE TABLE IdentityExample (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50)
); --Here the ID will start from 1 and increase by 1 on each insert.

BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

ALTER TABLE Products
ADD CategoryID INT;

ALTER TABLE Products
ADD CONSTRAINT FK_Category
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

-- PRIMARY KEY
CREATE TABLE Example1 (
    ID INT PRIMARY KEY
);

-- UNIQUE
CREATE TABLE Example2 (
    Email VARCHAR(100) UNIQUE
);

--UNIQUE KEY allows NULL values, but PRIMARY KEY does not.

--PRIMARY KEY allows only one in one table, but UNIQUE KEY allows as many as you like

select * from Products
select * from Categories

ALTER TABLE Products
ADD CONSTRAINT CHK_Price CHECK (Price > 0);

ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

SELECT ProductName, ISNULL(Stock, 0)
FROM Products;

--FOREIGN KEY
--It links tables together and ensures data integrity.
--Products.CategoryID references Categories.CategoryID - you cannot insert a product with a non-existent category.
