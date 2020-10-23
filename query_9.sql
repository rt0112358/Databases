USE B;

SET @target_location = "Bolero Lanes";

SELECT
    distinct TeamName,
    Count(GameNumber) AS Games_Won 
FROM 
    Tournaments
INNER JOIN
    Tourney_Matches ON Tournaments.TourneyID=Tourney_Matches.TourneyID
INNER JOIN
    Match_Games ON Tourney_Matches.MatchID=Match_Games.MatchID
INNER JOIN 
    Teams ON Match_Games.WinningTeamID=Teams.TeamID
WHERE
    TourneyLocation = @target_location
GROUP BY
    TeamName
HAVING 
    Games_Won > 2;
