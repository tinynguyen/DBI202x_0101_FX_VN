create view [Video_Views] as
select [VideoId], [Title], [Views]
from Video;

-- Tạo 1 View bao gồm các trường VideoId, Title, Views của một record trong bảng Video.
/** Các trường trong bảng Video thường ít thường xuyên thay đổi (Title, Description). Tuy nhiên, trường Views
  của một record sẽ thay đổi liên tục. Tạo View để thông qua đó người dùng có thể tập trung vào dữ liệu cần thiết
  và đơn giản hơn về dữ liệu.
  Ngoài ra, vì View cho phép đọc (Read-Only) nên dùng để truy vấn sẽ tránh tình trạng tấn công thay đổi thông tin dữ liệu
 */