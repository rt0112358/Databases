use newstuff;

-- build cats table if a cats table does not exists.
create table if not exists cats (
    num INT NOT NULL, -- AUTO_INCREMENT, -- number of times okay said
    add_date DATETIME, -- date and time
    cat_name varchar(255) not null,
    PRIMARY KEY (num)
); 

-- insert if the primary key 'num' does not match the given 'num' value.
-- insert ignore into cats (num, add_date, cat_name) values (1, CURRENT_TIMESTAMP, "billybob");

-- view results
select * from cats;
