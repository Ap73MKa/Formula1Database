INSERT INTO CHASSIS (HEIGHT, WIDTH, LENGTH) VALUES
    (2.00, 1.50, 3.50),
    (1.80, 1.60, 3.60),
    (2.10, 1.70, 3.40),
    (1.70, 1.80, 3.30),
    (2.00, 1.60, 3.20),
    (1.90, 1.50, 3.70),
    (1.80, 1.70, 3.50),
    (2.20, 1.80, 3.30),
    (2.10, 1.60, 3.60),
    (1.70, 1.90, 3.20);

INSERT INTO ENGINES (BRAND, POWER, CAPACITY, CYLINDERS) VALUES
    ('Mercedes', 900, 1600, 6),
    ('Ferrari', 950, 1600, 6),
    ('Red Bull Racing', 1000, 1600, 6),
    ('McLaren', 900, 1600, 6),
    ('Alfa Romeo', 850, 1600, 6),
    ('Aston Martin', 950, 1600, 6),
    ('AlphaTauri', 850, 1600, 6),
    ('Williams', 850, 1600, 6),
    ('Haas', 850, 1600, 6),
    ('Sauber', 850, 1600, 6);

INSERT INTO CARS (NAME, ENGINE_ID, CHASSIS_ID) VALUES
    ('Ferrari SF90', 2, 1),
    ('Mercedes-AMG F1 W10 EQ Power+', 1, 2),
    ('Red Bull Racing RB15', 3, 3),
    ('McLaren MCL34', 4, 4),
    ('Renault RS19', 5, 5),
    ('Alfa Romeo Racing C38', 5, 6),
    ('Racing Point RP19', 7, 7),
    ('Scuderia Toro Rosso STR14', 10, 8),
    ('Haas VF-19', 9, 9),
    ('Williams FW42', 8, 10);

INSERT INTO TEAMS (NAME, COUNTRY, CREATE_DATE, CAR_ID) VALUES
    ('Mercedes', 'Germany', '1970-01-01', 1),
    ('Ferrari', 'Italy', '1970-01-01', 2),
    ('Red Bull Racing', 'Austria', '2005-01-01', 3),
    ('McLaren', 'United Kingdom', '1966-01-01', 4),
    ('Renault', 'France', '1977-01-01', 5),
    ('Alfa Romeo Racing', 'Switzerland', '2019-01-01', 6),
    ('Racing Point', 'United Kingdom', '2019-01-01', 7),
    ('Scuderia Toro Rosso', 'Italy', '2006-01-01', 8),
    ('Haas F1 Team', 'United States', '2016-01-01', 9),
    ('Williams', 'United Kingdom', '1977-01-01', 10);

INSERT INTO PILOTS (FIRST_NAME, SECOND_NAME, BIRTH_DATE, COUNTRY, HEIGHT, WEIGHT, TEAM_ID) VALUES
    ('Lewis', 'Hamilton', '1985-01-07', 'United Kingdom', 174, 68, 1),
    ('Valtteri', 'Bottas', '1989-08-28', 'Finland', 173, 69, 2),
    ('Max', 'Verstappen', '1997-09-30', 'Netherlands', 180, 74, 3),
    ('Pierre', 'Gasly', '1996-02-07', 'France', 177, 68, 4),
    ('Daniel', 'Ricciardo', '1989-07-01', 'Australia', 178, 70, 5),
    ('Kimi', 'Räikkönen', '1979-10-17', 'Finland', 175, 67, 6),
    ('Sergio', 'Perez', '1990-01-26', 'Mexico', 173, 63, 7),
    ('Daniil', 'Kvyat', '1994-04-26', 'Russia', 180, 70, 8),
    ('Kevin', 'Magnussen', '1992-10-05', 'Denmark', 182, 74, 9),
    ('George', 'Russell', '1998-02-15', 'United Kingdom', 182, 70, 10);

INSERT INTO CHAMPIONSHIPS (NAME, COUNTRY, EVENT_DATE, PRIZE) VALUES
     ('2023 Formula One World Championship', 'Australia', '2023-03-26', 20000000),
     ('2023 United States Grand Prix', 'United States', '2023-04-09', 1000000),
     ('2023 Chinese Grand Prix', 'China', '2023-04-23', 1500000),
     ('2023 Spanish Grand Prix', 'Spain', '2023-05-07', 2500000),
     ('2023 Monaco Grand Prix', 'Monaco', '2023-05-28', 5000000),
     ('2023 Azerbaijan Grand Prix', 'Azerbaijan', '2023-06-11', 1250000),
     ('2023 Canadian Grand Prix', 'Canada', '2023-06-25', 2000000),
     ('2023 British Grand Prix', 'United Kingdom', '2023-07-09', 3000000),
     ('2022 United States Grand Prix', 'United States', '2022-07-23', 1750000),
     ('2023 Hungarian Grand Prix', 'Hungary', '2023-08-06', 2250000);

INSERT INTO CHAMPIONSHIPS_TEAMS (CHAMPIONSHIP_ID, TEAM_ID, PLACE) VALUES
    (1, 1, 1),
    (1, 2, 2),
    (1, 3, 3),
    (2, 4, 1),
    (2, 5, 2),
    (2, 6, 3),
    (3, 7, 1),
    (3, 8, 2),
    (3, 9, 3),
    (4, 10, 1),
    (4, 1, 2),
    (4, 2, 3);