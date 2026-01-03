show databases;
use school_db;
show tables;
select * from department;

select * from employee;
DESC department;

create table emp(
e_id int primary key auto_increment,
e_name varchar(50) not null,
e_location varchar(50) unique not null,
created_at timestamp default current_timestamp,
updated_at timestamp  default  current_timestamp on  update current_timestamp
);
select * from emp;
insert into emp( e_id,e_name,e_location)
values(
1,"bhavesh","jasdan"),
(2,"manish","rajkot"),
(3,"rahul","up"),
(4,"sanjay","bihar");

 update emp
 SET e_name="rahul"
 where e_id=3;
 
 update emp
 SET e_name="lalit",
	 e_location="shree lanka"
 where e_id=3;
 
 select * from emp
 where e_id=4;
 
 alter table emp
 change e_name emp_name varchar(50);  -- change query change the name data-type and constraint
 
 alter table emp
 change e_id emp_id int, 
 change	e_location emp_location varchar(50);
 desc emp;
 
 alter table emp
 rename column created_at TO emp_createdat,
 rename column updated_at TO emp_updated_at;
 
 select * from emp;
 
 -- drop primary key
 desc emp;
 alter table emp
 drop primary key;
 
 -- add new column
 alter table emp
 add column new_col_salary varchar(50);
 
  -- add primary key
  alter table emp
  add primary key(emp_id);
  
  -- fill the null values
  update emp
  SET new_col_salary=5000
  where new_col_salary is null;
  
UPDATE emp
SET new_col_salary = 5000
WHERE new_col_salary IS NULL;

  
  select * from emp;
 
 
 -- TODAY'S NEW 
 CREATE database company_db;
 use company_db;
 
 create table employees(
 e_id int primary key auto_increment,
 e_name  varchar(50),
 e_age int,
 e_department varchar(50),
 e_salary decimal(10,2),
 e_city varchar(50)
 );
 
 insert into employees (e_name, e_age, e_department, e_salary, e_city) VALUES
('Alice Johnson', 30, 'HR', 50000, 'New York'),
('Bob Smith', 25, 'IT', 70000, 'Los Angeles'),
('Charlie Brown', 35, 'IT', 80000, 'New York'),
('David Wilson', 40, 'Finance', 90000, 'Chicago'),
('Emily Davis', 28, 'HR', 48000, 'San Francisco'),
('Franklin Moore', 32, 'IT', 75000, 'Los Angeles'),
('Grace Adams', 45, 'Finance', 95000, 'Chicago');

select * from employees;

select * from employees
where e_department="it" AND e_salary >70000;

select * from employees
where  e_department="hr" or e_city="new york";

select * from employees
where   not e_department="finance";


select * from employees
where (e_department="it" or e_salary>70000) or e_department="finance";

select * from employees
where not e_department="finance" or not e_city="chicago";
-------------------------------------------------------------------
CREATE DATABASE StoreDB;
USE StoreDB;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 1200.00, 10),
('Phone', 'Electronics', 800.00, 15),
('Tablet', 'Electronics', 600.00, 20),
('Headphones', 'Accessories', 150.00, 50),
('Mouse', 'Accessories', 30.00, 100),
('Keyboard', 'Accessories', 45.00, 80);

select * from products;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(50)
);

use StoreDB;
show tables;

-- Insert sample data into orders table
INSERT INTO orders (order_date, customer_name) VALUES
('2024-02-01', 'Alice'),
('2024-02-05', 'Bob'),
('2024-02-10', 'Charlie'),
('2024-02-15', 'David');

select * from orders;
select * from products;


-- Get all products with a price of exactly 600
SELECT * FROM products 
WHERE price = 600;

-- Get all products that are NOT priced at 800
SELECT * FROM products
 WHERE price <> 800;
 
SELECT * FROM products
 WHERE price != 800;
 
 SELECT * FROM products
 WHERE not price= 800;
 
 -- Get all products priced below 500
SELECT * FROM products 
WHERE price < 500;


-- Get all products priced at or below 150
SELECT * FROM products 
WHERE price <= 150;

-- Get all products where the category is exactly "Electronics"
SELECT * FROM products 
WHERE category = 'Electronics';


-- Retrieve Orders Placed Before February 10, 2024
SELECT * FROM orders 
WHERE order_date < '2024-02-10';


-- String comparison example (alphabetical ordering)
SELECT * FROM products 
WHERE product_name > 'Mouse';

-- Numeric comparison with strings (lexicographic comparison)
SELECT '100' >= '2';

-- Another string comparison example (lexicographic ordering)
SELECT 100 < '211fcfc';



-- new --

CREATE DATABASE db12;
USE db12;
show databases;

-- Create a products table with various data types
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    last_updated TIMESTAMP
);
select * from products;
-- Insert initial sample data
INSERT INTO products VALUES
(1, 'Laptop Pro', 'Electronics', 1299.99, 50, '2024-01-15 10:00:00'),
(2, 'Desk Chair', 'Furniture', 199.99, 30, '2024-01-16 11:30:00'),
(3, 'Coffee Maker', 'Appliances', 79.99, 100, '2024-01-14 09:15:00'),
(4, 'Gaming Mouse', 'Electronics', 59.99, 200, '2024-01-17 14:20:00'),
(5, 'Bookshelf', 'Furniture', 149.99, 25, '2024-01-13 16:45:00');

-- Section 2: Basic Sorting Operations
-- ---------------------------------
-- Display all records (unsorted)
SELECT * FROM products;

-- Sort by price in ascending order (ASC is optional as it's the default)
SELECT * FROM products 
ORDER BY price asc;

-- Sort by last updated timestamp
SELECT * FROM products 
ORDER BY   last_updated;

-- Section 3: Advanced Sorting Techniques
-- ------------------------------------
-- Multiple column sorting (sort by category descending, then price descending)
SELECT * FROM products 
ORDER BY category DESC, price DESC;

-- Sort using column position (4 represents the price column)
SELECT * FROM products 
ORDER BY 4 ;

-- Combining WHERE clause with ORDER BY
SELECT * FROM products 
WHERE category = 'Electronics' 
ORDER BY price;

-- Case-sensitive sorting using BINARY
SELECT * FROM products 
ORDER BY BINARY category;

-- Section 4: Function-Based Sorting
-- -------------------------------
-- Sort by product name length
SELECT * FROM products 
ORDER BY LENGTH(product_name);

-- Sort by day of the month from timestamp
SELECT * FROM products 
ORDER BY DAY(last_updated);

-- Using LIMIT with ORDER BY to find highest stock quantity
SELECT * FROM products 
ORDER BY stock_quantity DESC 
LIMIT 2;

-- Section 5: Custom Sorting Orders
-- -----------------------------
-- Default category sorting
SELECT * FROM products 
ORDER BY category;

-- Custom category order using FIELD function
SELECT * FROM products 
ORDER BY FIELD(category, 'Electronics','Appliances','Furniture'), price DESC;

-- Section 6: Complex Sorting with Conditions
-- ---------------------------------------
-- Simple conditional sorting for low stock and high price items
SELECT *, 
    stock_quantity <= 50 AND price >= 200 AS priority_flag
FROM products 
ORDER BY (stock_quantity <= 50 AND price >= 200) DESC;

-- Advanced priority-based sorting using CASE
SELECT *,
    CASE
        WHEN stock_quantity <= 50 AND price >= 200 THEN 1
        WHEN stock_quantity <= 50 THEN 2
        ELSE 3
    END AS priority 
FROM products 
ORDER BY priority;

-- Section 7: Handling NULL Values
-- ----------------------------
-- Add records with NULL values for demonstration
INSERT INTO products VALUES
(6, 'Desk Lamp', 'Furniture', NULL, 45, '2024-01-18 13:25:00'),
(7, 'Keyboard', 'Electronics', 89.99, NULL, '2024-01-19 15:10:00');

-- Basic NULL handling in ORDER BY
SELECT * FROM products 
ORDER BY price;

-- Explicit NULL handling
SELECT *, 
    price IS NULL
FROM products 
ORDER BY price IS NULL;

-- Section 8: Working with Calculated Columns
-- --------------------------------------
-- Sort by total value (price * quantity)
SELECT *, 
    price * stock_quantity AS total_value 
FROM products 
ORDER BY total_value DESC;

-- Section 9: Query Performance Analysis
-- ---------------------------------
-- Examine query execution plan for multi-column sort
EXPLAIN SELECT * FROM products
ORDER BY category, price;

-- Compare with primary key sort performance
EXPLAIN SELECT * FROM products 
ORDER BY product_id;


-- new 17-12-2025 ---

-- 1. Setup and Sample Data

CREATE DATABASE db13;
USE db13;

-- Create products table
CREATE TABLE products (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
price DECIMAL(10,2),
category VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO products (name, price, category) VALUES
('Laptop', 999.99, 'Electronics'),
('Smartphone', 499.99, 'Electronics'),
('Coffee Maker', 79.99, 'Appliances'),
('Headphones', 149.99, 'Electronics'),
('Blender', 59.99, 'Appliances'),
('Tablet', 299.99, 'Electronics'),
('Microwave', 199.99, 'Appliances'),
('Smart Watch', 249.99, 'Electronics'),
('Toaster', 39.99, 'Appliances'),
('Speaker', 89.99, 'Electronics');

-- 2. Basic LIMIT Usage

-- Return first 2 products
SELECT * FROM products 
ORDER BY id LIMIT 2;

-- 3. LIMIT with OFFSET

-- Syntax 1: LIMIT [row_count] OFFSET [offset]
SELECT * FROM products 
ORDER BY id LIMIT 2 OFFSET 2;
-- Syntax 2: LIMIT [offset], [row_count]
SELECT * FROM products 
ORDER BY id LIMIT 2, 2;

-- 4. Pagination Implementation

-- Page size: 3 items per page
-- For page 1 (Using OFFSET syntax):
SELECT * FROM products 
LIMIT 3 OFFSET 0;
-- For page 2:
SELECT * FROM products 
LIMIT 3 OFFSET 3;
-- For page 3:
SELECT * FROM products 
LIMIT 3 OFFSET 6;
-- Alternative syntax using LIMIT offset, count
-- For page 1:
SELECT * FROM products LIMIT 0, 3;
-- For page 2:
SELECT * FROM products LIMIT 3, 3;
-- For page 3:
SELECT * FROM products LIMIT 6, 3;
-- Generic formula for pagination:
-- LIMIT (page_number - 1) * items_per_page, items_per_page

-- 5. Common Use Cases

-- Top 3 most expensive products
SELECT * FROM products
ORDER BY price DESC
LIMIT 3;
-- Get 5 random products
SELECT * FROM products
ORDER BY RAND()
LIMIT 5;

-- 6. Performance Considerations

-- Example of potentially slow query with large offset
SELECT *
FROM products  -- Note: In real scenario, this would be a much larger table
ORDER BY created_at
LIMIT 1000000, 10;
-- Better alternative using WHERE clause
SELECT *
FROM products
WHERE created_at > '2025-01-01 00:00:00'
ORDER BY created_at
LIMIT 10;

-- Key Takeaways

/*
✅ LIMIT helps in retrieving a specific number of rows
✅ LIMIT offset, count is used for pagination
✅ Combining ORDER BY with LIMIT is essential for meaningful result sets
✅ Be cautious about performance impacts when using high offset values
*/

-- drived table temparary table aliase table


-- Create and use the database
CREATE DATABASE db16;
USE db16;

-- Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);
INSERT INTO employees VALUES
    (1, 'John', 'Doe', 60000.00, '2020-01-15'),
    (2, 'Jane', 'Smith', 65000.00, '2019-11-20'),
    (3, 'Mike', 'Johnson', 55000.00, '2021-03-10');

select * from employees;

SELECT 
    CONCAT(first_name, " ", last_name) AS full_name 
FROM employees;

select emp_id as id from employees;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
    (1, 'Engineering', 'New York'),
    (2, 'Marketing', 'Los Angeles'),
    (3, 'Finance', 'Chicago');
    

select * from departments;
select * from employees;


-- Add department reference to employees table
ALTER TABLE employees 
ADD COLUMN department_id INT;

-- Using table aliases in JOIN operations
SELECT 
    e.first_name,
    e.last_name,
    d.dept_name 
FROM employees AS e 
JOIN departments AS d 
    ON e.department_id = d.dept_id;


select * from employees
-- Using aliases in subqueries
SELECT avg_salary.average_salary
FROM (
    SELECT AVG(salary) AS average_salary 
    FROM employees
) AS avg_salary;


select avg(salary) as avg_salary from employees;

select  sal.average_salar from (select avg(salary) as average_salar from employees) as sal

-- duplicate remove distinct
-- 17-12-2025


-- Create and use the database
CREATE DATABASE EmployeeDB;
USE EmployeeDB;

-- Create employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Insert sample data including duplicates
INSERT INTO employees (name, department, salary) 
VALUES
    ('Alice', 'HR', 50000),
    ('Bob', 'Finance', 60000),
    ('Charlie', 'IT', 70000),
    ('Alice', 'HR', 50000),      -- Duplicate record
    ('David', 'Finance', 55000),
    ('Eve', 'IT', 70000),        -- Duplicate salary
    ('Frank', 'HR', 50000);      -- Duplicate department & salary

-- View all employees
SELECT * FROM employees;



-- Example 1: Using DISTINCT on a single column
-- Get unique departments
SELECT DISTINCT department 
FROM employees;

-- Example 2: Using DISTINCT on multiple columns
-- Get unique department-salary combinations
SELECT DISTINCT department, salary 
FROM employees;

-- Example 3: Using DISTINCT with aggregate functions
-- Count number of unique departments
SELECT COUNT(DISTINCT department) AS unique_departments 
FROM employees;

-- Example 4: Using DISTINCT with string functions
-- Get unique name-department combinations
SELECT DISTINCT CONCAT(name, '-', department) as new
FROM employees;

-- Example 5: Using DISTINCT with ORDER BY
-- Get unique salaries in descending order
SELECT DISTINCT salary 
FROM employees 
ORDER BY salary DESC;

-- Example 6: Using DISTINCT with WHERE clause
-- Get unique departments where salary is greater than 50000
SELECT DISTINCT department 
FROM employees 
WHERE salary > 50000;

-- Display current data
SELECT * FROM employees;

-- Example 7: Handling NULL values with DISTINCT
-- Insert records with NULL departments
INSERT INTO employees (name, department, salary) VALUES 
    ('Grace', NULL, 48000),
    ('Bobby', NULL, 48000);

-- Show how DISTINCT handles NULL values
SELECT DISTINCT department 
FROM employees;



--------------------------------------------------------- 