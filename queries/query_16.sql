USE E;

SET @lava = "Seattle";
-- Don't step on hot lava
-- In this case:
--     Don't step on Seattle

SELECT 
    CustFirstName, CustLastName, CustCity
FROM 
    Customers
WHERE 
    Customers.CustCity != @lava
UNION ALL
SELECT 
    AgtFirstName, AgtLastName, AgtCity 
FROM 
    Agents
WHERE 
    Agents.AgtCity != @lava
ORDER BY
    CustLastName,
    CustFirstName;

-- Get all Customers and Agents who 
-- DO NOT live in seattle