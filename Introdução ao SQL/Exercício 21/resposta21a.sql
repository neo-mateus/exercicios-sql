select member_num, name
from member as M
where  member_num in (select member_num
					from borrowed, book
                    where borrowed.isbn = book.isbn
						and book.publisher = "LTC Editora");