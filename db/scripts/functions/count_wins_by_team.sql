drop function if exists count_wins_by_team;

create function count_wins_by_team(
    team_id bigint unsigned)
    returns smallint unsigned
    deterministic
    reads sql data
begin
    declare wins_count int unsigned;
    select count(*) into wins_count from race_results
        where race_results.team_id = team_id and
              race_results.place <= 3;
    return wins_count;
end;
