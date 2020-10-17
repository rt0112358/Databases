USE E;

SELECT DISTINCT ent.EntertainerID, ent.EntStageName, ent.EntSSN 
FROM Entertainers ent
    WHERE NOT EXISTS (
        SELECT * 
        FROM Engagements eng
        WHERE eng.EntertainerID = ent.EntertainerID
    )

-- Get the entertainers from 
-- Entertainers tables that
-- are not in the 
-- Engagements table
