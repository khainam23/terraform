# Terraform

## Giới thiệu
Dự án này lưu trữ các bài học, lab và ví dụ về Infrastructure as Code (IaC) với Terraform trên AWS.

## Mục tiêu chung
- Hiểu cách quản lý hạ tầng bằng Terraform
- Triển khai và cấu hình tài nguyên AWS theo code
- Nắm rõ các khái niệm kiến trúc AWS và mô hình triển khai

---

# Lab 1

## Mục tiêu
- Hiểu các mô hình cơ bản trên AWS và cách triển khai bằng Terraform
- Nắm rõ kiến thức về EC2, VPC và cách thiết lập mạng
- Hiểu vai trò của NAT Gateway và Internet Gateway
- Tìm hiểu cách SSH vào EC2 từ local hoặc trực tiếp trên AWS
- Hiểu Route Table, AZ, Availability Zone và cách phân chia mạng
- Phân biệt các loại instance EC2 như `t`, `m`, `c`
- Biết cấu trúc viết Terraform như thế nào
- Nắm được cách sử dụng AMI động
- Hiểu lifecycle trong Terraform
- Hiểu `tfstate` là gì và vì sao cần bảo mật

## Nội dung chính
- Kiến trúc mạng trên AWS
- Cấu hình VPC
- Route Table
- Internet Gateway / NAT Gateway
- EC2 instance
- AMI và cấu hình động
- Lifecycle của resource trong Terraform
- Bảo mật và quản lý `terraform.tfstate`

---

# Lab 2

## Mục tiêu
- Sử dụng `Launch Template` và `Auto Scaling Group (ASG)`
- Hiểu EKS là gì và cách hoạt động
- Quản lý S3, bucket và làm việc với code
- Thiết lập quyền truy cập từ EC2 tới S3 mà không cần cung cấp credentials
- Phân biệt `Role` và `Policy` trong IAM
- Tìm hiểu các quyền IAM cụ thể
- Thiết lập role cho EC2
- Nắm các loại lưu trữ S3 như Intelligent-Tiering, Glacier, ...
- Quản lý versioning trong S3
- Hiểu ACLs và NACLs

## Nội dung chính
- Launch Template
- Auto Scaling Group
- Amazon EKS
- S3 bucket và storage class
- IAM Policy / IAM Role
- Quyền truy cập và bảo mật
- Versioning và ACL
- Network ACL

---

## Ghi chú
Mỗi lab có thể được bổ sung và cập nhật theo tiến độ học tập.
