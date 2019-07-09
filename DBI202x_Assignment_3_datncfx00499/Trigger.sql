/** Tạo trigger bắt sự kiện thêm video mới vào bảng Video.
  Khi thêm video mới phải đảm bảo rằng Title có giá trị.
  Vì vậy trước khi thêm vào bảng, kiểm tra Title có khác rỗng hay không
    - Nếu rỗng sẽ rollback và không cho thêm video mới vào bảng
    - Nếu đảm bảo, cho phép thêm video mới và truy vấn ra toàn bộ người dùng đã đăng ký channel.
      Mục đích sẽ dùng để tạo thông báo cho toàn bộ subscribers có video mới.
 */
create trigger VTG_InsertNewVideo
    on [Video]
    for insert
    as
begin
    -- Định nghĩa biến Title
    declare
        @Title VARCHAR(255)
    -- Định nghĩa biến ChannelId
    declare
        @ChannelId int
    -- Gán giá trị vào biến Title, ChannelId
    select @Title = inserted.Title from inserted
    select @ChannelId = inserted.ChannelId from inserted
    if @Title is null
        begin
            rollback tran
            print 'Invalid title'
        end
    else
        begin
            if @Title = ''
                begin
                    rollback tran
                    print 'Invalid title'
                end
            else
                begin
                    select [Username] from Subscribe S where S.ChannelId = @ChannelId
                end
        end
end
go

-- Insert new video into Video table
insert into [Video]
values ('You Need To Calm Down',
        'Music video by Taylor Swift performing “You Need To Calm Down” – off her upcoming new album ‘Lover’ (out August 23)',
        75315861, '2019-07-09 22:20:00', 2);
go
