-- ---------------------------------------------------
-- Init database to count number of times okay said
-- ---------------------------------------------------
USE test;

-- Create okay table
CREATE TABLE okay (
    num INT NOT NULL AUTO_INCREMENT, -- number of times okay said
    date DATETIME, -- date and time okay said/
    PRIMARY KEY (num)
);

-- init table data / example
insert into okay (date) values (CURRENT_TIMESTAMP);


-- Loop to autofill table with 100 entries
DELIMITER $$

CREATE PROCEDURE FillData()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE (i<=100) DO
        INSERT INTO okay(date) VALUES(CURRENT_TIMESTAMP);
        SET i=i+1;
    END WHILE;

END$$

DELIMITER ;

-- Execute the function
call FillData();