create database if not exists db_formula;
use db_formula;

create table if not exists cars (
    id bigint unsigned not null auto_increment primary key,
    car_name varchar(128) not null,
    engine_id bigint unsigned not null,
    chassis_id bigint unsigned not null,
    team_id bigint unsigned not null
);

create table if not exists chassis_types (
    id bigint unsigned not null auto_increment primary key,
    height smallint unsigned not null,
    width smallint unsigned not null,
    length smallint unsigned not null,
    weight smallint unsigned not null
);

create table if not exists engine_models (
    id bigint unsigned not null auto_increment primary key,
    brand varchar(128) not null,
    power smallint unsigned not null,
    capacity int unsigned not null,
    cylinders smallint unsigned not null
);

create table if not exists drivers (
    id bigint unsigned not null auto_increment primary key,
    first_name varchar(64) not null,
    last_name varchar(64) not null,
    date_of_birth date not null,
    country varchar(128) not null,
    height smallint unsigned not null,
    weight smallint unsigned not null,
    team_id bigint unsigned not null
);

create table if not exists teams (
    id bigint unsigned not null auto_increment primary key,
    team_name varchar(128) not null,
    country varchar(128) not null,
    creation_year year not null
);

create table if not exists race_results (
    id bigint unsigned not null auto_increment primary key,
    race_id bigint unsigned not null,
    team_id bigint unsigned not null,
    place smallint unsigned,
    race_time time,
    driver_id bigint unsigned,
    car_id bigint unsigned
);

create table if not exists races (
    id bigint unsigned not null auto_increment primary key,
    race_name varchar(128) not null,
    country varchar(128) not null,
    race_date date not null,
    prize bigint unsigned not null
);

alter table race_results
	add constraint fk_race_results_teams
    foreign key(team_id)
    references teams(id);

alter table race_results
	add constraint fk_race_results_races
    foreign key(race_id)
    references races(id);

alter table race_results
	add constraint fk_race_results_drivers
    foreign key(driver_id)
    references drivers(id);

alter table race_results
	add constraint fk_race_results_cars
    foreign key(car_id)
    references cars(id);

alter table cars
	add constraint fk_cars_engine_models
    foreign key(engine_id)
    references engine_models(id);

alter table cars
	add constraint fk_cars_chassis
    foreign key(chassis_id)
    references chassis_types(id);

alter table cars
	add constraint fk_cars_teams
    foreign key(team_id)
    references teams(id);

alter table drivers
	add constraint fk_drivers_teams
    foreign key(team_id)
    references teams(id);