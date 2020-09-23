-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT *
FROM Product AS p
JOIN Category AS c on p.CategoryId = c.id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id, o.OrderDate, s.CompanyName
FROM 'Order' AS o 
JOIN Shipper AS s ON s.id = o.ShipVia
WHERE o.OrderDate < date('2012-08-09');

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT o.id, od.ProductId, p.ProductName, od.Quantity
FROM 'Order' AS o
JOIN OrderDetail AS od ON od.OrderId = o.id
JOIN Product AS p ON p.Id = od.ProductId
WHERE o.id = 10251
ORDER BY p.productName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id AS 'Order ID', c.CompanyName, e.LastName
FROM 'Order' AS o
JOIN Customer AS c ON o.CustomerId = c.id
JOIN Employee AS e ON e.Id = o.EmployeeId 