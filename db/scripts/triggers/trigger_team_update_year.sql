delimiter //

drop trigger if exists update_creation_year;

create trigger update_creation_year
    after update on teams
    for each row
begin
    if new.team_name != old.team_name or new.country != old.country then
        update teams set creation_year = year(curdate()) where id = new.id;
    end if;
end //

delimiter ;
