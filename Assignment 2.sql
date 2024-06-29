Create Database Order_Stores_Data;

Create table Order_table(
OrderDate DATE,
    Region VARCHAR(50),
    Rep VARCHAR(50),
    Order_Item VARCHAR(50),
    Units INT,
    Unit_Cost DECIMAL(10, 2),
    Total_Price DECIMAL(10, 2),
    Order_Id INT PRIMARY KEY
);

INSERT INTO Order_table (OrderDate, Region, Rep, Order_Item, Units, Unit_Cost, Total_Price, Order_Id)
VALUES
    ('2021-01-06', 'East', 'Aruna', 'Pencil', 95, 1.99, 189.05, 1),
    ('2021-01-23', 'Central', 'Kivell', 'Eraser', 50, 19.99, 999.50, 2),
    ('2021-02-09', 'Central', 'Ganesh', NULL, 36, 4.99, 179.64, 3),  -- Assuming Order_Item is NULL
    ('2021-02-26', 'Central', 'Payal', NULL, 27, 19.99, 539.73, 4),  -- Assuming Order_Item is NULL
    ('2021-03-15', 'West', 'Sorvino', NULL, 56, 2.99, 167.44, 5),  -- Assuming Order_Item is NULL
    ('2021-04-01', 'East', 'Hitesh', 'Pencil', 60, 4.99, 299.40, 6),
    ('2021-04-18', 'Central', 'Akshita', NULL, 75, 1.99, 149.25, 7),  -- Assuming Order_Item is NULL
    ('2021-05-05', 'Central', 'Ruchika', 'Books', 90, 4.99, 449.10, 8),
    ('2021-05-22', 'West', 'Surbhi', NULL, 32, 1.99, 63.68, 9),  -- Assuming Order_Item is NULL
    ('2021-06-08', 'East', 'Jones', 'Suitcase', 60, 8.99, 539.40, 10);

Select * from Order_table

-- Ensure the Order_Id column does not allow NULLs
ALTER TABLE Orders
ALTER COLUMN Order_Id INT NOT NULL;





Create table Stores_table(
Store_Id INT PRIMARY KEY,
    StoreType VARCHAR(1),
    Assortment INT,
    CompetitionDistance INT,
    Month INT,
    Year INT,
    PromoInterval VARCHAR(3)
);

INSERT INTO Stores_table(Store_Id, StoreType, Assortment, CompetitionDistance, Month, Year, PromoInterval)
VALUES
    (1, 'c', 34, 1270, 9, 2008, 'Jan'),
    (2, 'a', 50, 570, 11, 2007, 'Feb'),
    (3, 'a', 48, 14130, 12, 2006, 'Mar'),
    (4, 'c', 10, 620, 9, 2009, NULL),
    (5, 'a', 20, 29910, 4, 2015, 'May'),
    (6, 'a', 14, 310, 12, 2013, 'Jun'),
    (7, 'a', 32, 24000, 4, 2013, NULL),
    (8, 'a', 42, 7520, 10, 2014, 'Aug'),
    (9, 'a', 24, 2030, 8, 2000, NULL),
    (10, 'a', 38, 3160, 9, 2009, 'Oct');
 
 Select * from Stores_table

 -- Add the Store_Names column to the Stores table
ALTER TABLE Stores_table
ADD Store_Names VARCHAR(100); -- Adjust the size as needed

-- Update the records with the Store_Names values
UPDATE Stores_table
SET Store_Names = 
    CASE 
        WHEN Store_Id = 1 THEN 'Store1'
        WHEN Store_Id = 2 THEN 'Store2'
        WHEN Store_Id = 3 THEN 'Store3'
        WHEN Store_Id = 4 THEN 'Store4'
        WHEN Store_Id = 5 THEN 'Store5'
        WHEN Store_Id = 6 THEN 'Store6'
        WHEN Store_Id = 7 THEN 'Store7'
        WHEN Store_Id = 8 THEN 'Store8'
        WHEN Store_Id = 9 THEN 'Store9'
        WHEN Store_Id = 10 THEN 'Store10'
        -- Add more cases if needed
        ELSE NULL -- Handle cases where Store_Id doesn't match any condition
    END;

 Select * from Stores_table

-- Assuming your table is named 'Stores_table'
UPDATE Stores_table
SET PromoInterval = 'Jan'
WHERE Store_Id = 4;

 -- Assuming your table is named 'Stores_table'
UPDATE Stores_table
SET PromoInterval = 'Jun'
WHERE Store_Id = 7; 

 -- Assuming your table is named 'Stores_table'
UPDATE Stores_table
SET PromoInterval = 'Aug'
WHERE Store_Id = 9; 

Select * from Stores_table

  EXEC sp_rename 'Stores_table .Assortment', 'Store_Nos', 'COLUMN';



  -- Assuming there's a primary key named Store_Id in the Stores table
ALTER TABLE Order_table
ADD Store_Id INT; 

-- Update the records with the Store_Id values (replace with actual values)
UPDATE Order_table
SET Store_Id = 
    CASE 
        WHEN Order_Id = 1 THEN 1
        WHEN Order_Id = 2 THEN 2
        WHEN Order_Id = 3 THEN 3
        -- Add more cases if needed
        ELSE NULL
    END;

 -- Assuming there's a primary key named Store_Id in the Stores table
ALTER TABLE Orders
ADD Store_Id INT; -- Add the Store_Id column to the Orders table

-- Update the records with the Store_Id values (replace with actual values)
UPDATE Orders
SET Store_Id = 
    CASE 
        WHEN Order_Id = 1 THEN 1
        WHEN Order_Id = 2 THEN 2
        WHEN Order_Id = 3 THEN 3
        -- Add more cases if needed
        ELSE NULL
    END;

 -- Assuming Order_Id is used to identify the records and 'MissingRecords' is the table with missing data
UPDATE Order_table
SET Order_Item = 'New_Item' -- Replace 'New_Item' with the actual missing item
 
  Select * from Order_table

 -- Rename 'Order_Item' to 'Item_name'
EXEC sp_rename 'Order_table .Order_Item', 'Item_name', 'COLUMN';

-- Rename 'Rep' to 'Customers_name'
EXEC sp_rename 'Order_table .Rep', 'Customers_name', 'COLUMN';

 Select * from Order_table

 SELECT *
FROM Order_table
ORDER BY [Unit_Cost] DESC, [Total_price] ASC;

SELECT
    CASE
        WHEN Customers_name IS NOT NULL THEN Customers_name
        ELSE 'Unknown'  -- Replace 'Unknown' with a default value for null names if needed
    END AS Cus_Name,
    Region,
    COUNT(*) AS Cus_Name_Count
FROM Order_table
GROUP BY
    CASE
        WHEN Customers_name IS NOT NULL THEN Customers_name
        ELSE 'Unknown'
    END,
    Region;

	Select * from Order_table

SELECT
    SUM([Total_Price]) AS Total_Price_Sum,
    SUM([Unit_Cost]) AS Unit_Cost_Sum
FROM Order_table;
  
  Create table Order_sales_table(
  Orderdate DATE,
  Unit_Cost DECIMAL(10, 2),
  Storetype VARCHAR(1),
  year INT,
);
 Select * from Order_sales_table

   
 INSERT INTO Order_sales_table (Orderdate, Unit_Cost, StoreType, Year)
VALUES
  ('2021-01-06', 1.99, 'c', 2008),
  ('2021-01-23', 19.99, 'a', 2007),
  ('2021-02-09', 4.99, 'a', 2006),
  ('2021-02-26', 19.99, 'c', 2009),
  ('2021-03-15', 2.99, 'a', 2015),
  ('2021-04-01', 4.99, 'a', 2013),
  ('2021-04-18', 1.99, 'a', 2013),
  ('2021-05-05', 4.99, 'a', 2014),
  ('2021-05-22', 1.99, 'a', 2000),
  ('2021-06-08', 8.99, 'a', 2009);

 SELECT item_name, Region
FROM Order_table
WHERE Order_Id IN (4, 5, 6, 9);

SELECT DISTINCT Year
FROM Stores_table
WHERE CompetitionDistance IN (29910, 310, 3160);

 Select * from Stores_table

 SELECT Item_name
FROM Order_table
WHERE Total_Price > 200 AND Total_Price < 400;

-- Rename the column
EXEC sp_rename 'Stores_Table.CompetitionDistance', 'CD', 'COLUMN';

-- Find the total CD
SELECT SUM(CD) AS Total_CompetitionDistance
FROM Stores_Table;
 
 SELECT
    StoreType,
    COUNT(DISTINCT StoreType) AS Total_Count_StoreType,
    CD,
    COUNT(DISTINCT CD) AS Total_Count_CD
FROM Stores_Table
GROUP BY StoreType, CD;

-- Apply Cross Join
SELECT *
FROM Order_Table
CROSS JOIN Stores_Table;
 
 Drop database Order_Stores_Data;
