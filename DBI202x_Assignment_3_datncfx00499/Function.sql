create function SF_TotalSubscribe(@ChannelId int)
    returns table as
        return
        select count(*) 'Total Subscribes'
        from Subscribe S
        where ChannelId = @ChannelId
go

declare @ChannelId int
select @ChannelId = ChannelId from Channel where Username = 'taylor-swift'
select * from SF_TotalSubscribe(@ChannelId)
go

