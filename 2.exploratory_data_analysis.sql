---Exploratory Data Analysis 

USE [Bright_Motors_Car_Sales];

SELECT *
FROM[Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--checking the nulls
SELECT *
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
WHERE make IS NULL;

--converting rows with nulls into Unknown
UPDATE [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
SET make = COALESCE(make, 'Unknown'),
    model = COALESCE(model, 'Unknown'),
    trim = COALESCE(trim, 'Unknown'),
    body = COALESCE(body, 'Unknown');


--Checking how many different body type in this column
SELECT DISTINCT(body)
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--Checking how many different makes in this column
SELECT DISTINCT(make)
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--Checking how many different colors of cars in the dataset
SELECT DISTINCT(color)
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--Checking how many different seller in the dataset
SELECT DISTINCT(seller)
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--Checking how many rows in this dataset
SELECT COUNT(*) AS Number_of_Rows
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--Checking the highest selling price of a car
SELECT MAX(sellingprice) AS Highest_Price
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--Checking the lowest selling price of a car
SELECT MIN(sellingprice) AS Lowest_Price
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--Increasing the Data Type Size
ALTER TABLE [Bright_Motors_Car_Sales].[dbo].[car_sales_data] ALTER COLUMN sellingprice BIGINT;

--Checking the average selling price of a car
SELECT AVG (sellingprice) AS Average_Price
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

----Checking all cars with a selling price of 1
SELECT *
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];
WHERE sellingprice = 1

--Checking the minimun year car model
SELECT MIN(year) AS Min_Year_Model
FROM[Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--Checking the maximum year car model
SELECT MAX(year) AS Max_Year_Model
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--Checking the maximum sales date
SELECT MAX(saledate) AS Max_SaleDate
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--Checking the minimum sales date
SELECT MIN(saledate) AS Min_SaleDate
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

---Checking which seller that has the most selling date
SELECT TOP 5 seller, COUNT(saledate) AS Total_SalesDate
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
GROUP BY seller
ORDER BY  COUNT(saledate) DESC;

---Checking which car make that has the most selling date
SELECT TOP 5 make, COUNT(saledate) AS Total_SalesDate_Per_Make
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
GROUP BY make
ORDER BY  COUNT(saledate) DESC;

---Checking which car model that has the most selling date
SELECT TOP 5 model, COUNT(saledate) AS Total_SalesDate_Per_Model
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
GROUP BY model
ORDER BY  COUNT(saledate) DESC;

---Checking which car body type make that has the most selling date
SELECT TOP 5 body, COUNT(saledate) AS Total_SalesDate_Per_Body
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
GROUP BY body
ORDER BY  COUNT(saledate) DESC;

---Checking the minimum odometer
SELECT MIN (odometer)
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

---Checking the maximum odometer
SELECT MAX (odometer)
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--Counting the number of each transimission 
SELECT DISTINCT (transmission), COUNT(*) AS Total_Transmission
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
GROUP BY transmission;

--- checking the minimum condition
SELECT MIN (condition)
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--- checking the maximum condition
SELECT MAX (condition)
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--checking the different state in the dataset
SELECT DISTINCT (state)
FROM [dbo].[car_sales_data ];

---checking the number of salesdate per state
SELECT TOP 5 state, COUNT(saledate) AS Total_SalesDate_Per_State
FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
GROUP BY state
ORDER BY  COUNT(saledate) DESC;

---altering the table to add the new column called condition_bucket
ALTER TABLE[Bright_Motors_Car_Sales].[dbo].[car_sales_data]
ADD condition_bucket VARCHAR (500);

---updating the new column (condition_bucket) to add data into it
UPDATE [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
SET condition_bucket =
	 CASE 
             WHEN condition between '1' AND '2' THEN 'Great Condition: 1 to 2'
             WHEN condition between '3' AND '4' THEN 'Normal Condition: 3 to 4'
             ELSE 'Poor Condition: 5'
         END ;

---altering the table to add the new column called year_model_bucket
ALTER TABLE [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
ADD year_model_bucket VARCHAR(500);

---updating the new column (year_model_bucket) to add data into it
UPDATE [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
SET year_model_bucket =
	 CASE 
             WHEN condition between '1982' AND '1990' THEN 'Very Old Models: 1982 to 1990'
             WHEN condition between '1991' AND '2000' THEN 'Old Models: 1991 to 2000'
             WHEN condition between '2001' AND '2010' THEN 'Mid Age Models: 2001 to 2010'
             ELSE 'Newer Models: 2011 to 2015'
         END ;

       
---altering the table to add the new column called odometer_model_bucket
ALTER TABLE [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
ADD odometer_bucket VARCHAR(500);

---updating the new column (odometer_bucket) to add data into it
UPDATE [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
SET odometer_bucket =
	 CASE 
             WHEN odometer between '1' AND '5000' THEN 'Low Mileage: 1 to 5000'
             WHEN odometer between '50001' AND '150000' THEN 'Medium Mileage: 50001 to 150000'
             WHEN odometer between '150001' AND '300000' THEN 'High Mileage: 150001 to 300000'
             WHEN odometer between '300001' AND '600000' THEN 'Very High Mileage: 300001 to 600000'
             ELSE 'Extreme Mileage: 600001 to 999999'
         END ;

---altering the table to add the new column called saleprice_model_bucket
ALTER TABLE [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
ADD saleprice_bucket VARCHAR(500);

---updating the new column (saleprice_bucket) to add data into it
UPDATE [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
SET saleprice_bucket =
	 CASE 
             WHEN sellingprice between '1' AND '20000' THEN 'Low Price: 1 to 20000'
             WHEN sellingprice between '20001' AND '60000' THEN 'Affordable: 20001 to 60000'
             WHEN sellingprice between '60001' AND '120000' THEN 'Mid Range: 60001 to 120000'
             WHEN sellingprice between '120001' AND '180000' THEN 'High Range: 120001 to 180000'
             ELSE 'Premium: 180001 to 230000'
         END ;


 --This will extract the day of the month from the sale date
         SELECT saledate,
         DAY (saledate) AS day_of_month
         FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];
        

--This extracts the Month Name from sale date  
         SELECT saledate,
         DATENAME (MONTH, saledate) AS month_name
         FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];
      

--This extracts a Year from sale date  
         SELECT saledate,
         DATENAME (YEAR, saledate) AS purchase_year
         FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

--This will extract the day of the week from Purchased Date 
       SELECT saledate,
       DATENAME(WEEKDAY, saledate) AS day_of_week
       FROM [Bright_Motors_Car_Sales].[dbo].[car_sales_data];

---altering the table to add the new columns
ALTER TABLE [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
ADD day_of_month INT,
    month_name VARCHAR(500),
    purchase_year INT ,
    day_of_week VARCHAR(500);

---updating the new columns to add data into it
UPDATE [Bright_Motors_Car_Sales].[dbo].[car_sales_data]
SET day_of_month =  DAY (saledate),
    month_name = DATENAME (MONTH, saledate),
    purchase_year = DATENAME (YEAR, saledate),
    day_of_week =  DATENAME(WEEKDAY, saledate);


  