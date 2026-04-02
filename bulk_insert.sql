-- ============================================
-- BULK INSERT: Orders Data Load (Staging → Final)
-- ============================================

-- Step 1: Create Staging Table
IF OBJECT_ID('dbo.Orders_Staging', 'U') IS NOT NULL
    DROP TABLE dbo.Orders_Staging;

CREATE TABLE dbo.Orders_Staging (
    ID INT,
    order_date VARCHAR(50),
    ship_mode VARCHAR(50),
    Customer_id INT,
    Sales DECIMAL(10,2)
);

-- Step 2: Bulk Insert into Staging
BULK INSERT dbo.Orders_Staging
FROM 'C:\Data\orders.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    TABLOCK
);

-- Step 3: Create Final Table
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;

CREATE TABLE dbo.Orders (
    ID INT,
    order_date DATE,
    ship_mode VARCHAR(50),
    Customer_id INT,
    Sales DECIMAL(10,2)
);

-- Step 4: Transform and Load Data
INSERT INTO dbo.Orders (ID, order_date, ship_mode, Customer_id, Sales)
SELECT 
    ID,
    TRY_CONVERT(DATE, order_date, 101) AS order_date,
    ship_mode,
    Customer_id,
    Sales
FROM dbo.Orders_Staging;

-- Step 5: Validate Load
SELECT COUNT(*) AS Total_Records FROM dbo.Orders;
