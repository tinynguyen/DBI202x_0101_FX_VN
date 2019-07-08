-- MỘT SỐ PHƯƠNG PHÁP GIÚP TĂNG HIỆU SUẤT CỦA HỆ THỐNG.

-- 1. Sử dụng NOT EXISTS để kiểm tra tồn tại của bảng. Nếu bảng đã tồn tại sẽ không thực thi câu truy vấn tạo bảng.

-- 2. Sử dụng từ khoá EXISTS thay cho IN
/**
  Như câu truy vấn tại "SubQuery.sql", thay vì dùng IN có thể dụng EXISTS.
  Việc sử dụng tìm cho sự xuất hiện của một dòng duy nhất thoả điều kiện, còn IN thì tìm cả.
  * Câu truy vấn có thể sửa lại:
 */
select *
from Video V
where exists(select 1 from Comment C where C.VideoId = V.VideoId)

-- 3. Sử dụng từ khoá UNION thay cho OR
/**
  Như câu truy vấn tại "Or.sql", thay vì dùng OR có thể dùng UNION để kết hợp 2 điều kiện lại.
  Việc sử dụng OR sẽ làm DBMS quét toàn bộ bảng để lấy ra dữ liệu chung. Thay vào đó việc sử dụng UNION sẽ quét từng
  phần của điều kiện sau đó kết hợp lại. Trách việc phải quét qua các record không nằm trong khoảng điều kiện.
  * Câu truy vấn có thể sửa lại:
 */
select *
from [Video]
where [ChannelId] = 6
union
select *
from Video
where [Views] > 1000000;

