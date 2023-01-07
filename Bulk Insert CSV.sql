-- Bulk insert a CSV file into a table
BULK INSERT Customer
FROM 'C:\\Users\\ND\\Documents\\Customers.csv'
WITH (FORMAT = 'CSV');