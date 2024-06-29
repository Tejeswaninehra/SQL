 -- Create the database
CREATE DATABASE Customers_Orders_Products;
USE Customers_Orders_Products;
 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);
 
 INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES
  (1, 'John', 'Doe', 'johndoe@example.com'),
  (2, 'Jane', 'Smith', 'janesmith@example.com'),
  (3, 'Robert', 'Johnson', 'robertjohnson@example.com'),
  (4, 'Emily', 'Brown', 'emilybrown@example.com'),
  (5, 'Michael', 'Davis', 'michaeldavis@example.com'),
  (6, 'Sarah', 'Wilson', 'sarahwilson@example.com'),
  (7, 'David', 'Thompson', 'davidthompson@example.com'),
  (8, 'Jessica', 'Lee', 'jessicalee@example.com'),
  (9, 'William', 'Turner', 'williamturner@example.com'),
  (10, 'Olivia', 'Martinez', 'oliviamartinez@example.com');

  select * from Customers 

 SELECT firstName, lastname, Email
FROM Customers
WHERE firstname Like 'j'



  CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductID INT,
  OrderDate DATE,
  Quantity INT,
);

INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity)
VALUES
  (1, 1, 1, '2023-07-01', 5),
  (2, 2, 2, '2023-07-02', 3),
  (3, 3, 3, '2023-07-03', 2),
  (4, 4, 1, '2023-07-04', 1),
  (5, 5, 2, '2023-07-05', 4),
  (6, 6, 3, '2023-07-06', 2),
  (7, 7, 1, '2023-07-07', 3),
  (8, 8, 2, '2023-07-08', 2),
  (9, 9, 3, '2023-07-09', 5),
  (10, 10, 1, '2023-07-10', 1);

   select * from Orders

SELECT
    o.OrderID,
    p.ProductName,
    o.Quantity
FROM
    Orders o
JOIN
    Products p ON o.ProductID = p.ProductID;

	SELECT SUM(Quantity) AS TotalQuantity
FROM Orders;


SELECT DISTINCT c.firstName
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;






  CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);
 
 
INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);
 
   select * from  Products
  
  SELECT *
FROM Products
WHERE Price > 10.00;

 SELECT
    c.firstName AS CustomerName,
    o.OrderDate
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
WHERE
    o.OrderDate >= '2023-07-05';

 SELECT AVG(Price) AS AveragePrice
FROM Products;

SELECT
    c.firstName AS CustomerName,
    SUM(o.Quantity) AS TotalQuantityOrdered
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.firstName;


	SELECT *
FROM Products
WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM Orders);

 
 SELECT
    c.CustomerID,
    c.firstName AS CustomerName,
    SUM(o.Quantity) AS TotalQuantityOrdered
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.firstName
ORDER BY
    TotalQuantityOrdered DESC;
   

  SELECT AVG(Price) AS AveragePrice
FROM Products;

SELECT *
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);
 
 SELECT
    o.OrderID,
    p.ProductName,
    o.Quantity
FROM
    Orders o
JOIN
    Products p ON o.ProductID = p.ProductID
JOIN
    Customers c ON o.CustomerID = c.CustomerID
WHERE
    c.firstName LIKE 'M%';


	 SELECT SUM(o.Quantity * p.Price) AS TotalRevenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID;
 


 SELECT
    c.FirstName AS CustomerName,
    SUM(o.Quantity * p.Price) AS TotalRevenue
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    Products p ON o.ProductID = p.ProductID
GROUP BY
    c.firstName;


 SELECT c.CustomerID, c.firstName AS CustomerName
FROM Customers c
WHERE NOT EXISTS (
    SELECT ProductID
    FROM Products
    WHERE NOT EXISTS (
        SELECT 1
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID
        AND o.ProductID = Products.ProductID
    )
);

SELECT DISTINCT c.CustomerID, c.firstName AS CustomerName
FROM Customers c
JOIN Orders o1 ON c.CustomerID = o1.CustomerID
JOIN Orders o2 ON c.CustomerID = o2.CustomerID
WHERE DATEDIFF(day, o1.OrderDate, o2.OrderDate) = 1
   OR (o1.OrderDate = o2.OrderDate AND o1.OrderID <> o2.OrderID);

   SELECT TOP 3
    p.ProductID,
    p.ProductName,
    AVG(o.Quantity) AS AverageQuantityOrdered
FROM
    Products p
JOIN
    Orders o ON p.ProductID = o.ProductID
GROUP BY
    p.ProductID, p.ProductName
ORDER BY
    AverageQuantityOrdered DESC;


 SELECT
    (COUNT(CASE WHEN o.Quantity > AvgQuantity THEN 1 END) * 100.0) / COUNT(*) AS PercentageOrders
FROM
    Orders o
CROSS JOIN
    (SELECT AVG(Quantity) AS AvgQuantity FROM Orders) AS AvgTable;


   
   SELECT c.CustomerID, c.firstName AS CustomerName
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Products p
    WHERE NOT EXISTS (
        SELECT 1
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID
        AND p.ProductID = o.ProductID
    )
);

SELECT p.ProductID, p.ProductName
FROM Products p
WHERE NOT EXISTS (
    SELECT 1
    FROM Customers c
    WHERE NOT EXISTS (
        SELECT 1
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID
        AND o.ProductID = p.ProductID
    )
);

SELECT
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    SUM(Quantity * Price) AS MonthlyRevenue
FROM
    Orders o
JOIN
    Products p ON o.ProductID = p.ProductID
GROUP BY
    YEAR(OrderDate), MONTH(OrderDate)
ORDER BY
    OrderYear, OrderMonth;

 

 WITH ProductCustomerCounts AS (
    SELECT
        o.ProductID,
        COUNT(DISTINCT o.CustomerID) AS CustomerCount
    FROM
        Orders o
    GROUP BY
        o.ProductID
)

SELECT
    p.ProductID,
    p.ProductName
FROM
    Products p
JOIN
    ProductCustomerCounts pc ON p.ProductID = pc.ProductID
WHERE
    pc.CustomerCount > 0.5 * (SELECT COUNT(*) FROM Customers);


 SELECT TOP 5
    c.CustomerID,
    c.firstName AS CustomerName,
    SUM(o.Quantity * p.Price) AS TotalSpent
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    Products p ON o.ProductID = p.ProductID
GROUP BY
    c.CustomerID, c.firstName
ORDER BY
    TotalSpent DESC;


	WITH CustomerRunningTotal AS (
    SELECT
        o.CustomerID,
        o.OrderID,
        o.Quantity,
        SUM(o.Quantity) OVER (PARTITION BY o.CustomerID ORDER BY o.OrderID) AS RunningTotal
    FROM
        Orders o
)

SELECT
    crt.CustomerID,
    c.firstName AS CustomerName,
    crt.OrderID,
    crt.Quantity,
    crt.RunningTotal
FROM
    CustomerRunningTotal crt
JOIN
    Customers c ON crt.CustomerID = c.CustomerID
ORDER BY
    crt.CustomerID, crt.OrderID;


	
 
 SELECT
    o.CustomerID,
    c.firstName AS CustomerName,
    SUM(o.Quantity * p.Price) AS TotalRevenue
FROM
    Orders o
JOIN
    Products p ON o.ProductID = p.ProductID
JOIN
    Customers c ON o.CustomerID = c.CustomerID
WHERE
    o.OrderDate >= DATEADD(day, -30, GETDATE())
GROUP BY
    o.CustomerID, c.firstName
ORDER BY
    TotalRevenue DESC;


	
	WITH CustomerOrderedProducts AS (
    SELECT DISTINCT
        o.CustomerID,
        o.ProductID
    FROM
        Orders o
)

SELECT
    c.CustomerID,
    c.firstName AS CustomerName
FROM
    Customers c
WHERE
    (
        SELECT COUNT(DISTINCT ProductID)
        FROM CustomerOrderedProducts cop
        WHERE cop.CustomerID = c.CustomerID
    ) >= 2;


	WITH CustomerOrderRevenue AS (
    SELECT
        o.CustomerID,
        o.OrderID,
        SUM(o.Quantity * p.Price) AS OrderRevenue
    FROM
        Orders o
    JOIN
        Products p ON o.ProductID = p.ProductID
    GROUP BY
        o.CustomerID, o.OrderID
)

SELECT
    cor.CustomerID,
    c.firstName AS CustomerName,
    AVG(cor.OrderRevenue) AS AverageRevenuePerOrder
FROM
    CustomerOrderRevenue cor
JOIN
    Customers c ON cor.CustomerID = c.CustomerID
GROUP BY
    cor.CustomerID, c.firstName;



	WITH CustomerOrderedMonths AS (
    SELECT DISTINCT
        o.CustomerID,
        MONTH(o.OrderDate) AS OrderMonth
    FROM
        Orders o
    WHERE
        YEAR(o.OrderDate) = 2023  -- Replace 2023 with the specific year you are interested in
)

SELECT
    c.CustomerID,
    c.firstName AS CustomerName
FROM
    Customers c
WHERE
    NOT EXISTS (
        SELECT DISTINCT 1
        FROM
            CustomerOrderedMonths com
        WHERE
            com.CustomerID = c.CustomerID
            AND com.OrderMonth NOT IN (1,2,3,4,5,6,7,8,9,10,11,12)  -- Include all months of the specific year
    );


	 WITH CustomerConsecutiveMonths AS (
    SELECT DISTINCT
        o.CustomerID,
        o.ProductID,
        YEAR(o.OrderDate) AS OrderYear,
        MONTH(o.OrderDate) AS OrderMonth
    FROM
        Orders o
    WHERE
        o.ProductID = (SELECT ProductID FROM Products WHERE ProductName = 'Product A')  -- Replace with the specific product name
)

SELECT
    c.CustomerID,
    c.firstName AS CustomerName
FROM
    Customers c
WHERE
    EXISTS (
        SELECT DISTINCT 1
        FROM
            CustomerConsecutiveMonths ccm1
            JOIN CustomerConsecutiveMonths ccm2
                ON ccm1.CustomerID = ccm2.CustomerID
                AND ccm1.OrderYear = ccm2.OrderYear
                AND ccm1.OrderMonth = ccm2.OrderMonth - 1
        WHERE
            ccm1.CustomerID = c.CustomerID
    );


WITH CustomerOrderedProducts AS (
    SELECT
        o.CustomerID,
        o.ProductID,
        COUNT(o.ProductID) AS OrderCount
    FROM
        Orders o
    WHERE
        o.CustomerID = 1  -- Replace with the specific CustomerID
    GROUP BY
        o.CustomerID, o.ProductID
    HAVING
        COUNT(o.ProductID) >= 2
)

SELECT
    p.ProductID,
    p.ProductName
FROM
    CustomerOrderedProducts cop
JOIN
    Products p ON cop.ProductID = p.ProductID;
 
