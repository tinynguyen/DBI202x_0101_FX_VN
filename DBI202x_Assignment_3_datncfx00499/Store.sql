-- Tạo 1 store procedure nhận vào một tham số là ChannelId
-- SP có chức năng trả ra 10 videos với các thông tin như Title, Description, Date_Upload, Total of Comments
-- Mục đích để khi người dùng vào trang chủ của một Channel sẽ hiện thị 10 videos mới nhất
create proc VSP_ShowTop10Videos @ChannelId int
as
begin
    -- chọn 10 bản ghi
    select top 10 V.[Title], V.[Description], V.[Date_Upload], count(Content) 'Total of Comments'
    from Video V
             -- full outer join để hiện thị đếm toàn bộ số comment của video
             full outer join Comment C on V.VideoId = C.VideoId
         -- lấy các video của channel bằng với tham số @ChannelId truyền vào
    where V.[ChannelId] = @ChannelId
    group by V.[Title], V.[Description], V.[Date_Upload]
             -- sắp xếp theo Date_Upload từ mới tới cũ
    order by V.[Date_Upload] desc
end
go

-- Định nghĩa biến ChannelId
declare @ChannelId int
-- Gán giá trị vào biến ChannelId từ bảng Channel với Username là 'mescedes'
select @ChannelId = [ChannelId] from [Channel] where [Username] = 'mercedes'
-- Thực thi store procedure VSP_ShowTop10Videos với tham số truyền vào là @ChannelId
exec VSP_ShowTop10Videos @ChannelId = @ChannelId
go
