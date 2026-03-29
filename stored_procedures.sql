
/*
Extended Description:
This stored procedure automates the ETL process:
1. Load data into staging
2. Transform and load into production
*/

CREATE PROCEDURE sp_LoadOrdersETL
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Clear staging
    TRUNCATE TABLE Staging_Orders;

    -- Step 2: Load data
    BULK INSERT Staging_Orders
    FROM 'C:\tmp\orders.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n'
    );

    -- Step 3: Transform & load
    INSERT INTO Orders (id, order_date, ship_mode, customer_id, sales)
    SELECT 
        id,
        TRY_CAST(order_date AS DATE),
        UPPER(ship_mode),
        customer_id,
        TRY_CAST(sales AS DECIMAL(10,2))
    FROM Staging_Orders
    WHERE TRY_CAST(sales AS DECIMAL(10,2)) IS NOT NULL;
END;
GO
