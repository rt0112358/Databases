USE B;

SELECT t1.*
FROM Bowler_Scores t1
INNER JOIN
(
    SELECT distinct GameNumber, MAX(RawScore) as max_score
    FROM Bowler_Scores
    where WonGame=0
    GROUP BY GameNumber
) t2
    ON t1.RawScore = t2.max_score
order by WonGame, GameNumber

-- TODO: Fix to get highest raw score for each game number