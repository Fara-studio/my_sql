use Lesson4_homework

create schema lesson4

--EASY
--1
Select TOP 5 *
FROM Employees;

--2
SELECT DISTINCT ProductName
FROM Products;

--3
SELECT * FROM Products
WHERE Price > 100;

--4
--If want to select only name column with A
SELECT *
FROM Customers
WHERE FirstName LIKE 'A%';

--If want to select all columns with name A
SELECT *
FROM Customers
WHERE FirstName LIKE 'A%';

--5
Select *
FROM Products
order by Price;

--6
SELECT *
FROM Employees
WHERE Salary >= 60000 and DepartmentName = 'HR';

--7
SELECT ISNULL(Email, 'noemail@example.com')
FROM Employees;

--8
SELECT *
FROM Products
WHERE Price BETWEEN 50 AND 100;

--9,10
SELECT DISTINCT Category, ProductName
FROM Products
order by ProductName desc;

--MEDIUM
--11
SELECT top 10 *
FROM Products
order by Price desc;

--12
SELECT COALESCE (FirstName, LastName)
FROM Employees;

--13
SELECT DISTINCT Category, Price
FROM Products;

--14
SELECT * 
FROM Employees
WHERE Age BETWEEN 30 and 40 or DepartmentName = 'Marketing'

--15
SELECT * 
FROM Employees
order by Salary desc
offset 10 row fetch next 10 row only;

--16
SELECT *
FROM Products
WHERE Price <=1000 and StockQuantity > 50
order by StockQuantity

--17
SELECT *
FROM Products
WHERE ProductName LIKE '%e%';

--18
SELECT *
FROM Employees
WHERE DepartmentName IN ('HR', 'IT', 'Finance');

--19
SELECT *
FROM Customers
ORDER BY CITY ASC, PostalCode DESC;

--HARD
--20
SELECT TOP 10 *
FROM Sales
ORDER BY SaleAmount DESC;

--21
SELECT FirstName + ' ' + LastName AS FullName
FROM Employees; 

--22
SELECT DISTINCT Category, ProductName, Price
FROM Products
WHERE Price > 50;

--23
SELECT *
FROM Products
WHERE Price < (SELECT AVG(Price) * 0.10 FROM Products);

--24
SELECT * 
FROM Employees
WHERE Age < 30 and DepartmentName IN ('HR', 'IT');

--25
SELECT *
FROM Customers
WHERE Email LIKE '%@gmail.com';

--26
SELECT *
FROM Employees
WHERE Salary > ALL(SELECT Salary FROM Employees WHERE DepartmentName = 'Sales')

--27
SELECT *
FROM Orders
WHERE OrderDate BETWEEN DATEADD(DAY, -180, GETDATE()) AND GETDATE()

