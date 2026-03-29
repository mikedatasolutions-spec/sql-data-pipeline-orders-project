CREATE DATABASE OrdersDB;
GO
    
USE OrdersDB;
GO


CREATE TABLE Staging_Orders (
    id INT,
    order_date DATE,
    ship_mode VARCHAR(20),
    customer_id VARCHAR(20),
    sales DECIMAL(10,2)
);
