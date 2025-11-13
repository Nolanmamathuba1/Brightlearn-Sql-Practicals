--1. INNER JOIN: Orders with Customer and Product Names
--Question:
--List all orders along with the customer name and product name.
--Expected Output Columns:
--• OrderID, OrderDate, CustomerName, ProductName, Quantity

SELECT		
	CUSTOMER.CustomerID,
	CUSTOMER.CustomerName,
	PRODUCTS.Productname,
	ORDERS.quantity,
	ORDERS.OrderDate
FROM	
    CUSTOMER_PRODUCTS.DATASET.ORDERS
JOIN	
    CUSTOMER_PRODUCTS.DATASET.CUSTOMER ON ORDERS.CustomerID = CUSTOMER.customerID
JOIN	
    CUSTOMER_PRODUCTS.DATASET.PRODUCTS ON ORDERS.ProductID = PRODUCTS.ProductID;
		
--2. INNER JOIN: Customers Who Placed Orders
--Question:
--Which customers have placed at least one order?
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate

SELECT 
  c.customerid AS "CustomerID",
  c.customername AS "CustomerName",
  c.country AS "Country",
  o.orderid AS "OrderID",
  o.orderdate AS "OrderDate"
FROM customer c
INNER JOIN orders o ON c.customerid = o.customerid


--3. LEFT JOIN: All Customers and Their Orders
--Question:
--List all customers and any orders they might have placed. Include customers who have
--not placed any orders.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT 
    c.CustomerID,
    c.CustomerName,
    c.Country,
    o.OrderID,
    o.OrderDate,
    o.ProductID,
    o.Quantity
FROM Customer AS c
LEFT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID;




--4. LEFT JOIN: Product Order Count
--Question:
--List all products and how many times each was ordered (if any).
--Expected Output Columns:
--• ProductID, ProductName, TotalOrders
--(TotalOrders is the count of how many times the product appears in orders)

SELECT 
    p.ProductID,
    p.ProductName,
    COUNT(o.OrderID) AS TotalOrders
FROM Products AS p
LEFT JOIN Orders AS o
    ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY p.ProductID;


--5. RIGHT JOIN: Orders with Product Info (Include Products Not Ordered)
--Question:
--Find all orders along with product details, including any products that might not have
--been ordered.
--Expected Output Columns:
--• OrderID, OrderDate, ProductID, ProductName, Price, Quantity


SELECT 
    o.OrderID,
    o.OrderDate,
    p.ProductID,
    p.ProductName,
    p.Price,
    o.Quantity
FROM Orders AS o
RIGHT JOIN Products AS p
    ON o.ProductID = p.ProductID
ORDER BY p.ProductID;


--6. RIGHT JOIN: Customer Info with Orders (Include All Customers)
--Question:
--Which customers have made orders, and include customers even if they have never
--placed an order.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT 
    c.CustomerID,
    c.CustomerName,
    c.Country,
    o.OrderID,
    o.OrderDate,
    o.ProductID,
    o.Quantity
FROM Orders AS o
RIGHT JOIN Customer AS c
    ON o.CustomerID = c.CustomerID
ORDER BY c.CustomerID;


--7. FULL OUTER JOIN: All Customers and All Orders
--Question:
--List all customers and orders, showing NULLs where customers have not ordered or
--where orders have no customer info.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity


SELECT 
    c.CustomerID,
    c.CustomerName,
    c.Country,
    o.OrderID,
    o.OrderDate,
    o.ProductID,
    o.Quantity
FROM Customer AS c
FULL OUTER JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderID;



--8. FULL OUTER JOIN: All Products and Orders
--Question:
--List all products and orders, showing NULLs where products were never ordered or
--orders are missing product info.
--Expected Output Columns:
--• ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity


SELECT 
    p.ProductID,
    p.ProductName,
    p.Price,
    o.OrderID,
    o.OrderDate,
    o.CustomerID,
    o.Quantity
FROM Products AS p
FULL OUTER JOIN Orders AS o
    ON p.ProductID = o.ProductID
ORDER BY p.ProductID, o.OrderID;

