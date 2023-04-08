delimiter //

drop trigger if exists trigger_drivers_before_delete;

create trigger trigger_drivers_before_delete
	before delete on drivers
	for each row
begin
	if exists(select * from race_results where race_results.driver_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this driver';
	end if;
end //

delimiter ;