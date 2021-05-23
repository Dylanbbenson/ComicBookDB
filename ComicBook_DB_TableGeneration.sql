--Uncomment after initially running script.
/*
DROP TABLE Heroes CASCADE CONSTRAINTS;
DROP TABLE Villians CASCADE CONSTRAINTS;
DROP TABLE Teams CASCADE CONSTRAINTS;
DROP TABLE Locations CASCADE CONSTRAINTS;
DROP TABLE Publishers CASCADE CONSTRAINTS;
*/

--First is creating each table

CREATE TABLE Heroes (
    HeroID NUMBER GENERATED AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 99),
    Alias VARCHAR2(20) NOT NULL,
    FirstName VARCHAR2(20),
    LastName VARCHAR2(20),
    LeaderID NUMBER,
    Power VARCHAR2(50) NOT NULL,
    Weakness VARCHAR2(20),
    PRIMARY KEY(HeroID),
    FOREIGN KEY(LeaderID) REFERENCES Heroes(HeroID) ON DELETE CASCADE
);

CREATE TABLE Villians (
    VillianID NUMBER GENERATED AS IDENTITY (START WITH 101 INCREMENT BY 1 MAXVALUE 199),
    Alias VARCHAR2(20) NOT NULL,
    FirstName VARCHAR2(20),
    LastName VARCHAR2(20),
    Power VARCHAR2(20) NOT NULL,
    Weakness VARCHAR2(20),
    PRIMARY KEY(VillianID)
);

CREATE TABLE Teams (
    TeamID NUMBER GENERATED AS IDENTITY (START WITH 201 INCREMENT BY 1 MAXVALUE 299),
    Name VARCHAR2(30) NOT NULL,
    PRIMARY KEY(TeamID)
);

CREATE TABLE Locations (
    LocationID NUMBER GENERATED AS IDENTITY (START WITH 301 INCREMENT BY 1 MAXVALUE 399),
    City VARCHAR2(20),
    Country VARCHAR2(20),
    Population NUMBER,
    Real NUMBER(1) NOT NULL,
    PRIMARY KEY(LocationID)
);

CREATE TABLE Publishers (
    PublisherID NUMBER GENERATED AS IDENTITY (START WITH 401 INCREMENT BY 1 MAXVALUE 499),
    Name VARCHAR2(20) NOT NULL,
    Creator VARCHAR2(20) NOT NULL,
    DateEstablished DATE,
    Status NVARCHAR2(12),
    PRIMARY KEY(PublisherID)
);

--Next is adding foreign key constraints

ALTER TABLE Heroes ADD (
    NemesisID NUMBER,
    TeamID NUMBER,
    LocationID NUMBER,
    PublisherID NUMBER,
    Cape NUMBER(1),
    Status NVARCHAR2(8),
    FOREIGN KEY(NemesisID) REFERENCES Villians(VillianID) ON DELETE CASCADE,
    FOREIGN KEY(TeamID) REFERENCES Teams(TeamID) ON DELETE CASCADE,
    FOREIGN KEY(LocationID) REFERENCES Locations(LocationID) ON DELETE CASCADE,
    FOREIGN KEY(PublisherID) REFERENCES Publishers(PublisherID) ON DELETE CASCADE
);

ALTER TABLE Villians ADD (
    NemesisID NUMBER,
    TeamID NUMBER,
    LocationID NUMBER,
    PublisherID NUMBER,
    Status NVARCHAR2(8) NOT NULL,
    FOREIGN KEY(NemesisID) REFERENCES Heroes(HeroID) ON DELETE CASCADE,
    FOREIGN KEY(TeamID) REFERENCES Teams(TeamID) ON DELETE CASCADE,
    FOREIGN KEY(LocationID) REFERENCES Locations(LocationID) ON DELETE CASCADE,
    FOREIGN KEY(PublisherID) REFERENCES Publishers(PublisherID) ON DELETE CASCADE
);

ALTER TABLE Teams ADD (
    LeaderID NUMBER,
    EnemyTeamID NUMBER,
    HQ NUMBER,
    Motive NVARCHAR2(7),
    FOREIGN KEY(LeaderID) REFERENCES Heroes(HeroID) ON DELETE CASCADE,
    FOREIGN KEY(EnemyTeamID) REFERENCES Teams(TeamID) ON DELETE CASCADE,
    FOREIGN KEY(HQ) REFERENCES Locations(LocationID) ON DELETE CASCADE
);

--You can populate this database with data by running the ComicBook_DB_Data.sql script, which is in the same repository as this one