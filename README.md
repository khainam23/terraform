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
- Ôn tập kỹ hơn về VPC (NAT Gateway, Internet Gateway, EIP, Route Table,...)
- Cách tổ chức DRY folder structure và sử dụng module trong tf
- Cách sử dụng tổ chức quản lý biến bằng tfvars

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

## Lab 3

### Mục tiêu
- Hiểu ECR và ECS (so sánh Fargate vs EC2 launch types)
- So sánh ECS vs EKS để chọn giải pháp phù hợp
- Quản lý secrets (Cách dùng AWS Systems Manager - Parameter Store, AWS Secrets Manager, AWS KMS (Key Management Service))
- Viết pipeline build và deploy với GitHub Actions
- Tích hợp GitHub với AWS cho CI/CD
- Áp dụng IAM theo principle of least privilege
- Thiết lập luồng CI/CD từ code đến hạ tầng ( IaC )
- Tìm hiểu công cụ kiểm thử và bảo mật: SonarQube, Trivy, Snyk, Checkov, Terragrunt
- Học cách sử dụng module có sẵn trong terraform ([Terraform Registry](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)) thay vì tự viết từng cái
- Tổng quan về OpenTofu (lựa chọn thay thế Terraform nếu cần)

### Nội dung chính
- Docker image và ECR (build, push, versioning)
- ECS Task Definition, Service, và cách chọn Fargate/EC2
- Xây dựng GitHub Actions workflow mẫu cho CI/CD
- Quản lý secrets và biến môi trường an toàn
- Tích hợp kiểm thử bảo mật (SAST/DAST) và IaC scanning
- Các bước vận hành: rollback, monitoring, logging
- Tìm hiểu về RDS

---

## Ghi chú
Mỗi lab có thể được bổ sung và cập nhật theo tiến độ học tập.
