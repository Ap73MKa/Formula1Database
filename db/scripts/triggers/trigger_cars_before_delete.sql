delimiter //

drop trigger if exists trigger_cars_before_delete;

create trigger trigger_cars_before_delete
	before delete on cars
	for each row
begin
	if exists(select * from race_results where car_id = old.id) then
		signal sqlstate '45000' set message_text = 'It is impossible to delete, since there are records with this car';
	end if;
end //

delimiter ;