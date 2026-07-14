with manager(ID, name, street, city) as (
	select ID, employed_name, street, city
    from employed
    where ID in (select ID
				from manage)
)
(select employed.ID, employed.employed_name
from employed, manager
where employed.street = manager.street
	and employed.city = manager.city)
except
(select ID, name
from manager);