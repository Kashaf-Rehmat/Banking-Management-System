# Banking Management System

## Overview

The Banking Management System is a Database Management System (DBMS) project developed using SQL. The project models the operations of a bank by managing customers, accounts, loans, branches, employees, managers, transactions, and related information.

This project demonstrates database design concepts including entity relationships, primary keys, foreign keys, referential integrity constraints, and SQL queries.

---

## Features

- Bank and Branch Management
- Customer Information Management
- Employee and Manager Records
- Account Creation and Maintenance
- Loan Management
- Transaction Tracking
- Customer Address Management
- Branch Contact Information
- Employee Dependants Management
- Relationship Mapping between Employees and Customers

---

## Database Entities

The system contains the following tables:

| Table Name | Description |
|------------|-------------|
| Bank | Stores bank information |
| Branch | Stores branch details |
| Employee | Stores employee records |
| Manager | Stores manager information |
| Customers | Stores customer details |
| Account | Stores customer account information |
| Loan | Stores loan records |
| Transactions | Stores account transactions |
| Address | Stores customer addresses |
| ContactNo | Stores branch contact numbers |
| Dependants | Stores employee dependants |
| Dealt_By | Maps employees to customers |

---

## Database Concepts Implemented

- Primary Keys
- Foreign Keys
- Composite Keys
- Referential Integrity
- One-to-Many Relationships
- Many-to-Many Relationships
- Self-Referencing Relationships
- Data Insertion using SQL
- Database Creation and Management

---

## Technologies Used

- SQL
- MySQL

---

## Entity Relationship Highlights

### Bank → Branch
One bank can have multiple branches.

### Branch → Employee
Each branch can employ multiple employees.

### Employee → Employee
Employees can have supervisors using a self-referencing foreign key.

### Customer → Account
A customer can own one or more bank accounts.

### Customer → Loan
A customer can have multiple loans.

### Account → Transactions
Each account can contain multiple transactions.

---

## Sample Data Included

The database includes sample records for:

- Banks
- Branches
- Employees
- Managers
- Customers
- Accounts
- Loans
- Transactions

This data is provided to demonstrate the functionality of the system.

---

## Learning Outcomes

Through this project, the following database concepts were practiced:

- Database Design
- ER Modeling
- Normalization
- SQL DDL Commands
- SQL DML Commands
- Constraints and Relationships
- Data Integrity Enforcement

---

## How to Run

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench.
3. Create a new SQL script.
4. Copy and paste the project SQL code.
5. Execute the script.
6. The database and tables will be created automatically along with sample data.

---

## Project Type

Academic Database Systems Project

---

## Authors

**Kashaf Rehmat**  
Database Systems Project
