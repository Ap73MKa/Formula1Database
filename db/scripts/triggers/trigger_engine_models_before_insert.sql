delimiter //

drop trigger if exists trigger_engine_models_before_insert;

create trigger trigger_engine_models_before_insert
	before insert on engine_models
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
end //

delimiter ;