delimiter //

drop trigger if exists trigger_engine_models_before_delete;

create trigger trigger_engine_models_before_delete
	before delete on engine_models
	for each row
begin
	if exists(select * from cars where cars.engine_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this engine';
	end if;
end //

delimiter ;