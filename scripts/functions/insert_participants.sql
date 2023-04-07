delimiter //

create procedure insert_participant (
	in in_race_id bigint unsigned,
    in in_team_id bigint unsigned)
begin
	-- Проверка на существовании такой записи
	if exists(select * from race_results where race_id = in_race_id and team_id = in_team_id) then
		signal sqlstate '45000' set message_text = 'Result is already stated';
	end if;
    
    insert into race_results (race_id, team_id, place, race_time, driver_id, car_id)
    values (in_race_id, in_team_id, null, null, null, null);
end //

delimiter ;