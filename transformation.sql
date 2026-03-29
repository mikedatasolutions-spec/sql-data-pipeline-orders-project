
-- Extended Description:
-- This script performs data cleaning and transformation directly on the Orders table.
-- It ensures proper data types, removes invalid records, and prepares the dataset for reporting and analysis.

-- Remove rows with NULL sales
DELETE FROM Orders
WHERE sales IS NULL;

-- Optional: standardize ship_mode values (example)
UPDATE Orders
SET ship_mode = UPPER(ship_mode);

-- Verify cleaned data
SELECT * FROM Orders;
