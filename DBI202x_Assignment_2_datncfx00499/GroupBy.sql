select A.Username, count(Subscribed) as 'Total Subscribe Channel'
from [Account] A
         left join Subscribe S on A.Username = S.Username
         left join Channel C on S.ChannelId = C.ChannelId
group by A.Username
order by [Total Subscribe Channel] desc;