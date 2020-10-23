USE SO;

SELECT DISTINCT o.OrderDate
FROM Orders o
WHERE o.OrderDate NOT IN (
    SELECT DISTINCT OrderDate
    FROM Orders 
    WHERE CustomerID = 1015
)


-- Range of total order dates
-- Order dates with 1015
-- Select distinct order dates(total) - distinct order dates(1015) 
