with client_12345(ID,client_city) as (
	select ID,client_city
    from client
    where ID = 12345
)
select C.client_name
from client as C, client_12345
where C.client_city = client_12345.client_city;