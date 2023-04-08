delimiter //

drop procedure if exists update_race_result_of_team;

create procedure update_race_result_of_team(
	in in_race_id bigint unsigned,
    in in_team_id bigint unsigned,
    in in_place smallint unsigned,
    in in_race_time time,
    in in_driver_id bigint unsigned)
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
end //

delimiter ;