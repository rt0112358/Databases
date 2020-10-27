USE E;

SELECT DISTINCT *
FROM Customers c
    WHERE NOT EXISTS (
        SELECT * 
        FROM Engagements eng
        WHERE eng.CustomerID = c.CustomerID
        AND eng.StartDate > "2012-12-31"
    )


