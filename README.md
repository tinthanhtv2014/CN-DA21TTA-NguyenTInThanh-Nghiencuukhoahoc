
# Xây dựng hệ thống quản lý đăng ký giờ nhiệm vụ của giảng viên Khoa Kỹ thuật và Công nghệ

**Giáo viên hướng dẫn:** Phạm Thị Trúc Mai  
**Sinh viên thực hiện:** Nguyễn Tín Thành - 110121104 - DA21TTA  
**Email:** tinthanhtv2014@gmail.com  
**Số điện thoại:** 0395890398  

### Mô tả đề tài:

- **Mục tiêu:**
  - Xây dựng hệ thống quản lý đăng ký giờ nhiệm vụ của giảng viên, bao gồm việc quản lý thông tin về giờ làm việc, nghiên cứu khoa học và nhiệm vụ khác của giảng viên trong Khoa Kỹ thuật và Công nghệ.
  - Cung cấp khả năng thống kê, báo cáo các hoạt động nghiên cứu khoa học của giảng viên.

- **Chức năng cho quản trị viên:**
  - Quản lý thông tin giảng viên: Thêm, sửa, xóa và tìm kiếm giảng viên.
  - Quản lý giờ nhiệm vụ: Đăng ký, cập nhật, xóa giờ nhiệm vụ của giảng viên.
  - Thống kê: Hiển thị báo cáo thống kê về số giờ nghiên cứu khoa học, số giờ giảng dạy.

- **Chức năng cho giảng viên:**
  - Đăng ký giờ nhiệm vụ: Giảng viên có thể đăng ký giờ làm việc và các nhiệm vụ nghiên cứu khoa học.
  - Xem thông tin nhiệm vụ của mình: Xem thông tin về giờ làm việc và các nhiệm vụ nghiên cứu đã đăng ký.

### Phương pháp thực hiện:

1. **Tìm kiếm và Nghiên cứu:**
   - Tìm hiểu thông tin liên quan đến việc quản lý giờ nhiệm vụ giảng viên.
   - Nghiên cứu tài liệu để xác định yêu cầu và chức năng của hệ thống.

2. **Phân tích và Thiết kế:**
   - Phân tích yêu cầu bài toán và thiết kế cơ sở dữ liệu.
   - Thiết kế giao diện người dùng và hệ thống quản lý.

3. **Lập trình và Triển khai:**
   - Lập trình website theo thiết kế đã xác định.
   - Triển khai hệ thống trên môi trường thử nghiệm.

4. **Kết quả đạt được:**
   - Hoàn thành xây dựng hệ thống quản lý giờ nhiệm vụ giảng viên.
   - Hoàn thiện quyển báo cáo đồ án và triển khai hệ thống thực tế.

### Kế hoạch thực hiện:

| Tuần | Thời gian         | Nội dung công việc                                               | Người thực hiện |
|------|-------------------|------------------------------------------------------------------|-----------------|
| 1    | 11/11-17/11/2024  | - Tìm hiểu đề tài và xây dựng đề cương. <br> - Tìm hiểu Công nghệ sử dụng và nghiệp vụ. <br> - Xác định yêu cầu. <br> - Phân tích yêu cầu. <br> - Viết báo cáo. <br> - Báo cáo tiến độ với GV hướng dẫn qua Email. | Nguyễn Tín Thành |
| 2    | 25/11-01/12/2024  | - Thiết lập môi trường, công cụ. <br> - Xây dựng các mô hình hệ thống. <br> - Thiết kế sơ đồ ERD và DFD. <br> - Thiết kế cơ sở dữ liệu <br> - Viết báo cáo. <br> - Báo cáo tiến độ với GV hướng dẫn qua Email. | Nguyễn Tín Thành |
| 3    | 09/12-15/12/2024  | - Thiết kế giao diện. <br> - Viết báo cáo. <br> - Chạy Demo. <br> - Báo cáo tiến độ với GV hướng dẫn qua Email. | Nguyễn Tín Thành |
| 4    | 23/12-29/12/2024  | - Xây dựng các chức năng của dự án như: Đăng nhập, đăng ký, phân quyền, đăng ký nghiên cứu khoa học,… <br> - Viết báo cáo đồ án <br> - Báo cáo tiến độ với GV hướng dẫn qua Email. | Nguyễn Tín Thành |
| Kết thúc | 30/12-05/01/2025 | - Kiểm thử các chức năng của hệ thống từ frontend tới backend. <br> - Chạy Demo. <br> - Báo cáo tiến độ với GV hướng dẫn qua Email. <br> - Viết báo cáo.  | Nguyễn Tín Thành |

### Hướng dẫn cài đặt dự án:

**Yêu cầu:**
- Xampp
- Node.js
- npm

**Cài Đặt:**

1. **Clone Repository:**
   ```bash
   git clone https://github.com/tinthanhtv2014/csn-da21tta-nguyentinthanh-banquanao-nodejs.git
   ```

2. **Cài Đặt Dependencies:**

   - Di chuyển vào thư mục `src_nodejs` và cài đặt dependencies:
   ```bash
   npm install
   ```

3. **Cấu Hình Môi Trường:**

   - Tạo tệp `.env` từ tệp `.env.example` và điền thông tin cần thiết (cấu hình môi trường trong dự án).

4. **Chạy Ứng Dụng:**

   - Import file `src/quanlygio.sql` vào Xampp.
   - Mở Visual Studio Code và mở dự án.
   - Di chuyển đến thư mục `src_nodejs` và chạy ứng dụng:
   ```bash
   npm run start
   ```

   - Hoặc sử dụng `nodemon` để tự động khởi động lại ứng dụng khi có thay đổi:
   ```bash
   npm install -g nodemon
   nodemon
   ```

### Đóng Góp:

Nếu bạn muốn đóng góp vào dự án, vui lòng làm theo các bước sau:
1. Fork dự án
2. Tạo nhánh mới (`git checkout -b feature/awesome-feature`)
3. Commit thay đổi của bạn (`git commit -am 'Add some awesome feature'`)
4. Push đến nhánh của bạn (`git push origin feature/awesome-feature`)
5. Tạo Pull Request

### Liên Hệ:

- **Trường Đại học:** Đại học Trà Vinh
- **Lớp:** DA21TTA
- **Tên:** Nguyễn Tín Thành
- **Email:** [tinthanhtv2014@gmail.com](mailto:tinthanhtv2014@gmail.com)

--- 

Hy vọng bản sửa lại này sẽ phù hợp với yêu cầu của bạn!
