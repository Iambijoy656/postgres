-- Active: 1720975844148@@127.0.0.1@5432@test2


--  CREATE Table student (
--     student_id INT,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     cgpa NUMERIC(1,2)

--  )

-- ALTER TABLE student RENAME TO learner





-- Create a table with contains
CREATE TABLE "user1"(
    user_id SERIAL PRIMARY KEY,
    username  VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    age INT DEFAULT 18);


-- insert into user1 VALUES(1,'abc','abc@gmail.com');

ALTER TABLE user1
ADD COLUMN password VARCHAR(255) DEFAULT '1234' NOT NULL;

ALTER Table user1
drop COLUMN age;


ALTER Table user1 ADD COLUMN demo INT;

-- change  a data type 
ALTER Table user1
 ALTER COLUMN demo type text;

ALTER Table user1
 RENAME COLUMN demo to country;

ALTER Table user1
ADD CONSTRAIN email UNIQUE (email);

TRUNCATE Table user1;




CREATE TABLE Courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    published_date DATE
);


INSERT INTO Courses(course_name,description, published_date)
VALUES('Postgres Course','poossssssssssssssss dess','2020-07-29'),
('Postgres Course','poossssssssssssssss dess','2020-07-09'),
('Postgres Course',NULL,NULL)


UPDATE Courses
SET course_name = 'postgres for beginners',
description = 'it is descriprtion'
WHERE course_id >2;


SELECT* FROM  Courses;







-- Dept Table
-- Each department belongs to many employees

CREATE Table departments(
    deptID SERIAL PRIMARY KEY,
    name VARCHAR(255)
)

INSERT INTO departments (name) VALUES
('IT'),
('Human Resources'),
('Finance'),
('Engineering'),
('Marketing'),
('Sales'),
('Customer Support'),
('Legal'),
('Research and Development'),
('Operations');



-- Employee table 
-- Each Employee belongs to a department

CREATE table employees(
    empId SERIAL PRIMARY KEY ,
    name VARCHAR(255) NOT NULL,
    email TEXT NOT NULL,
    salary INT NOT NULL,
    joining_date DATE NOT NULL,
    deptId INT NOT NULL,
 CONSTRAINT fk__deptID  Foreign Key (deptID) REFERENCES departments(deptID)
)

INSERT INTO employees (name, email, salary, joining_date, deptId) VALUES
('John Doe', 'john.doe@example.com', 50000, '2023-01-10', 1),
('Jane Smith', 'jane.smith@example.com', 60000, '2023-02-15', 2),
('Alice Johnson', 'alice.johnson@example.com', 55000, '2023-03-20', 3),
('Bob Brown', 'bob.brown@example.com', 70000, '2023-04-25', 4),
('Carol White', 'carol.white@example.com', 52000, '2023-05-30', 5),
('David Green', 'david.green@example.com', 58000, '2023-06-04', 6),
('Eve Black', 'eve.black@example.com', 62000, '2023-07-09', 7),
('Frank Blue', 'frank.blue@example.com', 65000, '2023-08-14', 8),
('Grace Red', 'grace.red@example.com', 63000, '2023-09-19', 9),
('Henry Purple', 'henry.purple@example.com', 68000, '2023-10-24', 10),
('Isla Orange', 'isla.orange@example.com', 56000, '2023-11-28', 1),
('Jack Gray', 'jack.gray@example.com', 59000, '2023-12-03', 2),
('Kara Yellow', 'kara.yellow@example.com', 60000, '2024-01-08', 3),
('Leo Brown', 'leo.brown@example.com', 62000, '2024-02-12', 4),
('Mona Blue', 'mona.blue@example.com', 61000, '2024-03-17', 5),
('Nina White', 'nina.white@example.com', 59000, '2024-04-21', 6),
('Oscar Green', 'oscar.green@example.com', 67000, '2024-05-26', 7),
('Paul Black', 'paul.black@example.com', 65000, '2024-06-30', 8),
('Quinn Red', 'quinn.red@example.com', 64000, '2024-07-05', 9),
('Rita Purple', 'rita.purple@example.com', 66000, '2024-08-09', 10),
('Sam Orange', 'sam.orange@example.com', 54000, '2024-09-13', 1),
('Tina Gray', 'tina.gray@example.com', 57000, '2024-10-18', 2),
('Uma Yellow', 'uma.yellow@example.com', 58000, '2024-11-22', 3),
('Vera Brown', 'vera.brown@example.com', 60000, '2024-12-27', 4),
('Will Blue', 'will.blue@example.com', 62000, '2025-01-01', 5),
('Xena White', 'xena.white@example.com', 63000, '2025-02-05', 6),
('Yara Green', 'yara.green@example.com', 65000, '2025-03-12', 7),
('Zane Black', 'zane.black@example.com', 66000, '2025-04-16', 8),
('Amy Red', 'amy.red@example.com', 67000, '2025-05-21', 9),
('Brad Purple', 'brad.purple@example.com', 68000, '2025-06-25', 10),
('Clara Orange', 'clara.orange@example.com', 69000, '2025-07-30', 1),
('Derek Gray', 'derek.gray@example.com', 70000, '2025-08-03', 2),
('Eva Yellow', 'eva.yellow@example.com', 71000, '2025-09-07', 3),
('Fiona Brown', 'fiona.brown@example.com', 72000, '2025-10-12', 4),
('Gavin Blue', 'gavin.blue@example.com', 73000, '2025-11-16', 5),
('Holly White', 'holly.white@example.com', 74000, '2025-12-21', 6),
('Ian Green', 'ian.green@example.com', 75000, '2026-01-25', 7),
('Jane Black', 'jane.black@example.com', 76000, '2026-02-22', 8)


SELECT* FROM  employees;
SELECT* FROM  departments;



SELECT empid, name, email, salary FROM employees

SELECT * FROM employees
WHERE salary >10000 AND salary <60000

SELECT * FROM employees
WHERE joining_date > '2025-01-10' AND joining_date < '2027-01-10';


SELECT * FROM employees
WHERE  name <> 'John Doe'



SELECT * FROM employees
ORDER BY empid ASC 
LIMIT 10 OFFSET 2 * 10; 


-- hightest salary of employee
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1; 



-- 3rd hightest salary of employee

SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2 ;


-- IN , NOT IN , BETWEEN , LIKE

SELECT * from employees WHERE empid IN(1,2,3);


SELECT * from employees WHERE empid NOT IN (1,2,3);


SELECT * from employees WHERE salary BETWEEN 40000 and 60000;




-- Like for search
SELECT * from employees WHERE name LIKE 'A%'; -- Alice Johnson Amy Red

SELECT * from employees WHERE name LIKE '%a%'; -- dfghfdhafadsf


SELECT * from employees WHERE name LIKE '%a'; -- nila

-- specific position
 SELECT * from employees WHERE name LIKE '__r__'; 


SELECT * from employees WHERE name LIKE 'V%n'; -- Vera Brown





------------------------ Joining -----------------


-- inner join

SELECT employees.name, employees.email, departments.name
 from employees 
INNER JOIN departments ON departments.deptid = employees.deptid;



-- Left Join 

SELECT *
 from employees 
LEFT JOIN departments ON departments.deptid = employees.deptid;



-- Right Join 

SELECT *
 from employees 
RIGHT JOIN departments ON departments.deptid = employees.deptid;


-- Full Jpin 
SELECT *
 from employees 
 FULL JOIN departments ON departments.deptid = employees.deptid;




-- ---------------------------Aggregations -------------------

SELECT AVG(salary) avg_salaray from employees;

SELECT MAX(salary) max_salaray from employees;

SELECT SUM(salary) salaray_sum from employees;




-- ----------------------Group By ----------------------------

SELECT deptid, AVG(salary)  from employees GROUP BY deptid;



SELECT deptid, SUM(salary)  from employees GROUP BY deptid;


SELECT * FROM departments d 
INNER JOIN employees e ON e.deptid = d.deptid



SELECT d.name , AVG(e.salary),SUM(e.salary),MAX(e.salary),MIN(e.salary) ,count(*)FROM employees e
 FULL JOIN departments d ON e.deptid = d.deptid
 GROUP BY d.deptid;



SELECT d.name , AVG(e.salary),SUM(e.salary),MAX(e.salary),MIN(e.salary) ,count(*)FROM employees e
 FULL JOIN departments d ON e.deptid = d.deptid
 GROUP BY d.deptid HAVING AVG(e.salary)> 70000;





-- ---------------------------- task----------------

-- task 1

SELECT name , salary FROM employees WHERE deptid = 1;


-- task 2
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, total_amount)
VALUES
    (101, 1, 200.00),
    (102, 2, 300.00),
    (103, 1, 150.00),
    (104, 3, 400.00),
    (105, 2, 250.00);


SELECT customer_id, AVG(total_amount) FROM orders
GROUP BY customer_id HAVING AVG(total_amount) >=250;






--  task 3

-- CREATE TABLE students (
--     student_id INT PRIMARY KEY,
--     student_name VARCHAR(50),
--     age INT,
--     gender VARCHAR(10)
-- );

-- CREATE TABLE courses (
--     course_id INT PRIMARY KEY,
--     course_name VARCHAR(50),
--     credits INT
-- );

-- INSERT INTO students (student_id, student_name, age, gender)
-- VALUES
--     (1, 'Alice', 22, 'Female'),
--     (2, 'Bob', 21, 'Male'),
--     (3, 'Charlie', 23, 'Male');

-- INSERT INTO courses (course_id, course_name, credits)
-- VALUES
--     (101, 'Mathematics', 3),
--     (102, 'History', 4),
--     (103, 'Physics', 3);

-- -- Enrollment table with student-course relationships
-- CREATE TABLE enrollment (
--     enrollment_id INT PRIMARY KEY,
--     student_id INT,
--     course_id INT
-- );

-- INSERT INTO enrollment (enrollment_id, student_id, course_id)
-- VALUES
--     (1, 1, 101),
--     (2, 1, 102),
--     (3, 2, 103),
--     (4, 3, 101);






SELECT s.student_name , cr.course_name, cr.credits FROM students s
JOIN enrollment e on s.student_id = e.student_id
JOIN courses cr on cr.course_id = e.course_id;




--  Task 4





CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employees (emp_id, emp_name, department_id)
VALUES
    (1, 'John Doe', 1),
    (2, 'Jane Smith', 2),
    (3, 'Michael Johnson', 1),
    (4, 'Emily Brown', 3);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

INSERT INTO salaries (emp_id, salary)
VALUES
    (1, 50000.00),
    (2, 60000.00),
    (3, 55000.00),
    (4, 52000.00);



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2023-01-05', 200.00),
    (102, 2, '2023-01-06', 300.00),
    (103, 1, '2023-02-10', 150.00),
    (104, 3, '2023-02-15', 400.00),
    (105, 2, '2023-03-20', 250.00);




SELECT to_char(order_date,'Month'), SUM(total_amount), COUNT(*) 
FROM orders
GROUP BY to_char(order_date,'Month');






-- ==================== Sub quires  --------------------------------


SELECT * FROM employees WHERE salary IN (
    SELECT salary FROM employees WHERE name LIKE 'a%'
);


