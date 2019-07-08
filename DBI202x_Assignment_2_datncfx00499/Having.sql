select [Title], count(CommentId) as 'Total Comments'
from Comment C
         full outer join Video V on C.VideoId = V.VideoId
group by [Title]
having count(CommentId) > 0
order by [Total Comments] desc;