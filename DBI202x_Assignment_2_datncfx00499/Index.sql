create unique index VideoID_Index
on Video(VideoId);

-- Tạo index VideoId để tăng tốc độ truy vấn tới thuộc tính VideoId của bảng Video nhanh hơn.
-- Vì đa phần mô hình cơ sở dữ liệu này đều truy vấn tới bằng Video thông qua VideoId.