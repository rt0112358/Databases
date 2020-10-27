USE B;

SET @target_date = "2012-09-11";
SET @win_code = 1;

SELECT 
    SUM(RawScore)
FROM 
    Bowler_Scores

    INNER JOIN
    Tourney_Matches
    ON Bowler_Scores.MatchID=Tourney_Matches.MatchID
    
    INNER JOIN
    Tournaments
    ON Tourney_Matches.TourneyID=Tournaments.TourneyID
    
    WHERE TourneyDate=@target_date AND WonGame = @win_code;

-- SELECT *
-- FROM Tourney_Matches 
-- INNER JOIN Tournaments ON Tourney_Matches.TourneyID=Tournaments.TourneyID;

-- SELECT *
-- FROM Bowler_Scores
-- INNER JOIN Tourney_Matches ON Bowler_Scores.MatchID=Tourney_Matches.MatchID
-- LIMIT 10;
