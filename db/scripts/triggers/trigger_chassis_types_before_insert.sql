delimiter //

drop trigger if exists trigger_chassis_types_before_insert;

create trigger trigger_chassis_types_before_insert
	before insert on chassis_types
	for each row
begin
    if new.length > 5500 then
        signal sqlstate '45000'
        set message_text = 'Maximum chassis length should not exceed 5500';
    end if;
    
    if new.width > 2000 then
        signal sqlstate '45000'
        set message_text = 'Maximum chassis width should not exceed 2000';
    end if;
    
    if new.height > 950 then
        signal sqlstate '45000'
        set message_text = 'Maximum chassis height should not exceed 950';
    end if;
    
    if new.weight < 752 then
        signal sqlstate '45000'
        set message_text = 'Minimum weight should be 752';
    end if;
end //

delimiter ;