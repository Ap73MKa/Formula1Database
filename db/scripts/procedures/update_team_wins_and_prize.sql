drop procedure if exists update_teams_wins_and_prize;

create procedure update_teams_wins_and_prize()
begin
  declare done boolean default false;
  declare in_team_id int;

  declare cur_teams cursor for
    select distinct race_results.team_id
    from race_results
    where race_results.place <= 3;

  declare continue handler for not found
    set done = true;

  open cur_teams;

  loop_teams: loop
    fetch cur_teams into in_team_id;

    if done then
      leave loop_teams;
    end if;

    update teams
    set wins = count_wins_by_team(in_team_id),
        total_prize = count_total_prize_team(in_team_id)
    where teams.id = in_team_id;

  end loop;

  close cur_teams;
end;