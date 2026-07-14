select count(sinister_num) as number_accident
from participed, person, have
where have.vin = participed.vin
    and have.driver_id = person.driver_id
    and person.name = "John Smith";