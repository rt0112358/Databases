CREATE DATABASE IF NOT EXISTS C;
USE C;
DROP TABLE IF EXISTS employee CASCADE;
CREATE TABLE employee (
  fname    VARCHAR(15) not null, 
  minit    VARCHAR(1),
  lname    VARCHAR(15) not null,
  ssn      char(9),
  bdate    date,
  address  VARCHAR(50),
  sex      char,
  salary   NUMERIC(10,2),
  superssn char(9),
  dno      NUMERIC(4),
  primary key (ssn),
  foreign key (superssn) references employee(ssn)
--  foreign key (dno) references department(dnumber)
);

DROP TABLE IF EXISTS department CASCADE ;
CREATE TABLE department (
  dname        VARCHAR(25) not null,
  dnumber      NUMERIC(4),
  mgrssn       char(9) not null, 
  mgrstartdate date,
  primary key (dnumber),
  unique (dname),
  foreign key (mgrssn) references employee(ssn)
);

ALTER TABLE employee ADD 
  foreign key (dno) references department(dnumber);

DROP TABLE IF EXISTS dept_locations CASCADE ;
CREATE TABLE dept_locations (
  dnumber   NUMERIC(4),
  dlocation VARCHAR(15), 
  primary key (dnumber,dlocation),
  foreign key (dnumber) references department(dnumber)
);

DROP TABLE IF EXISTS project CASCADE ;
CREATE TABLE project (
  pname      VARCHAR(25) not null,
  pnumber    NUMERIC(4),
  plocation  VARCHAR(15),
  dnum       NUMERIC(4) not null,
  primary key (pnumber),
  unique (pname),
  foreign key (dnum) references department(dnumber)
);

DROP TABLE IF EXISTS works_on CASCADE ;
CREATE TABLE works_on (
  essn   char(9),
  pno    NUMERIC(4),
  hours  NUMERIC(4,1),
  primary key (essn,pno),
  foreign key (essn) references employee(ssn),
  foreign key (pno) references project(pnumber)
);

DROP TABLE IF EXISTS dependent CASCADE ;
CREATE TABLE dependent (
  essn           char(9),
  dependent_name VARCHAR(15),
  sex            char,
  bdate          date,
  relationship   VARCHAR(8),
  primary key (essn,dependent_name),
  foreign key (essn) references employee(ssn)
);
