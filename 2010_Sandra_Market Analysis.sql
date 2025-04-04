CREATE TABLE SalesData (
    CustomerID INT,
    ProductID VARCHAR(10),
    PurchaseDate DATE,
    Quantity INT,
    Revenue DECIMAL(10,2)
);

INSERT INTO SalesData (CustomerID, ProductID, PurchaseDate, Quantity, Revenue) VALUES
(1, 'A', '2023-01-01', 5, 100.00),
(2, 'B', '2023-01-02', 3, 50.00),
(3, 'A', '2023-01-03', 2, 30.00),
(4, 'C', '2023-01-03', 1, 20.00),
(1, 'B', '2023-01-04', 4, 80.00);

SELECT * FROM public.salesdata
--Total Revenue--
SELECT SUM(Revenue) AS TotalRevenue FROM SalesData;

--total sales by product--
SELECT ProductID, 
       SUM(Quantity) AS TotalQuantity, 
       SUM(Revenue) AS TotalRevenue
FROM SalesData
GROUP BY ProductID ORDER BY productid;

--top customers--
SELECT CustomerID, SUM(Revenue) AS TotalRevenue
FROM SalesData
GROUP BY CustomerID
ORDER BY CustomerID;

