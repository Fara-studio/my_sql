--1
CREATE TABLE Person(
	personid INT PRIMARY KEY,
	lastName VARCHAR(30),
	firstName VARCHAR(30)
);

CREATE TABLE Address(
	addressid INT PRIMARY KEY,
	personid INT,
	city VARCHAR(30),
	state VARCHAR(30)
);

INSERT INTO Person (personid, lastName, firstName)
	values(1, 'Wang', 'Allen'),	(2, 'Alice', 'Bob');

INSERT INTO Address (addressid, personid, city, state)
	values(1, 2, 'New York City', 'New York'), (2, 3, 'Leetcode', 'California');

SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a ON p.personid = a.personid


--2
CREATE TABLE Employee (
	id INT PRIMARY KEY,
	name VARCHAR(30),
	salary INT,
	managerid INT
);

INSERT INTO Employee (id, name, salary, managerid) values
	(1, 'Joe', 70000, 3), 
	(2, 'Henry', 80000, 4), 
	(3, 'Sam', 60000, Null),
	(4, 'Max', 90000, Null);

SELECT e.name AS Employee
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary;


--3
Create table Person (id int, email varchar(255)) 
Truncate table Person 
insert into Person (id, email) 
values ('1', 'a@b.com') 
insert into Person (id, email) 
values ('2', 'c@d.com') 
insert into Person (id, email) 
values ('3', 'a@b.com')

SELECT email, COUNT(email) as 'repeats'
FROM Person
GROUP BY email
HAVING COUNT(email) > 1

--4

Create table Person (id int Primary Key, email varchar(255)) 
Truncate table Person 
insert into Person (id, email) values
	(1, 'john@example.com'),
	(2, 'bob@example.com'),
	(3, 'john@example.com');

DELETE c1
FROM Person c1
JOIN Person c2
ON c1.email = c2.email AND c1.id > c2.id;


--5
CREATE TABLE boys ( Id INT PRIMARY KEY, name VARCHAR(100), ParentName VARCHAR(100) );

CREATE TABLE girls ( Id INT PRIMARY KEY, name VARCHAR(100), ParentName VARCHAR(100) );

INSERT INTO boys (Id, name, ParentName) VALUES (1, 'John', 'Michael'),
(2, 'David', 'James'),
(3, 'Alex', 'Robert'),
(4, 'Luke', 'Michael'),
(5, 'Ethan', 'David'),
(6, 'Mason', 'George');

INSERT INTO girls (Id, name, ParentName) VALUES (1, 'Emma', 'Mike'),
(2, 'Olivia', 'James'),
(3, 'Ava', 'Robert'),
(4, 'Sophia', 'Mike'),
(5, 'Mia', 'John'),
(6, 'Isabella', 'Emily'), (7, 'Charlotte', 'George');

SELECT DISTINCT g.ParentName
FROM girls g
WHERE g.ParentName NOT IN (
    SELECT DISTINCT ParentName FROM boys
);

--6
SELECT custid, 
	Count(freight) AS TotalOver50, 
	MIN(freight) AS LeastWeight
FROM [TSQL2012].[Sales].[Orders]
WHERE freight > 50
GROUP BY custid;

--7
DROP TABLE IF EXISTS Cart1; DROP TABLE IF EXISTS Cart2;

CREATE TABLE Cart1 ( Item VARCHAR(100) PRIMARY KEY );

CREATE TABLE Cart2 ( Item VARCHAR(100) PRIMARY KEY );

INSERT INTO Cart1 (Item) VALUES ('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');

INSERT INTO Cart2 (Item) VALUES ('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');

SELECT c1.Item AS 'Item Cart 1', c2.Item AS 'Item Cart 2'
From Cart1 c1
FULL OUTER JOIN Cart2 c2 on c2.Item = c1.Item


--8
create table match1 (MatchID int, Match varchar(30), Score varchar(5)) insert into match1 values (1,'Italy-Spain','2:0'), (2,'Spain-France','2:1'), (3,'France-Belgium','0:0'), (4,'Belgium-Spain','2:2'), (5,'Belgium-Italy','0:3'), (6,'Italy-France','2:0');

SELECT CASE 
           WHEN CAST(LEFT(Score, CHARINDEX(':', Score) - 1) AS INT) 
              > CAST(RIGHT(Score, LEN(Score) - CHARINDEX(':', Score)) AS INT)
                THEN LEFT(Match, CHARINDEX('-', Match) - 1)
           WHEN CAST(LEFT(Score, CHARINDEX(':', Score) - 1) AS INT) 
              < CAST(RIGHT(Score, LEN(Score) - CHARINDEX(':', Score)) AS INT)
                THEN RIGHT(Match, LEN(Match) - CHARINDEX('-', Match))
           ELSE 'Draw'
       END AS Result
FROM match1;


--9

Create table Customers (
	id int, 
	name varchar(255)
) 

Create table Orders (
	id int, 
	customerId int
) 

Truncate table Customers 

insert into Customers (id, name) values 
	('1', 'Joe') 

insert into Customers (id, name) values
	('2', 'Henry') 
	
insert into Customers (id, name) values 
	('3', 'Sam') 

insert into Customers (id, name) values 
	('4', 'Max') 

Truncate table Orders 
	
insert into Orders (id, customerId) values 
	('1', '3') 
	
insert into Orders (id, customerId) values 
	('2', '1')

SELECT name AS Customers
FROM Customers c
LEFT JOIN Orders o on o.customerId = c.id
WHERE o.id IS null


--10

Create table Students (student_id int, student_name varchar(20)) Create table Subjects (subject_name varchar(20)) Create table Examinations (student_id int, subject_name varchar(20)) Truncate table Students insert into Students (student_id, student_name) values ('1', 'Alice') insert into Students (student_id, student_name) values ('2', 'Bob') insert into Students (student_id, student_name) values ('13', 'John') insert into Students (student_id, student_name) values ('6', 'Alex') Truncate table Subjects insert into Subjects (subject_name) values ('Math') insert into Subjects (subject_name) values ('Physics') insert into Subjects (subject_name) values ('Programming') Truncate table Examinations insert into Examinations (student_id, subject_name) values ('1', 'Math') insert into Examinations (student_id, subject_name) values ('1', 'Physics') insert into Examinations (student_id, subject_name) values ('1', 'Programming') insert into Examinations (student_id, subject_name) values ('2', 'Programming') insert into Examinations (student_id, subject_name) values ('1', 'Physics') insert into Examinations (student_id, subject_name) values ('1', 'Math') insert into Examinations (student_id, subject_name) values ('13', 'Math') insert into Examinations (student_id, subject_name) values ('13', 'Programming') insert into Examinations (student_id, subject_name) values ('13', 'Physics') insert into Examinations (student_id, subject_name) values ('2', 'Math') insert into Examinations (student_id, subject_name) values ('1', 'Math')

SELECT * FROM Students
SELECT * FROM Examinations

SELECT s.student_id, s.student_name, sub.subject_name,
	COUNT(e.subject_name) AS 'attended_exams'
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e 
    ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
