---Exploratory Data Analysis 

USE [Car_Sales_Analysis];

SELECT *
FROM [dbo].[car_sales_data ];

--Checking how many different body type in this column
SELECT DISTINCT(body)
FROM [dbo].[car_sales_data ];

--Checking how many different makes in this column
SELECT DISTINCT(make)
FROM [dbo].[car_sales_data ];

--Checking how many different colors of cars in the dataset
SELECT DISTINCT(color)
FROM [dbo].[car_sales_data ];

--Checking how many different seller in the dataset
SELECT DISTINCT(seller)
FROM [dbo].[car_sales_data ];

--Checking how many rows in this dataset
SELECT COUNT(*) AS Number_of_Rows
FROM [dbo].[car_sales_data ];

--Checking the highest selling price of a car
SELECT MAX(sellingprice) AS Highest_Price
FROM [dbo].[car_sales_data ];

--Checking the lowest selling price of a car
SELECT MIN(sellingprice) AS Lowest_Price
FROM [dbo].[car_sales_data ];

--Increasing the Data Type Size
ALTER TABLE [dbo].[car_sales_data ] ALTER COLUMN sellingprice BIGINT;

--Checking the average selling price of a car
SELECT AVG (sellingprice) AS Average_Price
FROM [dbo].[car_sales_data ];

----Checking all cars with a selling price of 1
SELECT *
FROM [dbo].[car_sales_data ]
WHERE sellingprice = 1

--Checking the minimun year car model
SELECT MIN(year) AS Min_Year_Model
FROM [dbo].[car_sales_data ];

--Checking the maximum year car model
SELECT MAX(year) AS Max_Year_Model
FROM [dbo].[car_sales_data ];

--Checking the maximum sales date
SELECT MAX(saledate) AS Max_SaleDate
FROM [dbo].[car_sales_data ];

--Checking the minimum sales date
SELECT MIN(saledate) AS Min_SaleDate
FROM [dbo].[car_sales_data ];