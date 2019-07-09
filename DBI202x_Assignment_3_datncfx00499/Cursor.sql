-- Use database
use Project3_DBI202x
go

alter table [Video]
    add [Trend] tinyint null
go

declare Cursor_CheckTrend cursor for
    select [VideoId], [Views]
    from [Video]
open Cursor_CheckTrend

declare
    @VideoId int
declare
    @Views bigint

fetch next from Cursor_CheckTrend into @VideoId, @Views

while @@FETCH_STATUS = 0
begin
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

close Cursor_CheckTrend
deallocate Cursor_CheckTrend