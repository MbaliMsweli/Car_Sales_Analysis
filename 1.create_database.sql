
---CREATE DATABASE: Car_Sales_Analysis

IF NOT EXISTS (
SELECT name FROM sys.databases 
WHERE name = 'Car_Sales_Analysis')
BEGIN
    CREATE DATABASE Car_Sales_Analysis;
END