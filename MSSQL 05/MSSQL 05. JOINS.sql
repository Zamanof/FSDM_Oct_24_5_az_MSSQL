-- JOIN

-- implicit JOIN - Qeyri aşkar birləşmə
--USE ProductsDB

--SELECT *
--FROM Orders, Customers

--SELECT *
--FROM Orders, Customers
--WHERE Orders.CustomerId = Customers.Id

--SELECT Customers.FirstName, Products.ProductName, Orders.CreatedAt,
--					Orders.ProductCount, 
--					Orders.ProductCount * Orders.Price AS TotalPrice
--FROM Orders, Customers, Products
--WHERE Orders.CustomerId = Customers.Id AND
--				Orders.ProductId = Products.Id

-- Alias
--SELECT C.FirstName, P.ProductName, O.CreatedAt,
--					O.ProductCount, 
--					O.ProductCount * O.Price AS TotalPrice
--FROM Orders AS O, Customers AS C, Products AS P
--WHERE O.CustomerId = C.Id AND
--				O.ProductId = P.Id


-- explicit JOINS

-- CROSS JOIN

--SELECT *
--FROM Orders CROSS JOIN Customers
--WHERE Orders.CustomerId = Customers.Id

--SELECT C.FirstName, P.ProductName, O.CreatedAt,
--					O.ProductCount, 
--					O.ProductCount * O.Price AS TotalPrice
--FROM Orders AS O 
--	CROSS JOIN Customers AS C 
--	CROSS JOIN Products AS P
--WHERE O.CustomerId = C.Id AND
--				O.ProductId = P.Id

-- INNER JOIN

--SELECT C.FirstName, P.ProductName, O.CreatedAt,
--					O.ProductCount, 
--					O.ProductCount * O.Price AS TotalPrice
--FROM Orders AS O 
--		INNER JOIN Customers AS C ON O.CustomerId = C.Id
--		JOIN Products AS P ON O.ProductId = P.Id



-- OUTER {LEFT | RIGHT | FULL} JOIN

--SELECT C.FirstName, O.CreatedAt, O.ProductCount
--FROM Customers AS C
--LEFT JOIN Orders AS O 
--ON C.Id = O.CustomerId

--SELECT C.FirstName, O.CreatedAt, O.ProductCount
--FROM Customers AS C
--LEFT JOIN Orders AS O 
--ON C.Id = O.CustomerId
--WHERE O.CustomerId IS NULL

--SELECT C.FirstName, O.CreatedAt, O.ProductCount
--FROM Orders AS O
--RIGHT JOIN  Customers AS C
--ON C.Id = O.CustomerId
--WHERE O.CustomerId IS NULL

SELECT C.FirstName, O.CreatedAt, O.ProductCount, 
				O.Price * O.ProductCount AS TotalPrice, P.ProductName
FROM Customers AS C
FULL JOIN Orders AS O ON C.Id = O.CustomerId
FULL JOIN Products AS P ON P.Id = O.ProductId




SELECT C.FirstName,  P.ProductName
FROM Customers AS C
FULL JOIN Orders AS O ON C.Id = O.CustomerId
FULL JOIN Products AS P ON P.Id = O.ProductId
WHERE O.CustomerId IS NULL OR O.ProductId IS NULL

SELECT C.FirstName,  P.ProductName
FROM Customers AS C
FULL JOIN Orders AS O ON C.Id = O.CustomerId
FULL JOIN Products AS P ON P.Id = O.ProductId
WHERE O.CustomerId IS NOT NULL OR O.ProductId IS NOT NULL



