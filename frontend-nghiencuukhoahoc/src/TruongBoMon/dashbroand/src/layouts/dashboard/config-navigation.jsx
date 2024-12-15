import SvgColor from "../../components/svg-color";

// ----------------------------------------------------------------------

const icon = (name) => (
  <SvgColor
    src={`/assets/icons/navbar/${name}.svg`}
    sx={{ width: 1, height: 1 }}
  />
);

const navConfig = [
  {
    title: "Thống kê",
    path: "/",
    icon: icon("ic_analytics"),
  },

  {
    title: "Danh sách giảng viên",
    path: "/giang-vien",
    icon: icon("ic_user"),
  },
  {
    title: "Chương Trình Đào Tạo",
    path: "/quan-ly-phan-cong-giang-day",
    icon: icon("ic_cart"),
  },

  {
    title: "Đăng Ký Khung Giờ Chuẩn",
    path: "/dang-ky-khung-gio-chuan",
    icon: icon("ic_blog"),
  },
  {
    title: "Theo dõi đăng ký",
    path: "/theo-doi-dang-ky",
    icon: icon("ic_blog"),
  },
  {
    title: "Danh sách giảng viên đăng ký",
    path: "/danhsachgiangvien",
    icon: icon("ic_blog"),
  },
  {
    title: "Thông tin cá nhân",
    path: "/tai-khoan-giangvien/thong-tin",
    icon: icon("ic_blog"),
  },

  {
    title: "Đổi mật khẩu",
    path: "/tai-khoan-giangvien/doi-mat-khau",
    icon: icon("ic_blog"),
  },
];

export default navConfig;
