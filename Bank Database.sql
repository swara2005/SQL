CREATE DATABASE BMS_DB1;
USE BMS_DB1;

-- CUSTOMER PERSONAL INFORMATION 

CREATE TABLE CUSTOMER_PERSONAL_INFO
(
   CUSTOMER_ID VARCHAR(5) NOT NULL ,
   CUSTOMER_NAME VARCHAR(50) NOT NULL ,
   DATE_OF_BIRTH DATE,
   GUARDIAN_NAME VARCHAR(50) NOT NULL ,
   ADDRESS VARCHAR(50) NOT NULL ,
   CONTACT_NO BIGINT,
   MAIL_ID VARCHAR(30) NOT NULL ,
   GENDER CHAR(1) NOT NULL,
   MARITIAL_STATUS VARCHAR(10) NOT NULL ,
   IDENTIFICATION_DOC_TYPE VARCHAR(20) NOT NULL ,
   ID_DOC_NO VARCHAR(10) NOT NULL ,
   CONSTRAINT CUST_PERSO_INFO_PK PRIMARY KEY(CUSTOMER_ID)
);

-- CUSTOMER_REFERENCE_INFO 

CREATE TABLE CUSTOMER_REFERENCE_INFO 
(
   CUSTOMER_ID VARCHAR(5) NOT NULL,
   REFERENCE_ACC_NAME VARCHAR(20) NOT NULL,
   REFERENCE_ACC_NO BIGINT,
   REFERENCE_ACC_ADDRESS VARCHAR(50) NOT NULL,
   RELATION VARCHAR(25),
   CONSTRAINT CUST_REF_INFO_PK PRIMARY KEY(CUSTOMER_ID),
   CONSTRAINT CUST_REF_INFO_FK FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER_PERSONAL_INFO (CUSTOMER_ID)
);

SHOW TABLES;

-- BANK INFO 

CREATE TABLE BANK_INFO
(
   IFSC_CODE VARCHAR(15) NOT NULL,
   BANK_NAME VARCHAR(25) NOT NULL,
   BRANCH_NAME VARCHAR(25) NOT NULL ,
   CONSTRAINT BANK_INFO_PK PRIMARY KEY(IFSC_CODE)
);

SHOW TABLES;

-- ACCOUNT INFO 

CREATE TABLE ACCOUNT_INFO
(
  ACCOUNT_NO BIGINT,
  CUSTOMER_ID VARCHAR(5) NOT NULL,
  ACCOUNT_TYPE VARCHAR(10) NOT NULL,
  REGISTRATION_DATE DATE,
  ACTIVATION_DATE DATE,
  IFSC_CODE VARCHAR(10) NOT NULL,
  INTEREST DECIMAL(7,2) NOT NULL,
  INITIAL_DEPOSIT BIGINT,
  CONSTRAINT ACC_INFO_PK  PRIMARY KEY(ACCOUNT_NO),
  CONSTRAINT ACC_CUST_FK FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER_PERSONAL_INFO(CUSTOMER_ID),
  CONSTRAINT ACC_BANK_FK FOREIGN KEY(IFSC_CODE) REFERENCES BANK_INFO(IFSC_CODE)
);

SHOW TABLES;

-- CUSTOMER PERSONAL INFORMATION 

INSERT INTO CUSTOMER_PERSONAL_INFO (CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,GUARDIAN_NAME,ADDRESS,CONTACT_NO,MAIL_ID,GENDER,MARITIAL_STATUS,IDENTIFICATION_DOC_TYPE,ID_DOC_NO)
VALUES 
('C001', 'Amit Sharma', '1985-04-23', 'Rajesh Sharma', '123 Park Lane, Delhi', 9876543210, 'amit.sharma@example.com', 'M', 'Married', 'PAN', 'ABC1234567'),
('C002', 'Sneha Gupta', '1992-11-15', 'Suresh Gupta', '456 MG Road, Mumbai', 9123456780, 'sneha.gupta@example.com', 'F', 'Single', 'Aadhar', '123456789'),
('C003', 'Rahul Verma', '1978-06-30', 'Vinod Verma', '789 Andheri West, Mumbai', 9987654321, 'rahul.verma@example.com', 'M', 'Married', 'Passport', 'J123456'),
('C004', 'Priya Singh', '1990-01-20', 'Anil Singh', '321 South Avenue, Kolkata', 9876501234, 'priya.singh@example.com', 'F', 'Single', 'Voter ID', 'WB12345'),
('C005', 'Karan Patel', '1987-08-11', 'Mahesh Patel', '567 Green Park, Bangalore', 9012345678, 'karan.patel@example.com', 'M', 'Married', 'Aadhar', '987654321');
  
  -- CUSTOMER_REFERENCE_INFO 
  
INSERT INTO CUSTOMER_REFERENCE_INFO (CUSTOMER_ID, REFERENCE_ACC_NAME, REFERENCE_ACC_NO, REFERENCE_ACC_ADDRESS, RELATION)
VALUES 
('C001', 'Rohit Sharma', 1234567890123456, '456 Green Park, Delhi', 'Friend'),
('C002', 'Priya Mehta', 2345678901234567, '789 Red Road, Mumbai', 'Colleague'),
('C003', 'Amit Verma', 3456789012345678, '321 Blue Avenue, Kolkata', 'Relative'),
('C004', 'Sunita Patel', 4567890123456789, '567 Yellow Street, Bangalore', 'Neighbor'),
('C005', 'Nikhil Jain', 5678901234567890, '654 Orange Lane, Pune', 'Cousin');

 -- BANK INFO 
 
INSERT INTO BANK_INFO (IFSC_CODE, BANK_NAME, BRANCH_NAME) 
VALUES 
('ABC1234567', 'State Bank of India', 'Connaught Place, Delhi'),
('XYZ9876543', 'HDFC Bank', 'MG Road, Mumbai'),
('LMN4567890', 'ICICI Bank', 'Brigade Road, Bangalore'),
('PQR1237894', 'Punjab National Bank', 'Park Street, Kolkata'),
('STU6543210', 'Axis Bank', 'Baner, Pune');

-- ACCOUNT INFO 

INSERT INTO ACCOUNT_INFO (ACCOUNT_NO, CUSTOMER_ID, ACCOUNT_TYPE, REGISTRATION_DATE, ACTIVATION_DATE, IFSC_CODE, INTEREST, INITIAL_DEPOSIT)
VALUES 
(1000000000000001, 'C001', 'Savings', '2024-08-01', '2024-08-02', 'ABC1234567', 3.5, 50000),
(1000000000000002, 'C002', 'Current', '2024-08-05', '2024-08-06', 'XYZ9876543', 4.0, 100000),
(1000000000000003, 'C003', 'Savings', '2024-08-10', '2024-08-11', 'LMN4567890', 3.8, 75000),
(1000000000000004, 'C004', 'Savings', '2024-08-15', '2024-08-16', 'PQR1237894', 3.5, 60000),
(1000000000000005, 'C005', 'Current', '2024-08-18', '2024-08-19', 'STU6543210', 4.2, 120000);




 

   
  




 
 

  
   