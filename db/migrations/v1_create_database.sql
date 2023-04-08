create table chassis_types
(
    id     bigint unsigned auto_increment
        primary key,
    height smallint unsigned not null,
    width  smallint unsigned not null,
    length smallint unsigned not null,
    weight smallint unsigned not null
);

create definer = root@`%` trigger trigger_chassis_types_before_delete
    before delete
    on chassis_types
    for each row
begin
	if exists(select * from cars where chassis_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this chassis';
	end if;
end;

create definer = root@`%` trigger trigger_chassis_types_before_insert
    before insert
    on chassis_types
    for each row
begin
    if new.length > 5500 then
        signal sqlstate '45000'
        set message_text = 'Maximum chassis length should not exceed 5500';
    end if;
    
    if new.width > 2000 then
        signal sqlstate '45000'
        set message_text = 'Maximum chassis width should not exceed 2000';
    end if;
    
    if new.height > 950 then
        signal sqlstate '45000'
        set message_text = 'Maximum chassis height should not exceed 950';
    end if;
    
    if new.weight < 752 then
        signal sqlstate '45000'
        set message_text = 'Minimum weight should be 752';
    end if;
end;

create table engine_models
(
    id        bigint unsigned auto_increment
        primary key,
    brand     varchar(128)      not null,
    power     smallint unsigned not null,
    capacity  int unsigned      not null,
    cylinders smallint unsigned not null
);

create definer = root@`%` trigger trigger_engine_models_before_delete
    before delete
    on engine_models
    for each row
begin
	if exists(select * from cars where cars.engine_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this engine';
	end if;
end;

create definer = root@`%` trigger trigger_engine_models_before_insert
    before insert
    on engine_models
    for each row
begin
	if new.power > 950 then
        signal sqlstate '45000'
        set message_text = 'Maximum engine power should not exceed 950';
    end if;
    
    if new.capacity > 1600 then
        signal sqlstate '45000'
        set message_text = 'Maximum engine capacity should not exceed 1600';
    end if;
    
    if new.cylinders > 6 then
        signal sqlstate '45000'
        set message_text = 'Maximum engine cylinder count should not exceed 6';
    end if;
end;

create table races
(
    id        bigint unsigned auto_increment
        primary key,
    race_name varchar(128)    not null,
    country   varchar(128)    not null,
    race_date date            not null,
    prize     bigint unsigned not null
);

create definer = root@`%` trigger trigger_races_before_delete
    before delete
    on races
    for each row
begin
	if exists(select * from race_results where race_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this race';
	end if;
end;

create table teams
(
    id            bigint unsigned auto_increment
        primary key,
    team_name     varchar(128)                  not null,
    country       varchar(128)                  not null,
    creation_year year                          not null,
    wins          smallint unsigned default '0' null,
    total_prize   int unsigned      default '0' null
);

create table cars
(
    id         bigint unsigned auto_increment
        primary key,
    car_name   varchar(128)    not null,
    engine_id  bigint unsigned not null,
    chassis_id bigint unsigned not null,
    team_id    bigint unsigned not null,
    constraint fk_cars_chassis
        foreign key (chassis_id) references chassis_types (id),
    constraint fk_cars_engine_models
        foreign key (engine_id) references engine_models (id),
    constraint fk_cars_teams
        foreign key (team_id) references teams (id)
);

create definer = root@`%` trigger trigger_cars_before_delete
    before delete
    on cars
    for each row
begin
	if exists(select * from race_results where car_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this car';
	end if;
end;

create definer = root@`%` trigger trigger_cars_before_insert
    before insert
    on cars
    for each row
begin
	if exists(select * from cars where team_id = new.team_id) then
		signal sqlstate '45000' set message_text = 'The team already has a car';
	end if;
end;

create table drivers
(
    id            bigint unsigned auto_increment
        primary key,
    first_name    varchar(64)       not null,
    last_name     varchar(64)       not null,
    date_of_birth date              not null,
    country       varchar(128)      not null,
    height        smallint unsigned not null,
    weight        smallint unsigned not null,
    team_id       bigint unsigned   not null,
    constraint fk_drivers_teams
        foreign key (team_id) references teams (id)
);

create definer = root@`%` trigger trigger_drivers_before_delete
    before delete
    on drivers
    for each row
begin
	if exists(select * from race_results where race_results.driver_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this driver';
	end if;
end;

create table race_results
(
    id        bigint unsigned auto_increment
        primary key,
    race_id   bigint unsigned   not null,
    team_id   bigint unsigned   not null,
    place     smallint unsigned null,
    race_time time              null,
    driver_id bigint unsigned   null,
    car_id    bigint unsigned   null,
    constraint fk_race_results_cars
        foreign key (car_id) references cars (id),
    constraint fk_race_results_drivers
        foreign key (driver_id) references drivers (id),
    constraint fk_race_results_races
        foreign key (race_id) references races (id),
    constraint fk_race_results_teams
        foreign key (team_id) references teams (id)
);

create definer = root@`%` trigger trigger_teams_before_delete
    before delete
    on teams
    for each row
begin
	if exists(select * from race_results where race_results.team_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this team';
	end if;

	if exists(select * from drivers where drivers.team_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this team';
	end if;

	if exists(select * from cars where cars.team_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this team';
	end if;
end;

create definer = root@`%` trigger update_creation_year
    after update
    on teams
    for each row
begin
    if new.team_name != old.team_name or new.country != old.country then
        update teams set creation_year = year(curdate()) where id = new.id;
    end if;
end;

create definer = root@`%` view view_car_stats as
select `c`.`car_name`                                                   AS `car_name`,
       `e`.`power`                                                      AS `engine_power`,
       `e`.`capacity`                                                   AS `engine_capacity`,
       `ct`.`weight`                                                    AS `car_weight`,
       concat(`ct`.`height`, ' x ', `ct`.`width`, ' x ', `ct`.`length`) AS `chassis_size`
from ((`db_formula`.`cars` `c` join `db_formula`.`engine_models` `e`
       on ((`c`.`engine_id` = `e`.`id`))) join `db_formula`.`chassis_types` `ct` on ((`c`.`chassis_id` = `ct`.`id`)));

create definer = root@`%` view view_race_results as
select `r`.`race_name`                                AS `race_name`,
       `t`.`team_name`                                AS `team_name`,
       concat(`d`.`first_name`, ' ', `d`.`last_name`) AS `driver_name`,
       `c`.`car_name`                                 AS `car_name`,
       `rr`.`place`                                   AS `place`,
       `rr`.`race_time`                               AS `race_time`
from ((((`db_formula`.`race_results` `rr` join `db_formula`.`races` `r`
         on ((`rr`.`race_id` = `r`.`id`))) join `db_formula`.`teams` `t`
        on ((`rr`.`team_id` = `t`.`id`))) join `db_formula`.`drivers` `d`
       on ((`rr`.`team_id` = `d`.`team_id`))) join `db_formula`.`cars` `c` on ((`rr`.`team_id` = `c`.`team_id`)))
order by `rr`.`race_id`, `rr`.`place`;

create
    definer = root@`%` function count_total_prize_team(in_team_id bigint unsigned) returns int unsigned
    deterministic
    reads sql data
begin
    declare total_prize int unsigned;
    select sum(
        case
          when race_results.place = 1 then races.prize * 0.55
          when race_results.place = 2 then races.prize * 0.3
          when race_results.place = 3 then races.prize * 0.15
        end
      ) into total_prize
      from race_results
      join races on races.id = race_results.race_id
      where race_results.team_id = in_team_id and
            race_results.place <= 3;
    return total_prize;
end;

create
    definer = root@`%` function count_wins_by_team(team_id bigint unsigned) returns smallint unsigned
    deterministic
    reads sql data
begin
    declare wins_count int unsigned;
    select count(*) into wins_count from race_results
        where race_results.team_id = team_id and
              race_results.place <= 3;
    return wins_count;
end;

create
    definer = root@`%` procedure get_top_three_teams_in_race(IN in_race_id bigint unsigned)
begin
    select * from race_results
        where race_id = in_race_id and place <= 3
        order by place;
end;

create
    definer = root@`%` procedure insert_participant(IN in_race_id bigint unsigned, IN in_team_id bigint unsigned)
begin
	if exists(select * from race_results where race_id = in_race_id and team_id = in_team_id) then
		signal sqlstate '45000' set message_text = 'Result is already stated';
	end if;
    
    insert into race_results (race_id, team_id, place, race_time, driver_id, car_id)
    values (in_race_id, in_team_id, null, null, null, null);
end;

create
    definer = root@`%` procedure update_race_result_of_team(IN in_race_id bigint unsigned,
                                                            IN in_team_id bigint unsigned,
                                                            IN in_place smallint unsigned, IN in_race_time time,
                                                            IN in_driver_id bigint unsigned)
begin
    declare car_id bigint unsigned;

    if not exists(select * from drivers where id = in_driver_id and team_id = in_team_id) then
        signal sqlstate '45000' set message_text = 'Driver is not a member of the team';
    end if;

    select id into car_id from cars where team_id = in_team_id limit 1;
    if car_id is null then
        signal sqlstate '45000' set message_text = 'Car is not found for the team';
    end if;

    update race_results
    set
        place = in_place,
        race_time = in_race_time,
        driver_id = in_driver_id, 
        car_id = car_id
    where
        race_id = in_race_id and
        team_id = in_team_id;
end;

create
    definer = root@`%` procedure update_teams_wins_and_prize()
begin
  declare done boolean default false;
  declare in_team_id int;

  declare cur_teams cursor for
    select distinct race_results.team_id
    from race_results
    where race_results.place <= 3;

  declare continue handler for not found
    set done = true;

  open cur_teams;

  loop_teams: loop
    fetch cur_teams into in_team_id;

    if done then
      leave loop_teams;
    end if;

    update teams
    set wins = count_wins_by_team(in_team_id),
        total_prize = count_total_prize_team(in_team_id)
    where teams.id = in_team_id;

  end loop;

  close cur_teams;
end;


