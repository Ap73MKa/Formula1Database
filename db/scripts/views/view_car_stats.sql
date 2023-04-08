create or replace view view_car_stats as
select
    c.car_name as car_name,
    e.power as engine_power,
    e.capacity as engine_capacity,
    ct.weight as car_weight,
    concat(ct.height, ' x ', ct.width, ' x ', ct.length) as chassis_size
from cars c
    join engine_models e ON c.ENGINE_ID = e.ID
    join chassis_types ct on c.chassis_id = ct.id;