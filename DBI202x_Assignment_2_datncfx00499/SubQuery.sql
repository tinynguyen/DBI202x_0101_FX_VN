select *
from Video V
where V.VideoId in (select C.VideoId from Comment C)
