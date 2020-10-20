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

WITH count_music_pref AS (
    SELECT 
        CustomerID, StyleID
    FROM
        Musical_Preferences
)

SELECT 
    COUNT(DISTINCT CustomerID)
FROM 
    count_music_pref
WHERE 
    StyleID = @jazz_code OR StyleID = @salsa_code;