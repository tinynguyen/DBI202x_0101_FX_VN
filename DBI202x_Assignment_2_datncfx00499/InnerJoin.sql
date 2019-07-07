select V.* from [Video] V
inner join [Comment] C on V.VideoId = C.VideoId;