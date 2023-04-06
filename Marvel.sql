CREATE TABLE hero (
    hero_id INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    alias VARCHAR(40),
    birth_year YEAR,
    sex VARCHAR(1),
    hero_status VARCHAR(8) DEFAULT('Unknown'),
    leader_id INT,
    team_id INT
);
INSERT INTO
    hero
VALUES(
        100,
        'Tony',
        'Stark',
        'Iron Man',
        '1967',
        'M',
        'Deceased',
        NULL,
        1
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Steve',
        'Rogers',
        'Captain America',
        '1923',
        'M',
        'Deceased',
        100,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Thor',
        'Odinson',
        'Thor',
        '1983',
        'M',
        'Alive',
        100,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Bruce',
        'Banner',
        'Hulk',
        '1967',
        'M',
        'Alive',
        100,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Natasha',
        'Romanoff',
        'Black Widow',
        '1984',
        'M',
        'Alive',
        100,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Clinton',
        'Barton',
        'Hawkeye',
        '1971',
        'M',
        'Alive',
        100,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'TChalla',
        '',
        'Black Panther',
        '1976',
        'M',
        'Alive',
        107,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Stephen',
        'Strange',
        'Dr. Strange',
        '1968',
        'M',
        'Alive',
        NULL,
        2
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Peter',
        'Parker',
        'Spider-Man',
        '2000',
        'M',
        'Alive',
        107,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Scott',
        'Lang',
        'Ant-Man',
        '1975',
        'M',
        'Alive',
        107,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'James',
        'Rhodes',
        'War Machine',
        '1972',
        'M',
        'Alive',
        107,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Bucky',
        'Barnes',
        'Winter Soldier',
        '1922',
        'M',
        'Alive',
        107,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Benedict',
        'Wong',
        'Wong',
        '1978',
        'M',
        'Alive',
        107,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Sam',
        'Wilson',
        'Falcon',
        '1985',
        'M',
        'Alive',
        107,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Peter',
        'Quill',
        'Star-Lord',
        '1984',
        'M',
        'Alive',
        NULL,
        3
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Rocket',
        'Racoon',
        'Rocket',
        '2008',
        'M',
        'Alive',
        114,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Drax',
        '',
        'Drax',
        '1974',
        'M',
        'Alive',
        114,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Gamora',
        '',
        'Gamora',
        '1990',
        'M',
        'Deceased',
        114,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Nebula',
        '',
        'Nebula',
        '1988',
        'M',
        'Alive',
        114,
        NULL
    );
INSERT INTO
    hero
VALUES(
        NULL,
        'Groot',
        '',
        'Groot',
        '2014',
        'M',
        'Alive',
        114,
        NULL
    );
UPDATE
    hero
SET
    team_id = 1
WHERE
    leader_id = 100;
UPDATE
    hero
SET
    team_id = 2
WHERE
    leader_id = 107;
UPDATE
    hero
SET
    team_id = 3
WHERE
    leader_id = 114;--------------------------------------------------------
    CREATE TABLE team (
        team_id INT PRIMARY KEY,
        team_name VARCHAR(40),
        leader_id INT,
        start_year YEAR,
        FOREIGN KEY(leader_id) REFERENCES hero (hero_id) ON DELETE
        SET
            NULL
    );
INSERT INTO
    team
VALUES(1, 'Original Avengers', 100, '2010');
INSERT INTO
    team
VALUES(2, 'New Avengers', 107, '2019');
INSERT INTO
    team
VALUES(3, 'Guardians of the Galaxy', 114, '2014');-----------------------------------------------------------
ALTER TABLE
    hero
ADD
    FOREIGN KEY(team_id) REFERENCES team(team_id) ON DELETE
SET
    NULL;
ALTER TABLE
    hero
ADD
    FOREIGN KEY(leader_id) REFERENCES hero (hero_id) ON DELETE
SET
    NULL;--------------------------------------------------------
    CREATE TABLE base (
        base_id INT UNIQUE PRIMARY KEY,
        base_name VARCHAR(40) UNIQUE,
        team_id INT,
        FOREIGN KEY(team_id) REFERENCES team(team_id) ON DELETE
        SET
            NULL
    );
INSERT INTO
    base
VALUES(400, 'New York City', 1);
INSERT INTO
    base
VALUES(401, 'Earth', 2);
INSERT INTO
    base
VALUES(402, 'The Galaxy', 3);
INSERT INTO
    base
VALUES(403, 'The Universe', 2);--------------------------------------------------------
    CREATE TABLE baddies_beaten (
        hero_id INT,
        base_id INT,
        total_baddies_beaten INT
    );
INSERT INTO
    baddies_beaten
VALUES(100, '401', '0');
INSERT INTO
    baddies_beaten
VALUES(101, '401', '0');
INSERT INTO
    baddies_beaten
VALUES(102, '401', '0');
INSERT INTO
    baddies_beaten
VALUES(103, '401', '0');
INSERT INTO
    baddies_beaten
VALUES(104, '401', '0');
INSERT INTO
    baddies_beaten
VALUES(105, '401', '0');
INSERT INTO
    baddies_beaten
VALUES(106, '402', '0');
INSERT INTO
    baddies_beaten
VALUES(107, '402', '0');
INSERT INTO
    baddies_beaten
VALUES(108, '402', '0');
INSERT INTO
    baddies_beaten
VALUES(109, '402', '0');
INSERT INTO
    baddies_beaten
VALUES(110, '402', '0');
INSERT INTO
    baddies_beaten
VALUES(111, '402', '0');
INSERT INTO
    baddies_beaten
VALUES(112, '402', '0');
INSERT INTO
    baddies_beaten
VALUES(113, '402', '0');
INSERT INTO
    baddies_beaten
VALUES(114, '403', '0');
INSERT INTO
    baddies_beaten
VALUES(115, '403', '0');
INSERT INTO
    baddies_beaten
VALUES(116, '403', '0');
INSERT INTO
    baddies_beaten
VALUES(117, '403', '0');
INSERT INTO
    baddies_beaten
VALUES(118, '403', '0');
INSERT INTO
    baddies_beaten
VALUES(119, '403', '0');
UPDATE
    baddies_beaten
SET
    total_baddies_beaten = RAND() *(100000 -10000) + 10000
WHERE
    total_baddies_beaten = '0';--------------------------------------------------------
    CREATE TABLE villian (
        villian_id INT,
        villian_name VARCHAR(40),
        team_id INt,
        villian_status VARCHAR(10),
        PRIMARY KEY(team_id, villian_name),
        FOREIGN KEY(team_id) REFERENCES team(team_id) ON DELETE CASCADE
    );
INSERT INTO
    villian
VALUES(200, 'Loki', '1', NULL);
INSERT INTO
    villian
VALUES(201, 'Ultron', '1', NULL);
INSERT INTO
    villian
VALUES(202, 'Ronan', '3', NULL);
INSERT INTO
    villian
VALUES(203, 'Zemo', '1', NULL);
INSERT INTO
    villian
VALUES(204, 'Corvus', '2', NULL);
INSERT INTO
    villian
VALUES(205, 'Ebony Maw', '2', NULL);
INSERT INTO
    villian
VALUES(206, 'Cull Obsidian', '2', NULL);
INSERT INTO
    villian
VALUES(207, 'Ego', '3', NULL);
INSERT INTO
    villian
VALUES(208, 'Thanos', '2', NULL);
UPDATE
    villian
SET
    villian_status = 'Deceased'
WHERE
    team_id > 0;--------------------------------------------------------
SELECT
    *
FROM
    hero;
SELECT
    *
FROM
    team;
SELECT
    *
FROM
    base;
SELECT
    *
FROM
    baddies_beaten;
SELECT
    *
FROM
    villian;