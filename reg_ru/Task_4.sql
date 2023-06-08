select d.dname
from domains d 
join users u
on u.user_id = d.user_id
where u.name like '%Иван Иванов%'
