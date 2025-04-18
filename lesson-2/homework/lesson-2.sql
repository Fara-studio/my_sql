CREATE TABLE Employees (
	EmpID INT,
	Name VARCHAR(50),
	Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmpID, Name, Salary, DepartmentID) VALUES (1, 'Ali', 56000, 1);

INSERT INTO Employees (EmpID, Name, Salary, DepartmentID) 
VALUES 
	(2, 'Vali', 72000, 2),
	(3, 'G`ani', 49000, 3);

UPDATE Employees SET Salary=57000 WHERE EmpID = 1;

DELETE FROM Employees WHERE EmpID = 2;

CREATE TABLE TestTable (
	ID INT
);
INSERT INTO TestTable VALUES (1), (2), (3);

DELETE FROM TestTable;

--TRUNCATE TABLE TestTable;

--DROP TABLE TestTable;


ALTER TABLE Employees ALTER COLUMN Name VARCHAR(100);

ALTER TABLE Employees ADD Department VARCHAR(50);
ALTER TABLE Employees ADD DepartmentID INT;

ALTER TABLE Employees ALTER COLUMN Salary FLOAT;

CREATE TABLE Departments (
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(50)
);

DELETE FROM Employees;

SELECT * FROM Departments;
SELECT * FROM Employees;

INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT DepartmentID, Department
From Employees

UPDATE Employees SET Department = 'Management' WHERE Salary > 5000

DELETE FROM Employees;

ALTER TABLE Employees
DROP COLUMN Department;

EXEC sp_rename 'Employees', 'StaffMembers';

DROP TABLE Departments;

SELECT * FROM StaffMembers;

CREATE TABLE Products (
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(50),
	Category VARCHAR(50),
	Price DECIMAL(10,2)
);

ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0)

ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity)
VALUES
(1, 'TV', 'Electronics', 479.99, 76),
(2, 'Keyboard', 'Electronics', 40.99, 134),
(3, 'Milk', 'Drink&Food', 4.12, 423),
(4, 'Wooden table', 'Furniture', 78.05, 34),
(5, 'Men`s coat', 'Cloth', 125.60, 17);

SELECT * INTO Products_Backup
FROM Products;

EXEC sp_rename 'Products', 'Inventory';

SELECT * INTO Products_Backup1
FROM Inventory;

ALTER TABLE Inventory
DROP CONSTRAINT CHK_Price_Positive;

ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

ALTER TABLE Inventory
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

SELECT * INTO Products_Backup2
FROM Inventory;

ALTER TABLE Inventory ADD ProductCode INT IDENTITY(1000,5)

SELECT * INTO Products_Backup3
FROM Inventory;

SELECT * FROM Inventory;








