use B;

-- ----------------------------------------------
-- Bowler view creations  
-- ----------------------------------------------
create or replace view bscore as select * from Bowler_Scores;
create or replace view binfo as select * from Bowlers;
create or replace view match_games as select * from Match_Games;
create or replace view team as select * from Teams;
create or replace view tourneys as select * from Tournaments;
create or replace view tourney_match as select * from Tourney_Matches;
create or replace view ratings as select * from ztblBowlerRatings;
create or replace view labels as select * from ztblSkipLabels;
create or replace view weeks as select * from ztblWeeks;



-- ----------------------------------------------
-- binfo procedures 
--
-- Update bowler address.
-- Update bowler phone number.
-- Remove bowler.
-- Add bowler.
-- ----------------------------------------------
drop procedure if exists update_address;
delimiter //
create procedure update_address(id int, b_address varchar(50), city varchar(50), ste varchar(2), zip varchar(10)) 
begin 
    update binfo
    set BowlerAddress=b_address,
    BowlerCity=city,
    BowlerState=ste,    
    BowlerZip=zip
    where BowlerID=id; 
end //
delimiter ;

drop procedure if exists update_phone;
delimiter //
create procedure update_phone(id int, phone varchar(14)) 
begin 
    update binfo
    set BowlerPhoneNumber=phone
    where BowlerID=id; 
end //
delimiter ;

drop procedure if exists remove_bowler;
delimiter //
create procedure remove_bowler(id int) 
begin
    delete from binfo
    where BowlerId=id;
end //
delimiter ;

drop procedure if exists add_bowler;
delimiter //
create procedure add_bowler(id int, lname varchar(50), fname varchar(50), mname varchar(1), b_address varchar(50), city varchar(50), ste varchar(2), zip varchar(10), phone varchar(14), team int) 
begin 
    insert into binfo
    values(
        BowlerID=id,
        BowlerLastName=lname,
        BowlerFirstName=fname,
        BowlerMiddleInit=mname,
        BowlerAddress=b_address,
        BowlerCity=city,
        BowlerState=ste,    
        BowlerZip=zip,
        BowlerPhoneNumber=phone,
        TeamId=team
    );
end //
delimiter ;



-- ----------------------------------------------
-- bscore procedures 
--
-- Update bowling match score.
-- Add new match results.
-- Remove match results.
-- ----------------------------------------------
drop procedure if exists update_score;
delimiter //
create procedure update_score(id int, rscore smallint) 
begin 
    update bscore
    set RawScore=rscore
    where MatchID=id; 
end //
delimiter ;

drop procedure if exists insert_match_results;
delimiter //
create procedure insert_match_results(id int, game smallint, b_id int, rscore smallint, hscore smallint, winner bit(1) ) 
begin 
    insert into bscore
    values(
        MatchID=id,      
        GameNumber=game,   
        BowlerID=b_id,      
        RawScore=rscore,      
        HandiCapScore=hscore, 
        WonGame=winner
    );
end //
delimiter ;

drop procedure if exists remove_match_results;
delimiter //
create procedure remove_match_results(id int) 
begin
    delete from bscore
    where MatchId=id;
end //
delimiter ;



-- ----------------------------------------------
-- match_games procedures 
-- 
-- Update a match.
-- Insert a new match.
-- Remove a match.
-- ----------------------------------------------
drop procedure if exists update_match;
delimiter //
create procedure update_match(id int, game smallint, winning_team int) 
begin 
    update match_games
    set WinningTeamID=winning_team
    where MatchID=id and GameNumber=game; 
end //
delimiter ;

drop procedure if exists insert_new_match;
delimiter //
create procedure insert_new_match(id int, game smallint, winning_team int ) 
begin 
    insert into match_games
    values(
        MatchID=id,      
        GameNumber=game,   
        WinningTeamID=winning_team
    );
end //
delimiter ;

drop procedure if exists remove_match;
delimiter //
create procedure remove_match(id int, game smallint) 
begin
    delete from match_games
    where MatchId=id and GameNumber=game;
end //
delimiter ;



-- ----------------------------------------------
-- team procedures 
-- 
-- Update team information.
-- Add a new team.
-- Remove a team.
-- ----------------------------------------------
drop procedure if exists update_team;
delimiter //
create procedure update_team(id int, team_name varchar(50), captain_id int)
begin 
    update team
    set TeamName=team_name,
    CaptainID=captain_id
    where TeamID=id; 
end //
delimiter ;

drop procedure if exists add_new_team;
delimiter //
create procedure add_new_team(id int, team_name varchar(50), captain_id int ) 
begin 
    insert into team
    values(
        TeamID=id,      
        TeamName=team_name,   
        CaptainID=captain_id
    );
end //
delimiter ;

drop procedure if exists remove_team;
delimiter //
create procedure remove_team(id int) 
begin
    delete from team
    where TeamId=id;
end //
delimiter ;



-- ----------------------------------------------
-- tourneys procedures 
-- 
-- Update a tourney.
-- Add a new tourney.
-- Remove a tourney.
-- ----------------------------------------------
drop procedure if exists update_tourney;
delimiter //
create procedure update_tourney(id int, t_date date, t_location varchar(50))
begin 
    update tourneys
    set TourneyDate=t_date,
    TourneyLocation=t_location
    where TourneyID=id; 
end //
delimiter ;

drop procedure if exists add_tourney;
delimiter //
create procedure add_tourney(id int, t_date date, t_location varchar(50) ) 
begin 
    insert into tourney
    values(
        TourneyID=id,      
        TourneyDate=t_date,   
        TourneyLocation=t_location
    );
end //
delimiter ;

drop procedure if exists erase_tourney;
delimiter //
create procedure erase_tourney(id int) 
begin
    delete from tourneys
    where TourneyId=id;
end //
delimiter ;



-- ----------------------------------------------
-- ratings procedures 
-- 
-- Update bowler category ratings.
-- Add bowler ratings.
-- Remove a rating.
-- ----------------------------------------------
drop procedure if exists update_ratings;
delimiter //
create procedure update_ratings(rating varchar(15), low_avg smallint, high_avg smallint)
begin 
    update ratings
    set BowlerLowAvg=low_avg,
    BowlerHighAvg=high_avg
    where BowlerRating=rating; 
end //
delimiter ;

drop procedure if exists add_new_rating;
delimiter //
create procedure add_new_rating(rating varchar(15), low_avg smallint, high_avg smallint ) 
begin 
    insert into ratings
    values(
        BowlerRating=rating,      
        BowlerLowAvg=low_avg,
        BowlerHighAvg=high_avg
    );
end //
delimiter ;

drop procedure if exists remove_rating;
delimiter //
create procedure remove_rating(rating varchar(15)) 
begin
    delete from ratings
    where BowlerRating=rating;
end //
delimiter ;



-- -----------------------------------------
-- Captain View
-- 
-- Joined the team view and the binfo view 
-- in order to get each bowling teams' 
-- captain info.
-- -----------------------------------------
create or replace view captain_info as 
select 
    BowlerID, 
    CaptainID, 
    BowlerLastName, 
    BowlerFirstName, 
    BowlerCity, 
    BowlerState, 
    BowlerPhoneNumber, 
    TeamName 
from binfo inner join team on binfo.BowlerID=team.CaptainID;



-- -----------------------------------------
-- Most Wins Function
--
-- Calculates and returns the most amount of
-- games won by a single bowler. 
-- -----------------------------------------
drop function if exists most_wins;
delimiter //
create function most_wins()
returns int
deterministic
begin 
    declare most_wins int;
    set most_wins = (
        select count(WonGame) as num_wins 
        from bscore 
        where WonGame=1 
        group by BowlerID 
        order by num_wins desc 
        limit 1
    );
    return most_wins;
end //
delimiter ;



-- -----------------------------------------
-- Wizard of Oz Trigger
--
-- If a new bowler is inserted with a null 
-- value for the BowlerCity column, then
-- they will be sent to live in the Wizard
-- of Oz.
-- -----------------------------------------
drop trigger if exists before_inser_city;
delimiter //
create trigger before_inser_city before insert on Bowlers 
for each row 
begin
    if new.BowlerCity is null then 
        set new.BowlerCity = "Emerald City";
        set new.BowlerAddress = "Yellow Brick Rd";
        set new.BowlerState = "KS";
        set new.BowlerPhoneNumber = "1(800)NOT-INKS";
    end if;
end //
delimiter ;