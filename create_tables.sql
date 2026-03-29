/*
Extended Description:
This script creates the OrdersDB database and defines staging and production tables.
The staging table stores raw imported data, while the production table stores cleaned and validated data.
*/

CREATE DATABASE OrdersDB;
GO

USE OrdersDB;
GO

-- Staging table (raw data)
CREATE TABLE Staging_Orders (
    id INT,
    order_date VARCHAR(50),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    sales VARCHAR(50)
);

-- Production table (clean data)
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    order_date DATE,
    ship_mode VARCHAR(20),
    customer_id VARCHAR(20),
    sales DECIMAL(10,2)
);
