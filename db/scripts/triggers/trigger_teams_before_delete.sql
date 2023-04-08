delimiter //

drop trigger if exists trigger_teams_before_delete;

create trigger trigger_teams_before_delete
	before delete on teams
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
end //

delimiter ;