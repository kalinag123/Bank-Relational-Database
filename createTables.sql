CREATE DATABASE HBANK;
USE HBANK; 

CREATE TABLE Customer (
    Customer_ID CHAR(11) NOT NULL,
    Customer_Fname VARCHAR(20) NOT NULL,
    Customer_Lname VARCHAR(20) NOT NULL,
    Customer_PhoneNum CHAR(9) NOT NULL,
    Customer_Address VARCHAR(70) NOT NULL,
    Bank_ID CHAR(11) NOT NULL,
    PRIMARY KEY (Customer_ID),
    FOREIGN KEY (Bank_ID) REFERENCES BankBranch(Bank_ID)
);

CREATE TABLE Account (
    Account_ID CHAR(11) NOT NULL,
    Account_RoutingNum CHAR(9) NOT NULL,
    Account_DateOpened DATE NOT NULL,
    Account_Balance DECIMAL(10,2) NOT NULL,
    Account_Type VARCHAR(20) NOT NULL,
    PRIMARY KEY (Account_ID)
);

CREATE TABLE Savings_Account (
    Account_ID CHAR(11) NOT NULL,
    Savings_Interest DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (Account_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);

CREATE TABLE Checking_Account (
    Account_ID CHAR(11) NOT NULL,
    MinimumBalance DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Account_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);

CREATE TABLE Customer_Account (
    Customer_ID CHAR(11) NOT NULL,
    Account_ID CHAR(11) NOT NULL,
    PRIMARY KEY (Customer_ID, Account_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);

CREATE TABLE BankBranch (
    Bank_ID CHAR(11) NOT NULL,
    Bank_Address VARCHAR(100) NOT NULL,
    PRIMARY KEY (Bank_ID)
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

CREATE TABLE Job (
    Job_ID CHAR(11) NOT NULL,
    Job_Title VARCHAR(50) NOT NULL,
    Job_Description VARCHAR(100),
    PRIMARY KEY (Job_ID)
);

CREATE TABLE Transaction (
    Transaction_ID CHAR(11) NOT NULL,
    Transaction_Date DATE NOT NULL,
    Transaction_Amount DECIMAL(10,2) NOT NULL,
    Account_ID CHAR(11) NOT NULL,
    PRIMARY KEY (Transaction_ID),
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);


