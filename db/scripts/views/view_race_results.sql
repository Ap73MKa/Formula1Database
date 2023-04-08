create or replace view view_race_results as
select
    r.race_name as race_name,
    t.team_name as team_name,
    concat(d.first_name, ' ', d.last_name) as driver_name,
    c.car_name as car_name,
    rr.place as place,
    rr.race_time as race_time
from race_results as rr
    join races r on rr.race_id = r.id
    join teams t on rr.team_id = t.id
    join drivers d on rr.team_id = d.team_id
    join cars c on rr.team_id = c.team_id
order by rr.race_id, rr.place;