use B;

-- --------------------------------------
-- Collapse of USSR in 1991 lead to 
-- the soviet leaders being removed 
-- from the list of bowlers held in 
-- the MySQL binfo view table. 
-- --------------------------------------
call remove_bowler("35");
call remove_bowler("36");
call remove_bowler("37");
call remove_bowler("38");

select * from binfo order by BowlerID desc;

