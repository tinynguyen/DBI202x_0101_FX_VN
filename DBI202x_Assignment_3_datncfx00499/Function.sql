-- Tạo 1 function nhận tham số truyền vào là ChannelId, trả về tổng số subscribe của một Channel
create function SF_TotalSubscribe(@ChannelId int)
    returns table as
        return
        -- đếm toàn bộ các subscriber trong bảng subscribe của một channel thông qua ChannelId
        select count(*) 'Total Subscribes'
        from Subscribe S
        where ChannelId = @ChannelId
go

-- Định nghĩa biến ChannelId
declare @ChannelId int
-- Gán giá trị vào biến ChannelId từ bảng Channel với Username là 'taylor-swift'
select @ChannelId = ChannelId from Channel where Username = 'taylor-swift'
select * from SF_TotalSubscribe(@ChannelId)
go

