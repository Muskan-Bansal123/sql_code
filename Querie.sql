Create database employee;
USE employee;
create table dept_info(
DEPTID VARCHAR(10) PRIMARY KEY,
DEPTNAME VARCHAR(20),
LOCATION VARCHAR(20));

create table salary_info(
EMPLOYEE_CATEGORY VARCHAR(1) PRIMARY KEY,
BASIC DECIMAL(7,2),
HOUSE_RENT_ALLOWANCE DECIMAL(6,2));

CREATE TABLE employee_info (
    EMPID VARCHAR(10) PRIMARY KEY,
    EMPNAME VARCHAR(20),
    DEPTID VARCHAR(10) REFERENCES dept_info(DEPTID),
    EMPLOYEE_CATEGORY VARCHAR(1) REFERENCES salary_info(EMPLOYEE_CATEGORY)
);

INSERT INTO dept_info (DEPTID, DEPTNAME, LOCATION) VALUES
('D001', 'Human Resources', 'Banglore'),
('D002', 'Finance', 'Cochin'),
('D003', 'IT', 'Pune'),
('D004', 'Marketing', 'Boston'),
('D005', 'Sales', 'Los Angeles');

INSERT INTO employee_info (EMPID, EMPNAME, DEPTID, EMPLOYEE_CATEGORY) VALUES
('E001', 'John Doe', 'D001', 'A'),
('E002', 'Jane Smith', 'D002', 'B'),
('E003', 'Alice Johnson', 'D003', 'C'),
('E004', 'Bob Brown', 'D004', 'D'),
('E005', 'Charlie White', 'D005', 'E');

INSERT INTO salary_info (EMPLOYEE_CATEGORY, BASIC, HOUSE_RENT_ALLOWANCE) VALUES
('A', 50000.00, 1000.00),
('B', 40000.00, 8000.00),
('C', 30000.00, 6000.00),
('D', 25000.00, 5000.00),
('E', 20000.00, 4000.00);



select E.EMPID,E.EMPNAME,D.DEPTNAME,S.HOUSE_RENT_ALLOWANCE FROM dept_info as D JOIN employee_info as E on D.DEPTID=E.DEPTID JOIN salary_info as S on E.EMPLOYEE_CATEGORY=S.EMPLOYEE_CATEGORY where D.LOCATION IN('Banglore','Pune');