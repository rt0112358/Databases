-- Airlines database creation
create database if not exists airlines;

-- Table creation
create table if not exists Flight (
    FlightID int not null, 
    FlightNumber int,
    DayOfWeek varchar(1), 
    RouteID int not null,
    foreign key (RouteID) references Route(RouteID), -- foreign key creation 
    primary key (FlightID) -- primary key creation
); 

-- Table creation
create table if not exists Route (
    RouteID int not null, 
    RouteName varchar(100),
    DaysOperating char(20), 
    ScheduleDeparture time not null,
    ScheduleArrivale time not null,
    MarketID int not null,
    AirlineID int not null,
    foreign key (MarketID) references Market(MarketID), -- foreign key creation
    foreign key (AirlineID) references Airline(AirlineID), -- foreign key creation
    primary key (RouteID) -- primary key creation
);

-- Table creation
create table if not exists Market (
    MarketID int not null, 
    MarketName varchar(200) not null,
    StartAirport varchar(3) not null, 
    EndAirport varchar(3) not null,
    foreign key (StartAirport) references Airport(AirportAbbrev), -- foreign key creation
    foreign key (EndAirport) references Airport(AirportAbbrev), -- foreign key creation
    primary key (MarketID) -- primary key creation
);

-- Table creation
create table if not exists Airline (
    AirlineID int not null, 
    AirlineAbbreviation varchar(6) not null,
    Address1 varchar(100), 
    Address2 varchar(100),
    City varchar(100),
    StateProvince varchar(20),
    Country varchar(100),
    primary key (AirlineID) -- primary key creation
);

-- Table creation
create table if not exists Airport (
    AirportAbbrev varchar(3) not null,
    AirportName varchar(100) not null, 
    CityName varchar(100),
    CountyName varchar(100),
    State varchar(2),
    Country varchar(100),
    primary key (AirportAbbrev) -- primary key creation
);


insert into Flight (FlightID, DayOfWeek, RouteID)
values (2365,"M",42);
insert into Flight (FlightID, DayOfWeek, RouteID)
values (6568,"F",2812);
insert into Flight (FlightID, DayOfWeek, RouteID)
values (4242,"T",0420);
insert into Flight (FlightID, DayOfWeek, RouteID)
values (007,"W",192);
insert into Flight (FlightID, DayOfWeek, RouteID)
values (7623,"U",8712);
insert into Flight (FlightID, DayOfWeek, RouteID)
values (25,"S",8234);
insert into Flight (FlightID, DayOfWeek, RouteID)
values (8214,"R",87361);