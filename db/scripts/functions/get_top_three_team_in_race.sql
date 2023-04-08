drop procedure if exists  get_top_three_teams_in_race;

create procedure get_top_three_teams_in_race(
    in_race_id bigint unsigned)
begin
    select * from race_results
        where race_id = in_race_id and place <= 3
        order by place;
end;
