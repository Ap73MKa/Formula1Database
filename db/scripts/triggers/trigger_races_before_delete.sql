delimiter //

drop trigger if exists trigger_races_before_delete;

create trigger trigger_races_before_delete
	before delete on races
	for each row
begin
	if exists(select * from race_results where race_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this race';
	end if;
end //

delimiter ;