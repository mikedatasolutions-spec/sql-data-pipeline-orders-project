
/*
Extended Description:
This script transforms raw data from the staging table into clean, structured data
and loads it into the production Orders table.
*/

INSERT INTO Orders (id, order_date, ship_mode, customer_id, sales)
SELECT 
    id,
    TRY_CAST(order_date AS DATE),
    UPPER(ship_mode),
    customer_id,
    TRY_CAST(sales AS DECIMAL(10,2))
FROM Staging_Orders
WHERE TRY_CAST(sales AS DECIMAL(10,2)) IS NOT NULL;
