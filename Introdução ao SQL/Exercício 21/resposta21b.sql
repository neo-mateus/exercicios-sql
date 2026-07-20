select M.member_num, M.name
from menber as M
where not exists ((select isbn
                    from book
                    where publisher = "LTC Editora")
                    except
					(select distinct isbn
					from borrowed
                    where borrowed.member_num = M.member_num));