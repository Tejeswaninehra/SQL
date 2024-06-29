CREATE DATABASE brand;

create table ITEMS_TABLE(
id INT IDENTITY(1,1) PRIMARY KEY,
item_description TEXT,
vendor_nos INT,
vendor_name VARCHAR(50),
bottle_size DECIMAL(10,2),
bottle_price DECIMAL(10,2),
);

SELECT * FROM ITEMS_TABLE 

USE brand;

-- Inserting data into "ITEMS_TABLE"
INSERT INTO ITEMS_TABLE (id, item_description, vendor_nos, vendor_name, bottle_size, bottle_price)
VALUES
(1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77),
(2, 'D''aristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, 14.12),
(3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, 6.50),
(4, 'Oak Cross Whisky', 305, 'Mhw Ltd', 750, 25.33),
(5, 'Uv Red(cherry) Vodka', 380, 'Phillips Beverage Company', 200, 1.97),
(6, 'Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, 6.37),
(7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, 5.06),
(8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61);



-- Enable identity insert
SET IDENTITY_INSERT ITEMS_TABLE ON;

-- Insert data with explicit id values
INSERT INTO ITEMS_TABLE (id, item_description, vendor_nos, vendor_name, bottle_size, bottle_price)
VALUES
(1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77);
-- Add other rows as needed

-- Disable identity insert
SET IDENTITY_INSERT ITEMS_TABLE OFF;
-- Enable identity insert
SET IDENTITY_INSERT ITEMS_TABLE ON;

-- Insert data without specifying the id column
INSERT INTO ITEMS_TABLE (item_description, vendor_nos, vendor_name, bottle_size, bottle_price)
VALUES
('D''aristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, 14.12),
('Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, 6.50),
('Oak Cross Whisky', 305, 'Mhw Ltd', 750, 25.33),
('Uv Red(cherry) Vodka', 380, 'Phillips Beverage Company', 200, 1.97),
('Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, 6.37),
('Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, 5.06),
('Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61);

-- Disable identity insert
SET IDENTITY_INSERT ITEMS_TABLE OFF;
 Delete ITEMS_TABLE;

 SELECT * FROM ITEMS_TABLE 

 SELECT
    item_description
FROM ITEMS_TABLE
WHERE bottle_size = 750;

 SELECT * FROM ITEMS_TABLE 

 SELECT vendor_name
 FROM ITEMS_TABLE
 WHERE vendor_nos IN(305, 380, 391);

 SELECT 
    SUM(bottle_price) AS total_bottle_price
	FROM ITEMS_TABLE;

	ALTER TABLE ITEMS_TABLE
	ADD PRIMARY KEY (id);

	SELECT
   id
FROM ITEMS_TABLE
WHERE bottle_price = 5.06;


 




 





 
 CREATE DATABASE product;

 USE product;
  
  CREATE TABLE Sales (
    Product_Id INT PRIMARY KEY,
    Country VARCHAR(255),
    Product VARCHAR(255),
    Units_Sold DECIMAL(10, 2),
    Manufacturing_Price DECIMAL(10, 2),
    Sale_Price DECIMAL(10, 2),
    Gross_Sales DECIMAL(10, 2),
    Sales DECIMAL(10, 2),
    COGS DECIMAL(10, 2),
    Profit DECIMAL(10, 2),
    Date DATE,
    Month_Number INT,
    Month_Name VARCHAR(255),
    Year INT
);

SELECT * FROM Sales

INSERT INTO Sales (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, Date, Month_Number, Month_Name, Year)
VALUES
(1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014);
-- Add other rows as needed
INSERT INTO Sales (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, Date, Month_Number, Month_Name, Year)
VALUES
(2, 'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2015-01-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2016-06-01', 6, 'June', 2016),
(4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2017-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2018-06-01', 6, 'June', 2018),
(6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2019-12-01', 12, 'December', 2019),
(7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2020-03-01', 3, 'March', 2020);
INSERT INTO Sales (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, Date, Month_Number, Month_Name, Year)
VALUES
(8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2014-06-01', 6, 'June', 2021);

DELETE FROM Sales
WHERE Product_Id = 2;

SELECT * FROM Sales

DELETE FROM Sales
WHERE Product_Id = 4;

SELECT * FROM Sales

DELETE FROM Sales
WHERE Product_Id = 5;

SELECT * FROM Sales

DROP TABLE Sales 
 
 CREATE TABLE Sales (
    Product_Id INT PRIMARY KEY,
    Country VARCHAR(255),
    Product VARCHAR(255),
    Units_Sold DECIMAL(10, 2),
    Manufacturing_Price DECIMAL(10, 2),
    Sale_Price DECIMAL(10, 2),
    Gross_Sales DECIMAL(10, 2),
    Sales DECIMAL(10, 2),
    COGS DECIMAL(10, 2),
    Profit DECIMAL(10, 2),
    Date DATE,
    Month_Number INT,
    Month_Name VARCHAR(255),
    Year INT
);

SELECT * FROM Sales

INSERT INTO Sales (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, Date, Month_Number, Month_Name, Year)
VALUES
(1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014);
INSERT INTO Sales (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, Date, Month_Number, Month_Name, Year)
VALUES
(2, 'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2015-01-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2016-06-01', 6, 'June', 2016),
(4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2017-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2018-06-01', 6, 'June', 2018),
(6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2019-12-01', 12, 'December', 2019),
(7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2020-03-01', 3, 'March', 2020);
INSERT INTO Sales (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, Date, Month_Number, Month_Name, Year)
VALUES
(8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2014-06-01', 6, 'June', 2021);

SELECT
    SUM(Sale_Price) AS Total_Sale_Price,
    SUM(Gross_Sales) AS Total_Gross_Sales
FROM Sales;

SELECT
    Year,
    SUM(Sales) AS Total_Sales
FROM Sales
GROUP BY Year
ORDER BY Total_Sales DESC

SELECT product
FROM Sales
WHERE Sales = 37050.00;


SELECT country
FROM Sales
WHERE Profit BETWEEN 4605.00 AND 22662.00;

SELECT * FROM Sales

SELECT
    Product_id
FROM sales
WHERE sales = 24700.00;
