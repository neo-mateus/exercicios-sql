with borrow_LTC(member_num, isbn) as (
	select member_num, borrowed.isbn
    from borrowed, book
    where borrowed.isbn = book.isbn
		and book.publisher = "LTC EDITORA"
)
select menber.member_num, name
from menber, borrow_LTC
where menber.member_num = borrow_LTC.member_num
group by menber.member_num, name
having count(*)>5;