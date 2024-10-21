CREATE DATABASE HBANK;
use HBANK;

CREATE TABLE Account (
    Account_ID CHAR(11) NOT NULL,
    Account_RoutingNum CHAR(9) NOT NULL,
    Account_DateOpened DATE NOT NULL,
    Account_Balance DECIMAL(10,2) NOT NULL,
    Account_Type VARCHAR(11) NOT NULL,
    PRIMARY KEY (Account_ID)
);

CREATE TABLE Savings_Account (
    Account_ID CHAR(11) NOT NULL,
    Savings_Interest DECIMAL(5,3) NOT NULL,
    PRIMARY KEY (Account_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);

CREATE TABLE Checking_Account (
    Account_ID CHAR(11) NOT NULL,
    MinimumBalance DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Account_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);

CREATE TABLE BankBranch (
    Bank_ID CHAR(11) NOT NULL,
    Bank_Address VARCHAR(100) NOT NULL,
    PRIMARY KEY (Bank_ID)
);

CREATE TABLE Customer (
    Customer_ID CHAR(11) NOT NULL,
    Customer_Fname VARCHAR(20) NOT NULL,
    Customer_Lname VARCHAR(20) NOT NULL,
    Customer_PhoneNum CHAR(10) NOT NULL,
    Customer_Address VARCHAR(70) NOT NULL,
    Bank_ID CHAR(11) NOT NULL,
    PRIMARY KEY (Customer_ID),
    FOREIGN KEY (Bank_ID) REFERENCES BankBranch(Bank_ID)
);

CREATE TABLE Customer_Account (
    Customer_ID CHAR(11) NOT NULL,
    Account_ID CHAR(11) NOT NULL,
    PRIMARY KEY (Customer_ID, Account_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);

CREATE TABLE Job (
    Job_ID CHAR(11) NOT NULL,
    Job_Title VARCHAR(50) NOT NULL,
    Job_Description VARCHAR(100),
    PRIMARY KEY (Job_ID)
);

CREATE TABLE Employee (
    Employee_ID CHAR(11) NOT NULL,
    Employee_Fname VARCHAR(20) NOT NULL,
    Employee_Lname VARCHAR(20) NOT NULL,
    Job_ID CHAR(11) NOT NULL,
    Employee_Salary DECIMAL(10,2) NOT NULL,
    Bank_ID CHAR(11) NOT NULL,
    PRIMARY KEY (Employee_ID),
    FOREIGN KEY (Job_ID) REFERENCES Job(Job_ID),
    FOREIGN KEY (Bank_ID) REFERENCES BankBranch(Bank_ID)
);

CREATE TABLE Transaction (
    Transaction_ID CHAR(11) NOT NULL,
    Transaction_Date DATE NOT NULL,
    Transaction_Amount DECIMAL(10,2) NOT NULL,
    Account_ID CHAR(11) NOT NULL,
    PRIMARY KEY (Transaction_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);

INSERT INTO Account (Account_ID, Account_RoutingNum, Account_DateOpened, Account_Balance, Account_Type) VALUES
('A000001', '123456789', '2023-01-15', 5000.00, 'Savings'),
('A000002', '987654321', '2022-05-20', 2500.00, 'Checking'),
('A000003', '555111222', '2023-03-10', 10000.00, 'Savings'),
('A000004', '444333222', '2021-12-05', 7500.00, 'Checking'),
('A000005', '999888777', '2024-01-01', 3000.00, 'Savings'),
('A000006', '111222333', '2022-08-10', 7000.00, 'Checking'),
('A000007', '777888999', '2023-05-15', 15000.00, 'Savings'),
('A000008', '333444555', '2022-11-20', 4000.00, 'Checking'),
('A000009', '888999000', '2023-07-10', 6000.00, 'Savings'),
('A000010', '555444333', '2022-09-05', 8200.00, 'Checking'),
('A000011', '123696710', '2023-01-15', 5000.00, 'Savings'),
('A000012', '987611321', '2022-05-20', 2500.00, 'Checking'),
('A000013', '555141222', '2023-03-10', 10000.00, 'Savings'),
('A000014', '444333122', '2021-12-05', 7500.00, 'Checking'),
('A000015', '999788777', '2024-01-01', 3000.00, 'Savings'),
('A000016', '118222333', '2022-08-10', 7000.00, 'Checking'),
('A000017', '776888999', '2023-05-15', 15000.00, 'Savings'),
('A000018', '332444555', '2022-11-20', 4000.00, 'Checking'),
('A000019', '878999000', '2023-07-10', 6000.00, 'Savings'),
('A000020', '533444333', '2022-09-05', 8200.00, 'Checking');

INSERT INTO Savings_Account (Account_ID, Savings_Interest) VALUES
('A000001', 0.05),
('A000003', 0.03),
('A000005', 0.04),
('A000007', 0.025),
('A000009', 0.035),
('A000011', 0.045),
('A000013', 0.04),
('A000015', 0.03),
('A000017', 0.035),
('A000019', 0.05);

INSERT INTO Checking_Account (Account_ID, MinimumBalance) VALUES
('A000002', 1000.00),
('A000004', 1500.00),
('A000006', 2000.00),
('A000008', 1200.00),
('A000010', 2500.00),
('A000012', 1800.00),
('A000014', 3000.00),
('A000016', 2200.00),
('A000018', 1700.00),
('A000020', 2800.00);

INSERT INTO BankBranch (Bank_ID, Bank_Address) VALUES
('B000001', '100 First St, Cityville, USA'),
('B000002', '200 Second St, Townsville, USA'),
('B000003', '300 Third St, Villageton, USA'),
('B000004', '400 Fourth St, Hamletown, USA'),
('B000005', '500 Fifth St, Boroughburg, USA'),
('B000006', '600 Sixth St, Townsville, USA'),
('B000007', '700 Seventh St, Cityville, USA'),
('B000008', '800 Eighth St, Villageton, USA'),
('B000009', '900 Ninth St, Hamletown, USA'),
('B000010', '1000 Tenth St, Boroughburg, USA');

INSERT INTO Customer (Customer_ID, Customer_Fname, Customer_Lname, Customer_PhoneNum, Customer_Address, Bank_ID) VALUES
('C000001', 'John', 'Doe', '123456789', '123 Main St, Cityville, USA', 'B000001'),
('C000002', 'Jane', 'Smith', '987654321', '456 Elm St, Townsville, USA', 'B000002'),
('C000003', 'Michael', 'Johnson', '555111222', '789 Oak St, Villageton, USA', 'B000001'),
('C000004', 'Emily', 'Brown', '444333222', '101 Pine St, Hamletown, USA', 'B000003'),
('C000005', 'Chris', 'Davis', '999888777', '202 Maple St, Boroughburg, USA', 'B000002'),
('C000006', 'Lisa', 'Wilson', '777666555', '303 Cedar St, Villageton, USA', 'B000001'),
('C000007', 'Matthew', 'Anderson', '222333444', '404 Spruce St, Cityville, USA', 'B000001'),
('C000008', 'Jennifer', 'Martinez', '666777888', '505 Birch St, Townsville, USA', 'B000002'),
('C000009', 'Daniel', 'Thompson', '333444555', '606 Pine St, Hamletown, USA', 'B000003'),
('C000010', 'Jessica', 'Lee', '111222333', '707 Oak St, Boroughburg, USA', 'B000002');

INSERT INTO Customer_Account (Customer_ID, Account_ID) VALUES
('C000001', 'A000001'),
('C000002', 'A000002'),
('C000003', 'A000003'),
('C000004', 'A000004'),
('C000005', 'A000005'),
('C000006', 'A000006'),
('C000007', 'A000007'),
('C000008', 'A000008'),
('C000008', 'A000009'),
('C000010', 'A000010');

INSERT INTO Job (Job_ID, Job_Title, Job_Description) VALUES
('J000003', 'Loan Officer', 'Evaluates loan applications and assists clients with loan processes'),
('J000004', 'Financial Analyst', 'Analyzes financial data and prepares reports for decision-making'),
('J000005', 'Branch Manager', 'Oversees daily operations of the bank branch'),
('J000006', 'Assistant Manager', 'Assists manager with daily operations'),
('J000007', 'Client Service Associate', 'Communicates with customers'),
('J000008', 'Data Entry', 'Enters financial data'),
('J000009', 'Associate', 'Work in collaboration with others to complete daily tasks and offer support to their team'),
('J000010', 'Financial Planner', 'Assists with any long term financial goals client needs');

INSERT INTO Employee (Employee_ID, Employee_Fname, Employee_Lname, Job_ID, Employee_Salary, Bank_ID) VALUES
('E000011', 'Amanda', 'Taylor', 'J000010', 60000.00, 'B000009'),
('E000012', 'Christopher', 'Moore', 'J000005', 55000.00, 'B000010'),
('E000013', 'Stephanie', 'King', 'J000003', 58000.00, 'B000007'),
('E000014', 'Andrew', 'Jackson', 'J000003', 62000.00, 'B000005'),
('E000015', 'Melissa', 'Scott', 'J000004', 57000.00, 'B000003'),
('E000016', 'Kevin', 'Rivera', 'J000008', 54000.00, 'B000002'),
('E000017', 'Jessica', 'Wright', 'J000009', 59000.00, 'B000001'),
('E000018', 'Brandon', 'Green', 'J000007', 56000.00, 'B000006'),
('E000019', 'Heather', 'Adams', 'J000006', 61000.00, 'B000010'),
('E000020', 'Ryan', 'Campbell', 'J000003', 63000.00, 'B000009');

INSERT INTO Transaction (Transaction_ID, Transaction_Date, Transaction_Amount, Account_ID) VALUES
('T000006', '2023-01-22', 400.00, 'A000001'),
('T000007', '2022-06-05', 150.00, 'A000002'),
('T000008', '2023-03-20', 1200.00, 'A000003'),
('T000009', '2021-12-15', 800.00, 'A000004'),
('T000010', '2024-01-08', 200.00, 'A000005'),
('T000011', '2023-02-01', 600.00, 'A000006'),
('T000012', '2022-07-10', 300.00, 'A000007'),
('T000013', '2023-04-05', 1100.00, 'A000008'),
('T000014', '2022-11-25', 700.00, 'A000009'),
('T000015', '2023-07-15', 500.00, 'A000010');

-- 1. Queries involving inner join on two or more tables:
-- Find the full name of customers along with their account type and balance.
SELECT Customer.Customer_Fname, Customer.Customer_Lname, Account.Account_Type, Account.Account_Balance
FROM Customer
INNER JOIN Customer_Account ON Customer.Customer_ID = Customer_Account.Customer_ID
INNER JOIN Account ON Customer_Account.Account_ID = Account.Account_ID;

-- 2. Queries involving aggregate functions:
-- Calculating the balance across all savings accounts
SELECT SUM(Account.Account_Balance) AS Total_Savings_Balance
FROM Account INNER JOIN Savings_Account ON Account.Account_ID = Savings_Account.Account_ID;

-- 3. Queries involving subqueries:
-- Find customers who have accounts with a balance greater than the average balance across all the other accounts
SELECT Customer.Customer_Fname, Customer.Customer_Lname
FROM Customer
INNER JOIN Customer_Account ON Customer.Customer_ID = Customer_Account.Customer_ID
INNER JOIN Account ON Customer_Account.Account_ID = Account.Account_ID
WHERE Account.Account_Balance > (SELECT AVG(Account_Balance) FROM Account);

-- 4. Queries involving GROUP BY and HAVING clause:
-- Listing total number of accounts for each customer who has more than one account
SELECT Customer.Customer_Fname, Customer.Customer_Lname, COUNT(Customer_Account.Account_ID) AS Total_Accounts
FROM Customer
INNER JOIN Customer_Account ON Customer.Customer_ID = Customer_Account.Customer_ID
GROUP BY Customer.Customer_ID
HAVING COUNT(Customer_Account.Account_ID) > 1;


-- 5. Queries involving left outer join or right outer join of two tables:
-- Find all customers with each of their bank branch addresses, even if some customers are not associated with a bank branch
SELECT Customer.Customer_Fname, Customer.Customer_Lname, BankBranch.Bank_Address
FROM Customer
LEFT JOIN BankBranch ON Customer.Bank_ID = BankBranch.Bank_ID;

