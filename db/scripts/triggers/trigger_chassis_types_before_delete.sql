delimiter //

drop trigger if exists trigger_chassis_types_before_delete;

create trigger trigger_chassis_types_before_delete
	before delete on chassis_types
	for each row
begin
	if exists(select * from cars where chassis_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this chassis';
	end if;
end //

delimiter ;