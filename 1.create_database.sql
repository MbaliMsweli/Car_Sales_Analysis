
---CREATE DATABASE: Car_Sales_Analysis

IF NOT EXISTS (
SELECT name FROM sys.databases 
WHERE name = 'Bright Motors Car Sales')
BEGIN
    CREATE DATABASE Bright Motors Car Sales;
END