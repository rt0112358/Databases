USE E;

SET @first_name = "Karen";
SET @last_name = "Smith";
SET @cutoff_date = "2013-01-01";

SET @commission_rate = (
    select CommissionRate
    from Agents
    where AgtFirstName = @first_name
    and AgtLastName = @last_name
);

SET @id = (
    select AgentID
    from Agents 
    where AgtFirstName = @first_name
    and AgtLastName = @last_name
);

SET @earning =  (
    select sum(ContractPrice)*@commission_rate
    from Engagements 
    where AgentID=@id 
    and EndDate < @cutoff_date
);

select round(@earning, 2) as "Karen Smith's 2012 Earnings";