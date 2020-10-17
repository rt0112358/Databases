USE E;

SET @max_commission = (SELECT MAX(CommissionRate) FROM Agents);
SELECT ROUND(@max_commission, 2);
