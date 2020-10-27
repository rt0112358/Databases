USE B;

SELECT 
     BowlerID, RawScore, WonGame
FROM 
    Bowler_Scores 
WHERE 
    WonGame=0 
ORDER BY 
    RawScore 
DESC 
LIMIT 5;
