use E;

-- SELECT a.AgentID, SUM(ROUND((CommissionRate * ContractPrice), 2)) AgentComm
-- FROM Engagements e
-- JOIN Agents a ON (e.AgentID = a.AgentID)
-- WHERE StartDate BETWEEN '2012-01-01' AND '2012-12-31'
-- GROUP BY a.AgentID
-- HAVING AgentComm IN
-- (SELECT SUM(ROUND((CommissionRate * ContractPrice), 2)) AgentComm1
-- FROM Engagements e1
-- JOIN Agents a1 ON (e1.AgentID = a1.AgentID)
-- WHERE StartDate BETWEEN '2012-01-01' AND '2012-12-31'
-- GROUP BY a1.AgentID) 
-- order by AgentComm limit 1;

SELECT a.AgentID, SUM(ROUND((CommissionRate *ContractPrice), 2)) AgentComm
FROM Engagements e
JOIN Agents a ON (e.AgentID = a.AgentID)
WHERE StartDate BETWEEN '2012-01-01' AND'2012-12-31'
GROUP BY a.AgentID
HAVING AgentComm >= ALL
  (SELECT SUM(ROUND((CommissionRate *ContractPrice), 2)) AgentComm1
   FROM Engagements e JOIN Agents a ON (e.AgentID = a.AgentID)
   WHERE StartDate BETWEEN '2012-01-01' AND '2012-12-31'
   GROUP BY a.AgentID);