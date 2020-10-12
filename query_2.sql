USE E;

SET @jazz = "Jazz";
SET @salsa = "Salsa";

SELECT COUNT(DISTINCT(Customers.CustomerID))
FROM Customers

    INNER JOIN
    Musical_Preferences
    ON Customers.CustomerID=Musical_Preferences.CustomerID

    INNER JOIN
    Musical_Styles
    ON Musical_Preferences.StyleID=Musical_Styles.StyleID

    WHERE StyleName=@jazz OR StyleName=@salsa;

-- Table: Musical_Styles
-- StyleName=Salsa, StyleID=24
-- StyleName=Jazz, StyleID=15

-- Table: Musical_Preferences
-- StyleID: 15 or 24
-- CustomerID