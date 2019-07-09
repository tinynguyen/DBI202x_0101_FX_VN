create function SF_TotalSubscribe(@ChannelId int)
    returns table as
        return
        select count(*) 'Total Subscribes'
        from Subscribe S
        where ChannelId = @ChannelId
go

declare @a int
select @a = ChannelId from Channel where Username = 'taylor_swift'
select * from SF_TotalSubscribe(@a)
go

