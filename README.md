# 🏦 Bank Management System - BMS_DB1

## 📘 Overview

**BMS_DB1** is a structured SQL-based Bank Management System designed to store and manage customer details, account information, bank branches, and reference information. The system consists of four main tables that represent real-world banking components, supporting relational integrity through the use of primary and foreign keys.

---

## 🗂️ Database Structure

### 1. **CUSTOMER_PERSONAL_INFO**
Stores personal details of customers.

| Column Name              | Data Type     | Description                     |
|--------------------------|---------------|---------------------------------|
| CUSTOMER_ID              | VARCHAR(5)    | Unique ID for each customer     |
| CUSTOMER_NAME            | VARCHAR(50)   | Full name of the customer       |
| DATE_OF_BIRTH            | DATE          | Customer's date of birth        |
| GUARDIAN_NAME            | VARCHAR(50)   | Guardian's name                 |
| ADDRESS                  | VARCHAR(50)   | Residential address             |
| CONTACT_NO               | BIGINT        | Mobile number                   |
| MAIL_ID                  | VARCHAR(30)   | Email address                   |
| GENDER                   | CHAR(1)       | Gender (M/F)                    |
| MARITIAL_STATUS          | VARCHAR(10)   | Marital status                  |
| IDENTIFICATION_DOC_TYPE  | VARCHAR(20)   | PAN, Aadhar, Passport, etc.     |
| ID_DOC_NO                | VARCHAR(10)   | Document number                 |

🔑 **Primary Key:** `CUSTOMER_ID`

---

### 2. **CUSTOMER_REFERENCE_INFO**
Stores reference contact details for each customer.

| Column Name           | Data Type     | Description                         |
|-----------------------|---------------|-------------------------------------|
| CUSTOMER_ID           | VARCHAR(5)    | Linked to CUSTOMER_PERSONAL_INFO    |
| REFERENCE_ACC_NAME    | VARCHAR(20)   | Name of reference person            |
| REFERENCE_ACC_NO      | BIGINT        | Reference account number            |
| REFERENCE_ACC_ADDRESS | VARCHAR(50)   | Address of reference person         |
| RELATION              | VARCHAR(25)   | Relationship with the customer      |

🔑 **Primary Key:** `CUSTOMER_ID`  
🔗 **Foreign Key:** `CUSTOMER_ID` references `CUSTOMER_PERSONAL_INFO(CUSTOMER_ID)`

---

### 3. **BANK_INFO**
Stores bank branch details.

| Column Name  | Data Type    | Description            |
|--------------|--------------|------------------------|
| IFSC_CODE    | VARCHAR(15)  | Unique branch code     |
| BANK_NAME    | VARCHAR(25)  | Name of the bank       |
| BRANCH_NAME  | VARCHAR(25)  | Name of the branch     |

🔑 **Primary Key:** `IFSC_CODE`

---

### 4. **ACCOUNT_INFO**
Stores account-specific information for customers.

| Column Name       | Data Type     | Description                          |
|-------------------|---------------|--------------------------------------|
| ACCOUNT_NO        | BIGINT        | Unique account number                |
| CUSTOMER_ID       | VARCHAR(5)    | Links to CUSTOMER_PERSONAL_INFO      |
| ACCOUNT_TYPE      | VARCHAR(10)   | Savings/Current                      |
| REGISTRATION_DATE | DATE          | Date account was registered          |
| ACTIVATION_DATE   | DATE          | Date account was activated           |
| IFSC_CODE         | VARCHAR(10)   | Links to BANK_INFO                   |
| INTEREST          | DECIMAL(7,2)  | Interest rate applicable             |
| INITIAL_DEPOSIT   | BIGINT        | Initial deposit amount               |

🔑 **Primary Key:** `ACCOUNT_NO`  
🔗 **Foreign Keys:**  
- `CUSTOMER_ID` references `CUSTOMER_PERSONAL_INFO(CUSTOMER_ID)`  
- `IFSC_CODE` references `BANK_INFO(IFSC_CODE)`

---

## 📥 Sample Data Inserted

- 5 entries in `CUSTOMER_PERSONAL_INFO`
- 5 entries in `CUSTOMER_REFERENCE_INFO`
- 5 entries in `BANK_INFO`
- 5 entries in `ACCOUNT_INFO`

---

## ✅ How to Use

1. Execute the script in your SQL environment (MySQL / MariaDB).
2. Start with creating the database and tables.
3. Insert the provided sample data.
4. Use `SELECT` queries to explore data or create your own banking operations.

---

## 🔒 Data Integrity

- Referential integrity is maintained using **foreign key constraints**.
- **Primary keys** ensure uniqueness in each table.

---

## 📌 Notes

- This schema is ideal for academic projects, basic banking systems, or SQL practice.
- Can be extended further with **transaction history**, **loan management**, **user authentication**, etc.
