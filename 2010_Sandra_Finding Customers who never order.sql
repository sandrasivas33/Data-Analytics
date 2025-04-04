CREATE TABLE Customers (
    id SERIAL PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL
);

INSERT INTO Customers (id, NAME) VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    customerId INT 
);

INSERT INTO Orders (id, customerId) VALUES
(2, 1),
(1, 3);

SELECT NAME AS Customers   
FROM Customers
WHERE id NOT IN (SELECT customerId FROM Orders);





