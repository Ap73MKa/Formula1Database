drop function if exists count_total_prize_team;

create function count_total_prize_team(
    in_team_id bigint unsigned)
    returns int unsigned
    deterministic
    reads sql data
begin
    declare total_prize int unsigned;
    select sum(
        case
          when race_results.place = 1 then races.prize * 0.55
          when race_results.place = 2 then races.prize * 0.3
          when race_results.place = 3 then races.prize * 0.15
        end
      ) into total_prize
      from race_results
      join races on races.id = race_results.race_id
      where race_results.team_id = in_team_id and
            race_results.place <= 3;
    return total_prize;
end;
