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

--Now to insert the data

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Batman', 'Bruce', 'Wayne', NULL, 'Rich', 'Dead Parents', NULL, NULL, NULL, NULL, 1, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Joker', NULL, NULL, 'Time Management', 'The IRS', 1, NULL, NULL, NULL, 'Alive');

INSERT INTO Teams (Name, Motive) VALUES ('Justice League', 'Good');
INSERT INTO Locations (City, Country, Population, Real) VALUES ('Gotham', 'USA', '10153720', 0);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('Washington D.C.', 'USA', '702455', 1);
INSERT INTO Publishers (Name, Creator, DateEstablished, Status) VALUES ('DC', 'Wheeler-Nicholson', '22-JUNE-1934', 'Active');

UPDATE Heroes SET NemesisID = 101, TeamID = 201, LocationID = 301, PublisherID = 401 WHERE HeroID = 1;
UPDATE Villians SET NemesisID = 1, LocationID = 301, PublisherID = 401 WHERE VillianID = 101;
UPDATE Teams SET LeaderID = 1, HQ = 302 WHERE TeamID = 201; 

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Superman', 'Clark', 'Kent', 1, 'Strength', 'Kryptonite', NULL, 201, NULL, 401, 1, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Lex Luthor', 'Alexander', 'Luthor', 'Intelligence', 'Ego', 2, NULL, NULL, 401, 'Alive');

INSERT INTO Locations (City, Country, Population, Real) VALUES ('Metropolis', 'USA', '11833625', 0);
INSERT INTO Publishers (Name, Creator, DateEstablished, Status) VALUES ('Marvel', 'Martin Goodman', '05-MARCH-1939', 'Active');
INSERT INTO Teams (Name, EnemyTeamID, Motive) VALUES ('Legion of Doom', 201, 'Evil');

UPDATE Teams SET EnemyTeamID = 202 WHERE TeamID = 201; 
UPDATE Heroes SET NemesisID = 102, TeamID = 201, LocationID = 303, PublisherID = 401 WHERE HeroID = 2;
UPDATE Villians SET NemesisID = 2, TeamID = 202, LocationID = 303, PublisherID = 401 WHERE VillianID = 102;

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Wonder Woman', 'Diana', 'Prince', 1, 'Whip', 'Naivety', NULL, 201, NULL, 401, 1, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Cyborg', 'Victor', 'Stone', 1, 'Cybernetics', 'Virus', NULL, 201, NULL, 401, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Flash', 'Barry', 'Allen', 1, 'Speed', 'Cold', NULL, 201, NULL, 401, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Aquaman', 'Arthur', 'Curry', 1, 'Talks to Fish', 'Lack of Water', NULL, 201, NULL, 401, 1, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Green Lantern', 'Hal', 'Jordan', 1, 'Energy Constructs', 'The Color Yellow', NULL, 201, NULL, 401, 1, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Cheetah', 'Priscilla', 'Rich', 'Acrobatics', 'Feral Mind', 3, NULL, NULL, 401, 'Alive');

Update Heroes SET NemesisID = 103 WHERE Alias = 'Wonder Woman';

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Reverse-Flash', 'Eobard', 'Thawne', 'Speed', 'Cold', 4, NULL, NULL, 401, 'Alive');

UPDATE Heroes SET NemesisId = 104 WHERE Alias = 'Flash';

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Black Manta', 'David', 'Hyde', 'Expert Tactician', 'Unlikeable', 5, 202, NULL, 401, 'Alive');

UPDATE Heroes SET NemesisId = 105 WHERE Alias = 'Aquaman';

INSERT INTO Locations (City, Country, Population, Real) VALUES ('New York', 'USA', '11833625', 1);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('NULL', 'Themyscira', '13054', 0);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('California', 'USA', '12634', 1);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('NULL', 'Wakanda', '6037395', 0);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('Alberta', 'Canada', '3645257', 1);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('Ohio', 'USA', '6037395', 1);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('Nuremberg', 'Germany', '6037395', 1);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('St. Charles', 'Missouri', '6037395', 1);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('Volgograd', 'Russia', '6037395', 1);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('NULL', 'Asgard', '5000', 0);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('NULL', 'Zen-Whoberis', '5000000000000', 0);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('NULL', 'Planet X', '3857103', 0);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('NULL', 'Halfworld', '83752', 0);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('NULL', 'Kylos', '2453523', 0);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('NULL', 'Dervani', '2453523', 0);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('Habuquan', 'China', '24280000', 0);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('Berlin', 'Germany', '3769495', 1);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('Moscow', 'Russia', '12500000', 1);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('Boise', 'Idaho', '205671', 1);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('Imaya', 'Africa', '604225', 0);
INSERT INTO Locations (City, Country, Population, Real) VALUES ('NULL', 'A''Lars', 0, 0);
INSERT INTO Locations (CITY, COUNTRY, POPULATION, REAL) VALUES ('Baltimore', 'USA', 593490, 1);

INSERT INTO Teams (Name, EnemyTeamID, Motive) VALUES ('Avengers', NULL, 'Good');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Iron Man', 'Tony', 'Stark', NULL, 'Cybernetics', 'Alcoholism', NULL, 203, 306, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Captain America', 'Steve', 'Rogers', 8 , 'Shield', 'Brainwashing', NULL, 203, 306, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Spider-Man', 'Peter', 'Parker', 8 , 'Web-Slinging', 'Civilians', NULL, 203, 306, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Hulk', 'Bruce', 'Banner', 8 , 'Strength', 'Rage', NULL, 203, 309, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Thor', 'Thor', 'Odenson', 8 , 'Thunder', 'Magic', NULL, 203, 313, 402, 1, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Black Widow', 'Natasha', 'Romanoff', 8 , 'Agility', 'Memory', NULL, 203, 312, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Dr. Strange', 'Stephen', 'Strange', NULL , 'Mystic Arts', 'Arrogance', NULL, 203, 306, 402, 1, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Black Panther', 'T''Challa', NULL, NULL , 'Agility', 'Pride', NULL, 203, 307, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Ant Man', 'Scott', 'Lang', 8 , 'Size Alteration', 'Magnifying Glass', NULL, 203, 306, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('War Machine', 'James', 'Rhodes', NULL , 'Cybernetics', 'Only Human', NULL, 203, 306, 402, 0, 'Alive');

INSERT INTO Teams (Name, EnemyTeamID, Motive) VALUES ('Guardians of the Galaxy', NULL, 'Good');
INSERT INTO Teams (Name, EnemyTeamID, Motive) VALUES ('Guardians of the Globe', NULL, 'Good');

UPDATE Teams SET LeaderID = 8, HQ = 304 WHERE TeamID = 203;

INSERT INTO Publishers (Name, Creator, DateEstablished, Status) VALUES ('Image Comics', 'Robert Kirkman', '06-March-1992', 'Active');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Star-Lord', 'James', 'Quill', NULL , 'Cybernetics', 'Emotions', NULL, 204, 309, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Gamora', 'Gamora', 'Whoberi', 18 , 'Agility', 'Sister', NULL, 204, 314, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Rocket Racoon', 'Rocket', 'Racoon', 18 , 'Expert Marksman', 'Dumpsters', NULL, 204, 316, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Groot', 'Groot', NULL, 18 , 'Vegetation', 'Fire', NULL, 204, 315, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Drax The Destroyer', 'Drax', NULL, 18 , 'Strength', 'Emotions', NULL, 204, 317, 402, 0, 'Alive');

INSERT INTO Heroes (Alias, FirstName, LastName, LeaderID, Power, Weakness, NemesisID, TeamID, LocationID, PublisherID, Cape, Status)
VALUES ('Nebula', 'Nebula', NULL, 18, 'Agility', 'Sister', NULL, 204, NULL, 402, 0, 'Alive');

INSERT INTO HEROES (ALIAS, FIRSTNAME, LASTNAME, LEADERID, POWER, WEAKNESS, NEMESISID, TEAMID, LOCATIONID, PUBLISHERID, CAPE, STATUS)
VALUES ('Invincible', 'Mark', 'Grayson', null, 'Strength', 'Inexperience', null, null, 325, 403, 1, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Mandarin', 'Eobard', '', 'Chi Manipulation', 'Rage', 8, NULL, 318, 402, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Red Skull', 'Johann', 'Shmidt', 'Trickery', 'Blinded by Power', 9, NULL, 319, 402, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Venom', 'Eddie', 'Brock', 'Symbiosis', 'Mental Instability', 10, NULL, 304, 402, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('The Leader', 'Samuel', 'Sterns', 'Intelligence', 'Arrogance', 11, NULL, 320, 402, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Loki', 'Loki', 'Laufeyson', 'Trickery', 'Physically Weak', 12, NULL, 313, 402, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Dormammu', 'Dormammu', NULL, 'Magic', 'Earth', 14, NULL, NULL, 402, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Killmonger', 'Erik', 'Killmonger', 'Agility', 'Poison', 15, NULL, 307, 402, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Yellowjacket', 'Darren', 'Cross', 'Size Alteration', 'Lack of Control', 16, NULL, 306, 402, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Advisor', NULL, NULL, 'Manipulation', 'Physically Weak', 17, NULL, 322, 402, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Ego', 'Ego', NULL, 'Magic', 'Emotions', 18, NULL, NULL, 402, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Thanos', 'Thanos', NULL, 'Strength', 'Arrogance', 19, NULL, 323, 402, 'Alive');

INSERT INTO Villians (Alias, FirstName, LastName, Power, Weakness, NemesisId, TeamID, LocationID, PublisherID, Status)
VALUES ('Ronan The Accuser', 'Ronan', NULL, 'Hammer', 'Ignorant', 20, NULL, 323, 402, 'Alive');

INSERT INTO Villians (ALIAS, FIRSTNAME, LASTNAME, POWER, WEAKNESS, NEMESISID, TEAMID, LOCATIONID, PUBLISHERID, STATUS)
VALUES ('Omni-Man', 'Nolan', 'Grayson', 'Strength', 'Son', 24, NULL, 325, 403, 'Alive');

UPDATE Heroes SET NemesisID = 106 WHERE HeroID = 8;
UPDATE Heroes SET NemesisID = 107 WHERE HeroID = 9;
UPDATE Heroes SET NemesisID = 108 WHERE HeroID = 10;
UPDATE Heroes SET NemesisID = 109 WHERE HeroID = 11;
UPDATE Heroes SET NemesisID = 110 WHERE HeroID = 12;
UPDATE Heroes SET NemesisID = 111 WHERE HeroID = 13;
UPDATE Heroes SET NemesisID = 112 WHERE HeroID = 14;
UPDATE Heroes SET NemesisID = 113 WHERE HeroID = 15;
UPDATE Heroes SET NemesisID = 114 WHERE HeroID = 16;
UPDATE Heroes SET NemesisID = 115 WHERE HeroID = 17;
UPDATE Heroes SET NemesisID = 116 WHERE HeroID = 18;
UPDATE Heroes SET NemesisID = 117 WHERE HeroID = 19;
UPDATE Heroes SET NemesisID = 118 WHERE HeroID = 24;
UPDATE Teams SET LeaderID = 18 WHERE teamid = 204;
UPDATE Teams SET LeaderID = 24 WHERE teamid = 205;

COMMIT;