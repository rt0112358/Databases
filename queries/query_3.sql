USE E;

SET @jazz = "Jazz";
SET @salsa = "Salsa";

SET @jazz_code = (
    SELECT StyleID 
    FROM Musical_Styles 
    WHERE StyleName = @jazz
);

SET @salsa_code = (
    SELECT StyleID 
    FROM Musical_Styles 
    WHERE StyleName = @salsa
);

SELECT 
    COUNT(DISTINCT CustomerID)
FROM
    Musical_Preferences
WHERE
    StyleID=@jazz_code OR StyleID=@salsa_code;