insert into teams (team_name, country, creation_year) values 
	('Mercedes', 'Germany', 1954),
	('Red Bull Racing', 'Austria', 2005),
	('McLaren', 'United Kingdom', 1963),
	('Ferrari', 'Italy', 1950),
	('Alpine', 'France', 1977),
	('AlphaTauri', 'Italy', 2006),
	('Aston Martin', 'United Kingdom', 1954),
	('Williams', 'United Kingdom', 1977),
	('Haas F1 Team', 'United States', 2016),
	('Alfa Romeo Racing', 'Switzerland', 1993);

insert into drivers (first_name, last_name, date_of_birth, country, height, weight, team_id) values
	('Lewis', 'Hamilton', '1985-01-07', 'United Kingdom', 175, 68, 1),
	('Valtteri', 'Bottas', '1989-08-28', 'Finland', 179, 73, 2),
	('Max', 'Verstappen', '1997-09-30', 'Netherlands', 183, 73, 3),
	('Sergio', 'Perez', '1990-01-26', 'Mexico', 173, 64, 4),
	('Lando', 'Norris', '1999-11-13', 'United Kingdom', 170, 66, 5),
	('Daniel', 'Ricciardo', '1989-07-01', 'Australia', 178, 70, 6),
	('Charles', 'Leclerc', '1997-10-16', 'Monaco', 180, 68, 7),
	('Carlos', 'Sainz', '1994-09-01', 'Spain', 175, 68, 8),
	('Fernando', 'Alonso', '1981-07-29', 'Spain', 171, 68, 9),
	('Esteban', 'Ocon', '1996-09-17', 'France', 186, 73, 10);

insert into chassis_types (height, width, length, weight) values
	(800, 1800, 5000, 800),
	(900, 1750, 4500, 832),
	(700, 1950, 4400, 810),
	(920, 1800, 5200, 790),
	(890, 1950, 5100, 850),
	(860, 1900, 4300, 843),
	(900, 1850, 4350, 799),
	(890, 1950, 4450, 789),
	(880, 1850, 4550, 845),
	(820, 1750, 4650, 822);

insert into engine_models (brand, power, capacity, cylinders) values 
	('Mercedes', 900, 1600, 6),
	('Red Bull Racing', 870, 1600, 6),
	('McLaren', 920, 1600, 6),
	('Ferrari', 930, 1600, 6),
	('Alpine', 922, 1600, 6),
	('AlphaTauri', 940, 1600, 6),
	('Aston Martin', 905, 1600, 6),
	('Williams', 922, 1600, 6),
	('Alfa Romeo', 927, 1600, 6),
	('Haas', 939, 1600, 6);

insert into cars (car_name, engine_id, chassis_id, team_id) values
	('Mercedes AMG F1 W12 E Performance', 1, 1, 1),
	('Red Bull Racing RB16B', 2, 2, 2),
	('McLaren MCL35M', 3, 3, 3),
	('Ferrari SF21', 4, 4, 4),
	('Alpine A521', 5, 5, 5),
	('AlphaTauri AT02', 6, 6, 6),
	('Aston Martin AMR21', 7, 7, 7),
	('Williams FW43B', 8, 8, 8),
	('Alfa Romeo Racing C41', 9, 9, 9),
	('Haas VF-21', 10, 10, 10);

insert into races (race_name, country, race_date, prize) values
	('Grand Prix of Monaco', 'Monaco', '2023-05-28', 500000),
	('Azerbaijan Grand Prix', 'Azerbaijan', '2023-06-04', 750000),
	('Canadian Grand Prix', 'Canada', '2023-06-11', 1000000),
	('French Grand Prix', 'France', '2023-06-25', 1500000),
	('Austrian Grand Prix', 'Austria', '2023-07-09', 2000000),
	('British Grand Prix', 'United Kingdom', '2023-07-16', 2500000),
	('Hungarian Grand Prix', 'Hungary', '2023-07-30', 3000000),
	('Belgian Grand Prix', 'Belgium', '2023-08-27', 3500000),
	('Italian Grand Prix', 'Italy', '2023-09-03', 4000000),
	('Russian Grand Prix', 'Russia', '2023-09-10', 4500000);

insert into race_results (race_id, team_id, place, race_time, driver_id, car_id) values
	(1, 1, 1, '01:23:45.678', 1, 1),
	(1, 2, 2, '01:24:34.567', 2, 2),
	(1, 3, 3, '01:25:12.345', 3, 3),
	(1, 4, 4, '01:25:43.210', 4, 4),
	(1, 5, 5, '01:25:58.765', 5, 5),
	(1, 6, 6, '01:26:21.345', 6, 6),
	(2, 1, 1, '01:23:45.678', 1, 1),
	(2, 2, 2, '01:24:34.567', 2, 2),
	(2, 3, 3, '01:25:12.345', 3, 3),
	(2, 4, 4, '01:26:54.321', 4, 4),
	(2, 5, 5, '01:27:12.345', 5, 5),
	(2, 6, 6, '01:27:45.678', 6, 6),
	(2, 7, 7, '01:28:34.567', 7, 7);