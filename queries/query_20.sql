USE SO;

SET @total_cash = (
    SELECT SUM(QuotedPrice * QuantityOrdered) 
    AS cash 
    FROM Order_Details);
SET @num_orders = (
    SELECT COUNT(DISTINCT OrderNumber) 
    FROM Order_Details);
SET @avg_sale = @total_cash/@num_orders;

SELECT
    ca.CategoryDescription AS "DEPT",
    p.ProductNumber AS "Item ID",
    p.ProductName AS "Product",
    od.QuotedPrice AS "Price",
    od.QuantityOrdered AS "Qty",
    (od.QuantityOrdered * od.QuotedPrice) AS Paid,
    od.OrderNumber AS "Order Number"
FROM Customers c
JOIN Orders o ON (c.CustomerID=o.CustomerID)
JOIN Order_Details od ON (o.OrderNumber=od.OrderNumber)
JOIN Products p ON (od.ProductNumber=p.ProductNumber)
JOIN Categories ca ON (p.CategoryID=ca.CategoryID)
HAVING paid >= @avg_sale
ORDER BY Paid

