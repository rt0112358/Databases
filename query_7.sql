USE SO;

SELECT od.ProductNumber AS "ID", 
    p.ProductName AS "Name", 
    SUM(od.QuotedPrice * od.QuantityOrdered) AS Total_Sum 
FROM 
    Order_Details od
INNER JOIN 
    Products p ON od.ProductNumber=p.ProductNumber
GROUP BY 
    p.ProductNumber
ORDER BY 
    Total_Sum DESC
LIMIT 1;

