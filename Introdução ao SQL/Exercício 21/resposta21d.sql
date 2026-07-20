with num_books(member_num, count_book) as (
select member_num, count(isbn)
from borrowed
group by member_num),

not_borrowed(member_num) as (
select member_num
from menber
where member_num not in (select member_num
						from borrowed)
)

select (select sum(count_book) from num_books)/
	((select count(*) from not_borrowed) + 
    (select count(member_num) from num_books))
 as media;