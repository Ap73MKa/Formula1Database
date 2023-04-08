delimiter //

drop trigger if exists trigger_cars_before_insert;

create trigger trigger_cars_before_insert
	before insert on cars
	for each row
begin
	if exists(select * from cars where team_id = new.team_id) then
		signal sqlstate '45000' set message_text = 'The team already has a car';
	end if;
end //

delimiter ;