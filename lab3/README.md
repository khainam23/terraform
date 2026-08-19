Clone dự án

https://github.com/khainam23/examix.vn.git (dự án private). Nếu không thấy, hãy liên hệ: khainam23@gmail.com.

Lưu ý

- Chỉ clone dự án để test — KHÔNG push mã nguồn này lên repository tf.

## Một số vấn đề cần lưu ý khi tạo và làm việc với RDS

Khi tạo RDS có một số lựa chọn ban đầu:

- Nếu chọn các phần do AWS quản lý thì thường không thể tùy chỉnh các rule kiểm soát (VPC, Security Group) và sẽ dùng cấu hình mặc định.

- Nếu sau khi tạo không kết nối được, hãy kiểm tra các mục sau:
    - Có cho phép truy cập từ IP public hay chưa?
    - Security Group có cần thêm rule inbound/outbound không?
    - Có yêu cầu kết nối qua SSL không?
    - Tài khoản / mật khẩu có đúng không? (Có thể lấy lại mật khẩu cũ từ giao diện RDS)

