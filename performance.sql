
/*
Extended Description:
This script improves performance by creating indexes on frequently queried columns.
*/

CREATE INDEX idx_customer_id ON Orders(customer_id);
CREATE INDEX idx_order_date ON Orders(order_date);
