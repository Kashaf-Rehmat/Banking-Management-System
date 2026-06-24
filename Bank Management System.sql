drop database bank_management_system;

create database bank_management_system;
use bank_management_system;

create table bank(
bankName varchar(20) primary key,
location varchar(50)
);

create table branch (
branchId int primary key,
branchName varchar(25),
branchLocation varchar(50),
bank_name varchar(20),

constraint fk_1 foreign key(bank_name) references bank (bankName)
on delete set null on update cascade
);

create table employee(
employeeId int primary key,
employeeName varchar(30),
dateOfBirth date,
designation varchar (20),
salary int ,
branch_id int ,
supervisorId int ,

constraint fk_2 foreign key(branch_id) references branch (branchId),
constraint fk_3 foreign key(supervisorId) references employee (employeeId)
);

create table manager(
managerId int primary key,
managerName varchar(30),
branch_id int ,

constraint fk_4 foreign key(branch_id) references branch (branchId)
);

create table customers(
customerId int primary key,
fname varchar(20),
lname varchar(20),
phoneNo varchar(15),
email varchar(50)
);

create table loan(
loanId int primary key,
duration datetime,
loanAmount int ,
customer_id int ,
constraint fk_5 foreign key(customer_id) references customers (customerId)
);

create table  account(
accountNo int primary key ,
opendate date,
type varchar(20),
customer_id int ,
constraint fk_6 foreign key(customer_id) references customers (customerId)
);

create table contactNo(
branch_id int ,
contactNo varchar(15) ,
primary key(branch_id,contactNo)
);

create table address(
customer_id int ,
address varchar(30),
primary key(customer_id,address),

constraint fk_7 foreign key(customer_id) references customers(customerId)
);

alter table contactNo
add constraint fk_8 foreign key(branch_id) references branch(branchId);

create table dependants(
emp_id int,
dependant_name varchar(30),
dob date,
gender char(1),
relationship varchar(20),
constraint fk_9 foreign key(emp_id) references employee(employeeId)
);

alter table dependants
add primary key(emp_id,dependant_name);

create table transactions(
acc_no int ,
id int,
date date,
amount int,
deposit int,
withdrawl int,
primary key(acc_no,id),
constraint fk_10 foreign key(acc_no) references account(accountNo)
);


create table dealt_by(
emp_id int,
customer_id int ,
primary key(customer_id,emp_id),

constraint fk_11 foreign key(customer_id) references customers(customerId),
constraint fk_12 foreign key(emp_id) references employee(employeeId)
);



insert into bank values  ('National Bank', 'Karachi'),
('City Bank', 'Lahore'),
('Allied Bank', 'Islamabad'),
('Habib Bank', 'Peshawar'),
('UBL', 'Quetta'),
('Meezan Bank', 'Multan'),
('Askari Bank', 'Faisalabad'),
('Faysal Bank', 'Hyderabad');


insert into branch values 
(1, 'Main Branch', 'Karachi', 'National Bank'),
(2, 'Gulberg Branch', 'Lahore', 'City Bank'),
(3, 'Blue Area Branch', 'Islamabad', 'Allied Bank'),
(4, 'Saddar Branch', 'Peshawar', 'Habib Bank'),
(5, 'Cantt Branch', 'Quetta', 'UBL'),
(6, 'Shah Rukn Branch', 'Multan', 'Meezan Bank'),
(7, 'People Colony Branch', 'Faisalabad', 'Askari Bank'),
(8, 'Latifabad Branch', 'Hyderabad', 'Faysal Bank');


insert into employee values 
(101, 'Ali Khan', '1980-05-12', 'Manager', 120000, 1, NULL),
(102, 'Sara Ali', '1985-03-22', 'Clerk', 50000, 1, 101),
(103, 'Bilal Ahmad', '1990-07-15', 'Officer', 70000, 2, 101),
(104, 'Ayesha Noor', '1988-11-30', 'Officer', 75000, 3, 102),
(105, 'Zain Raza', '1992-09-17', 'Clerk', 52000, 2, 103),
(106, 'Farah Javed', '1991-02-10', 'Clerk', 54000, 4, 101),
(107, 'Hamza Qureshi', '1983-12-01', 'Manager', 130000, 5, NULL),
(108, 'Nida Imran', '1989-06-25', 'Officer', 72000, 6, 105);


insert into manager values
(201, 'Ali Khan', 1),
(202, 'Hamza Qureshi', 5),
(203, 'Imran Siddiqui', 2),
(204, 'Tariq Mehmood', 3),
(205, 'Sameer Shah', 4),
(206, 'Kamran Aziz', 6),
(207, 'Noman Zafar', 7),
(208, 'Faizan Latif', 8);


insert into  customers values
(301, 'Ahmad', 'Raza', '03001234567', 'ahmed@gmail.com'),
(302, 'Sana', 'Khan', '03111234567', 'sana@yahoo.com'),
(303, 'Usman', 'Ali', '03211234567', 'usman@hotmail.com'),
(304, 'Maria', 'Iqbal', '03331234567', 'maria@gmail.com'),
(305, 'Hassan', 'Shah', '03441234567', 'hassan@gmail.com'),
(306, 'Fatima', 'Zahid', '03551234567', 'fatima@yahoo.com'),
(307, 'Zara', 'Yousuf', '03661234567', 'zara@hotmail.com'),
(308, 'Omar', 'Farooq', '03771234567', 'omar@gmail.com');


INSERT INTO loan VALUES
(401, '2023-01-01 00:00:00', 500000, 301),
(402, '2022-05-15 00:00:00', 300000, 302),
(403, '2021-08-20 00:00:00', 700000, 303),
(404, '2023-03-10 00:00:00', 250000, 304),
(405, '2022-12-05 00:00:00', 400000, 304),
(406, '2021-07-07 00:00:00', 600000, 306),
(407, '2023-02-14 00:00:00', 350000, 301),
(408, '2022-11-22 00:00:00', 450000, 308);



INSERT INTO account VALUES
(501, '2020-01-01', 'Saving', 301),
(502, '2020-02-15', 'Current', 302),
(503, '2021-03-20', 'Saving', 303),
(504, '2021-04-25', 'Current', 301),
(505, '2022-05-30', 'Saving', 305),
(506, '2022-06-10', 'Saving', 306),
(507, '2023-07-12', 'Current', 307),
(508, '2023-08-18', 'Saving', 302);




INSERT INTO contactNo VALUES
(1, '3376512683'),
(1, '3287567395'),
(2, '9265386539'),
(2, '3356886621'),
(3, '3377991111'),
(4, '3389231567'),
(5, '3327861011'),
(6, '2783281678');


INSERT INTO address VALUES
(301, 'Street 1, Karachi'),
(301, 'Street 2, Karachi'),
(302, 'Gulberg, Lahore'),
(303, 'Blue Area, Islamabad'),
(304, 'Saddar, Peshawar'),
(305, 'Cantt, Quetta'),
(306, 'Shah Rukn, Multan'),
(307, 'People Colony, Faisalabad'),
(308, 'Latifabad, Hyderabad');




INSERT INTO dependants VALUES
(101, 'Hina', '2010-05-05', 'F', 'Daughter'),
(101, 'Saad', '2012-09-09', 'M', 'Son'),
(102, 'Ali Jr.', '2015-07-07', 'M', 'Son'),
(103, 'Noor', '2014-08-08', 'F', 'Daughter'),
(104, 'Haris', '2013-06-06', 'M', 'Son'),
(105, 'Aiman', '2016-10-10', 'F', 'Daughter'),
(107, 'Sara', '2011-12-12', 'F', 'Daughter'),
(108, 'Zara', '2017-03-03', 'F', 'Daughter');



INSERT INTO transactions VALUES
(501, 1, '2023-01-01', 5000, 5000, 0),
(501, 2, '2023-02-01', 2000, 0, 2000),
(502, 1, '2023-03-01', 10000, 10000, 0),
(503, 1, '2023-04-01', 7000, 7000, 0),
(504, 1, '2023-05-01', 3000, 0, 3000),
(505, 1, '2023-06-01', 4000, 4000, 0),
(506, 1, '2023-07-01', 6000, 6000, 0),
(507, 1, '2023-08-01', 3500, 0, 3500);



SELECT c.customerId, c.fname, c.lname
FROM customers c
WHERE c.customerId IN ( SELECT customer_id
                         FROM account 
                          WHERE type = 'Saving'
)
AND c.customerId IN ( SELECT customer_id 
                       FROM account 
                      WHERE type = 'Current'
);


SELECT DISTINCT e.employeeId, e.employeeName
FROM employee e
WHERE e.employeeId IN ( SELECT supervisorId
                        FROM employee 
                        WHERE supervisorId IS NOT NULL
);



SELECT acc_no, count(*) AS t_count
FROM transactions
GROUP BY acc_no
HAVING count(*) > 1;


SELECT b.branchName, b.branchLocation
FROM branch b
WHERE b.bank_name IN ( SELECT bankName
                      FROM bank 
                      WHERE location = 'Karachi'
);


SELECT c.customerId, c.fname, c.lname
FROM customers c
WHERE c.customerId NOT IN (SELECT customer_id
                                FROM loan);


SELECT c.fname, c.lname, SUM(l.loanAmount) AS total_loan
FROM customers c
JOIN loan l ON c.customerId = l.customer_id
GROUP BY l.customer_id;



SELECT a.accountNo, MAX(t.date) AS last_tx_date
FROM account a
JOIN transactions t ON a.accountNo = t.acc_no
GROUP BY a.accountNo;


SELECT m.managerName, b.branchName, ba.bankName
FROM manager m
JOIN branch b ON m.branch_id = b.branchId
JOIN bank ba ON b.bank_name = ba.bankName;





SELECT c.customerId, c.fname, l.duration
FROM customers c
LEFT JOIN loan l ON c.customerId = l.customer_id;


SELECT c.customerId, c.fname, l.loanAmount
FROM customers c
LEFT JOIN loan l ON c.customerId = l.customer_id AND l.loanAmount > 400000;


SELECT e.employeeId, e.employeeName, e.salary
FROM employee e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employee e2
    WHERE e2.branch_id = e.branch_id
);


SELECT c.customerId, c.fname, c.lname
FROM customers c
JOIN loan l ON c.customerId = l.customer_id
WHERE l.loanAmount > ALL (
    SELECT (SUM(deposit) - SUM(withdrawl)) FROM transactions GROUP BY acc_no
);


SELECT c.customerId, c.fname, c.lname
FROM customers c
WHERE c.customerId = (
    SELECT customer_id FROM loan
    WHERE loanAmount = (
        SELECT MAX(loanAmount) FROM loan
    ));



SELECT m.managerId, m.managerName
FROM manager m
WHERE NOT EXISTS (
  SELECT * FROM employee e
  WHERE e.branch_id = m.branch_id AND e.salary < 50000
);


SELECT DISTINCT e.employeeId, e.employeeName
FROM employee e
WHERE EXISTS (
  SELECT * FROM employee s
  WHERE s.supervisorId = e.employeeId AND s.salary > e.salary
);


SELECT YEAR(duration) AS loan_year, AVG(loanAmount) AS avg_loan
FROM loan
GROUP BY YEAR(duration);


SELECT designation, COUNT(*) AS emp_count
FROM employee
GROUP BY designation;


SELECT acc_no, SUM(deposit) AS total_deposit, SUM(withdrawl) AS total_withdrawl
FROM transactions
GROUP BY acc_no;

SELECT branch_id, SUM(salary) AS total_salary
FROM employee
GROUP BY branch_id;


SELECT acc_no, MAX(amount) AS max_tx
FROM transactions
GROUP BY acc_no;




SELECT * 
FROM customers 
WHERE email LIKE '%gmail%';


SELECT *
 FROM customers 
 WHERE fname LIKE 'S%';


SELECT * 
FROM branch
 WHERE branchName LIKE '%Area%';


SELECT * 
FROM customers
 WHERE phoneNo LIKE '%67';
 
 
 SELECT * 
 FROM bank
 WHERE bankName LIKE 'A%' OR bankName LIKE 'F%';

