USE E;

SELECT
    Agents.AgentID,
    Agents.AgtFirstName,
    Agents.AgtLastName,
    Round(SUM(ContractPrice*Agents.CommissionRate),2) AS Total_Sum 
FROM 
    Engagements e
INNER JOIN 
    Agents ON e.AgentID=Agents.AgentID
WHERE
    EndDate < "2013-01-01"
GROUP BY 
    AgentID
ORDER BY 
    Total_Sum DESC
LIMIT 1





