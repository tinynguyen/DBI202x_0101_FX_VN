-- Use database
use Project3_DBI202x
go

-- Thêm trường Trend trong bảng Video
alter table [Video]
    add [Trend] tinyint null
go

-- Tạo cursor với giá trị VideoId, Views từ bảng Video
declare Cursor_CheckTrend cursor for
    select [VideoId], [Views]
    from [Video]
-- Mở cursor
open Cursor_CheckTrend

-- Định nghĩa 2 biến VideoId, Views
declare
    @VideoId int
declare
    @Views bigint

-- Duyệt phần tử đầu tiên trong cursor
fetch next from Cursor_CheckTrend into @VideoId, @Views

-- Vòng lập duyệt qua các phần từ của cursor
while @@FETCH_STATUS = 0
begin
    -- Kiểm tra điều kiện và cập nhật giá trị cho Trend
    if @Views > 1000000000
        begin
            update [Video] set [Trend] = 1 where [VideoId] = @VideoId
        end
    else
        if @Views > 100000000
            begin
                update [Video] set [Trend] = 2 where [VideoId] = @VideoId
            end
        else
            if @Views > 1000000
                begin
                    update [Video] set [Trend] = 3 where [VideoId] = @VideoId
                end
            else
                if @Views > 10000
                    begin
                        update [Video] set [Trend] = 4 where [VideoId] = @VideoId
                    end
                else
                    begin
                        update [Video] set [Trend] = 5 where [VideoId] = @VideoId
                    end
    fetch next from Cursor_CheckTrend into @VideoId, @Views
end

-- Đóng cursor
close Cursor_CheckTrend
deallocate Cursor_CheckTrend