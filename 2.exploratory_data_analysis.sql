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

---Checking which seller that has the most selling date
SELECT TOP 5 seller, COUNT(saledate) AS Total_SalesDate
FROM [dbo].[car_sales_data ]
GROUP BY seller
ORDER BY  COUNT(saledate) DESC;

---Checking which car make that has the most selling date
SELECT TOP 5 make, COUNT(saledate) AS Total_SalesDate_Per_Make
FROM [dbo].[car_sales_data ]
GROUP BY make
ORDER BY  COUNT(saledate) DESC;

---Checking which car model that has the most selling date
SELECT TOP 5 model, COUNT(saledate) AS Total_SalesDate_Per_Model
FROM [dbo].[car_sales_data ]
GROUP BY model
ORDER BY  COUNT(saledate) DESC;

---Checking which car body type make that has the most selling date
SELECT TOP 5 body, COUNT(saledate) AS Total_SalesDate_Per_Body
FROM [dbo].[car_sales_data ]
GROUP BY body
ORDER BY  COUNT(saledate) DESC;

---Checking the minimum odometer
SELECT MIN (odometer)
FROM [dbo].[car_sales_data ];

---Checking the maximum odometer
SELECT MAX (odometer)
FROM [dbo].[car_sales_data ]

--Counting the number of each transimission 
SELECT DISTINCT (transmission), COUNT(*) AS Total_Transmission
FROM [dbo].[car_sales_data ]
GROUP BY transmission;

SELECT MIN (condition)
FROM [dbo].[car_sales_data ];


SELECT MAX (condition)
FROM [dbo].[car_sales_data ];

ALTER TABLE [dbo].[car_sales_data ]
ADD condition_bucket VARCHAR (500);

UPDATE [dbo].[car_sales_data ]
SET condition_bucket =
	 CASE 
             WHEN condition between '1' AND '2' THEN 'Great Condition: 1 to 2'
             WHEN condition between '3' AND '4' THEN 'Normal Condition: 3 to 4'
             ELSE 'Poor Condition: 5'
         END ;
