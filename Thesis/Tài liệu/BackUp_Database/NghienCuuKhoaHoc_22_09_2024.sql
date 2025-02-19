-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 22, 2024 lúc 04:02 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nghiencuukhoahoc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bangphancong`
--

CREATE TABLE `bangphancong` (
  `MAPHANCONG` int(11) NOT NULL,
  `MAHKNK` int(11) NOT NULL,
  `MAGV` varchar(255) NOT NULL,
  `THOIGIANLAP` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bao_cao_ket_thuc_mon`
--

CREATE TABLE `bao_cao_ket_thuc_mon` (
  `MADANHGIAKETTHUC` int(11) NOT NULL,
  `MACHITIETPHANCONG` int(11) NOT NULL,
  `LANDANHGIA` int(11) DEFAULT NULL,
  `NGAYDANHGIA` date DEFAULT NULL,
  `NGAYBAOCAOKETTHUC` date DEFAULT NULL,
  `TRANG_THAI_DANG_KY` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bomon`
--

CREATE TABLE `bomon` (
  `MABOMON` int(11) NOT NULL,
  `MAKHOA` int(11) NOT NULL,
  `TENBOMON` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bomon`
--

INSERT INTO `bomon` (`MABOMON`, `MAKHOA`, `TENBOMON`) VALUES
(2, 1, 'Bộ Môn Công Nghệ Phần Mềm'),
(16, 11, 'Bộ môn Công nghệ thông tin'),
(18, 12, 'Ngoài trường'),
(19, 11, 'Bộ môn Cơ khí - Động lực'),
(20, 11, 'Bộ môn Điện - Điện tử');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietphancong`
--

CREATE TABLE `chitietphancong` (
  `MACHITIETPHANCONG` int(11) NOT NULL,
  `MAMONHOC` int(11) NOT NULL,
  `MAPHANCONG` int(11) NOT NULL,
  `MALOP` varchar(255) NOT NULL,
  `TONG_SO_GIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chon_khung`
--

CREATE TABLE `chon_khung` (
  `MAGV` varchar(255) NOT NULL,
  `MANAMHOC` int(11) NOT NULL,
  `MAKHUNG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chucdanh`
--

CREATE TABLE `chucdanh` (
  `MACHUCDANH` int(11) NOT NULL,
  `TENCHUCDANH` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chucdanh`
--

INSERT INTO `chucdanh` (`MACHUCDANH`, `TENCHUCDANH`) VALUES
(1, 'Giảng viên cao cấp (Hạng I)'),
(2, 'Giảng viên chính (Hạng II)'),
(3, 'Giảng viên (Hạng III)'),
(4, 'Trợ Giảng'),
(5, 'Giảng viên Tập sự');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chucvu`
--

CREATE TABLE `chucvu` (
  `MACHUCVU` int(11) NOT NULL,
  `TENCHUCVU` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chucvu`
--

INSERT INTO `chucvu` (`MACHUCVU`, `TENCHUCVU`) VALUES
(1, 'Phó Trưởng Khoa'),
(2, 'Trưởng Bộ Môn'),
(3, 'Phó Trưởng Bộ Môn'),
(4, 'Giảng Viên Chính'),
(5, 'Giảng Viên'),
(6, 'Trưởng Khoa'),
(7, 'Bộ môn Công nghệ thông tin'),
(8, 'Phó Trưởng bộ môn CNTT'),
(9, 'Trưởng bộ môn CNTT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuongtrinhdaotao`
--

CREATE TABLE `chuongtrinhdaotao` (
  `MACHUONGTRINH` int(11) NOT NULL,
  `MABOMON` int(11) NOT NULL,
  `TENCHUONGTRINH` text DEFAULT NULL,
  `SO_QUYET_DINH` text DEFAULT NULL,
  `TRINH_DO` varchar(255) DEFAULT NULL,
  `TONG_SO_TIN_CHI` int(11) DEFAULT NULL,
  `MO_TA_HOC_KY` text DEFAULT NULL,
  `GHI_CHUONG_TRINH` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chuongtrinhdaotao`
--

INSERT INTO `chuongtrinhdaotao` (`MACHUONGTRINH`, `MABOMON`, `TENCHUONGTRINH`, `SO_QUYET_DINH`, `TRINH_DO`, `TONG_SO_TIN_CHI`, `MO_TA_HOC_KY`, `GHI_CHUONG_TRINH`) VALUES
(1, 16, 'CÔNG NGHỆ THÔNG TIN', '3455/QĐ-ĐHTV, ngày 12 tháng 7 năm 2018', 'ĐẠI HỌC', 138, 'Chính quy', NULL),
(2, 19, 'Công nghệ ô tô', '        /QĐ – ĐHTV, ngày       tháng       năm 20', 'Đại học', 140, 'Chính quy', NULL),
(3, 19, 'Cơ khí chế tạo máy', '        /QĐ – ĐHTV, ngày       tháng       năm 20', 'Đại học', 140, 'Chính quy', NULL),
(4, 20, 'Điện công nghiệp', 'số: /QĐ – ĐHTV, ngày tháng năm 201', 'Đại học', 150, 'Chính quy', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuyen_mon_giang_vien`
--

CREATE TABLE `chuyen_mon_giang_vien` (
  `MACMGV` int(11) NOT NULL,
  `MA_GV_CMGV` varchar(255) DEFAULT NULL,
  `MA_MON_CMGV` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chuyen_mon_giang_vien`
--

INSERT INTO `chuyen_mon_giang_vien` (`MACMGV`, `MA_GV_CMGV`, `MA_MON_CMGV`) VALUES
(1, '99999', '39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `co_chuc_danh`
--

CREATE TABLE `co_chuc_danh` (
  `MACHUCDANH` int(11) NOT NULL,
  `MAGV` varchar(255) NOT NULL,
  `THOIGIANNHAN` date DEFAULT NULL,
  `TRANGTHAI` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `co_chuc_danh`
--

INSERT INTO `co_chuc_danh` (`MACHUCDANH`, `MAGV`, `THOIGIANNHAN`, `TRANGTHAI`) VALUES
(1, '00245', '2024-07-08', 'Đang giữ chức danh'),
(1, '00254', '2024-07-09', 'Đang giữ chức danh'),
(1, '0122', '2024-08-08', 'Đang giữ chức danh'),
(1, '0123', '2024-08-14', 'Đang giữ chức danh'),
(1, '99997', '2024-09-20', 'Đang giữ chức danh'),
(1, '99999', '2024-06-30', 'Đang giữ chức danh'),
(2, '00249', '2024-07-09', 'Đang giữ chức danh'),
(2, '00250', '2024-07-08', 'Đang giữ chức danh'),
(3, '12705', '2024-07-08', 'Đang giữ chức danh'),
(5, '00248', '2024-07-08', 'Đang giữ chức danh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `co_ty_le`
--

CREATE TABLE `co_ty_le` (
  `MA_QUY_DOI` int(11) NOT NULL,
  `MA_LOAI_DANH_MUC` int(11) NOT NULL,
  `MA_LOAI_TAC_GIA` int(11) NOT NULL,
  `SO_TAC_GIA_THUOC_LOAI` int(11) DEFAULT NULL,
  `NHOM_CHIA_GIO` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `co_ty_le`
--

INSERT INTO `co_ty_le` (`MA_QUY_DOI`, `MA_LOAI_DANH_MUC`, `MA_LOAI_TAC_GIA`, `SO_TAC_GIA_THUOC_LOAI`, `NHOM_CHIA_GIO`) VALUES
(1, 1, 1, 0, 'Không'),
(1, 3, 1, 2, 'Không'),
(2, 1, 2, 0, '1'),
(2, 1, 3, 0, '1'),
(2, 3, 2, 0, '1'),
(2, 3, 3, 0, '1'),
(3, 1, 1, 0, 'Không'),
(3, 3, 1, 2, 'Không'),
(4, 1, 2, 2, 'Không'),
(4, 3, 2, 2, 'Không'),
(5, 1, 2, 1, 'Không'),
(5, 3, 2, 1, 'Không'),
(6, 1, 1, 0, '1'),
(6, 1, 3, 0, '1'),
(6, 3, 1, 1, '1'),
(6, 3, 3, 0, '1'),
(7, 1, 1, 0, 'Không'),
(7, 3, 1, 1, 'Không'),
(8, 1, 1, 0, '1'),
(8, 1, 2, 0, '1'),
(8, 1, 3, 0, '1'),
(8, 3, 1, 1, '1'),
(8, 3, 2, 0, '1'),
(8, 3, 3, 0, '1'),
(9, 2, 8, 0, 'Không'),
(10, 2, 1, 0, 'Không'),
(11, 2, 1, 0, 'Không'),
(12, 2, 1, 0, 'Không'),
(13, 2, 2, 0, '1'),
(13, 2, 3, 0, '1'),
(14, 5, 8, 0, 'Không'),
(15, 5, 8, 0, 'Không'),
(16, 5, 8, 0, 'Không'),
(17, 6, 8, 0, 'Không'),
(17, 7, 8, 0, 'Không'),
(18, 6, 8, 0, 'Không'),
(18, 7, 8, 0, 'Không'),
(19, 6, 8, 0, 'Không'),
(19, 7, 8, 0, 'Không'),
(20, 4, 6, 0, 'Không'),
(21, 4, 6, 0, 'Không'),
(22, 4, 6, 0, 'Không'),
(23, 4, 7, 0, '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dang_ky_thuc_hien_quy_doi`
--

CREATE TABLE `dang_ky_thuc_hien_quy_doi` (
  `MA_DANH_MUC` int(11) NOT NULL,
  `MAGV` varchar(255) NOT NULL,
  `MANAMHOC` int(11) NOT NULL,
  `MA_LOAI_TAC_GIA` int(11) NOT NULL,
  `TEN_DE_TAI` varchar(255) NOT NULL,
  `SOGIOQUYDOI` int(11) DEFAULT NULL,
  `TRANG_THAI_DANG_KY` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmucquydoispkhcn`
--

CREATE TABLE `danhmucquydoispkhcn` (
  `MA_DANH_MUC` int(11) NOT NULL,
  `MA_LOAI_DANH_MUC` int(11) NOT NULL,
  `GIO_CHUAN` int(11) DEFAULT NULL,
  `NOI_DUNG_DANH_MUC` text DEFAULT NULL,
  `ISBN` varchar(50) DEFAULT NULL,
  `WOS_SCOUPUS` varchar(50) DEFAULT NULL,
  `HANG_WOS_SCOUPUS` varchar(10) DEFAULT NULL,
  `LOI_NHUAN` varchar(100) DEFAULT NULL,
  `DON_VI_TINH` varchar(50) DEFAULT NULL,
  `GIAI_THUONG` varchar(50) DEFAULT NULL,
  `XEP_HANG_QUARTILES` varchar(50) DEFAULT NULL,
  `NAM_THUC_HIEN` text DEFAULT NULL,
  `TRANG_THAI_DANH_MUC` varchar(100) DEFAULT NULL,
  `GHI_CHU_DANH_MUC` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmucquydoispkhcn`
--

INSERT INTO `danhmucquydoispkhcn` (`MA_DANH_MUC`, `MA_LOAI_DANH_MUC`, `GIO_CHUAN`, `NOI_DUNG_DANH_MUC`, `ISBN`, `WOS_SCOUPUS`, `HANG_WOS_SCOUPUS`, `LOI_NHUAN`, `DON_VI_TINH`, `GIAI_THUONG`, `XEP_HANG_QUARTILES`, `NAM_THUC_HIEN`, `TRANG_THAI_DANH_MUC`, `GHI_CHU_DANH_MUC`) VALUES
(1, 1, 195, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 1 Điều 11.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu có mã số ISBN'),
(2, 1, 98, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 1 Điều 11.', 'Không', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu không có mã số ISBN'),
(3, 1, 255, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 2 Điều 11.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu (proceedings) có mã số ISBN'),
(4, 1, 195, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 2 Điều 11.', 'Không', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu (proceedings) không có mã số ISBN'),
(5, 1, 98, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 3 Điều 11.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu/proceedings có mã số ISBN'),
(6, 1, 49, 'Báo cáo khoa học/tham luận đăng toàn văn hội thảo khoa học cấp Trường được tổ chức bởi các ĐVĐT thuộc và trực thuộc đáp ứng yêu cầu khoản 3 Điều 11.', 'Không', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Kỷ yếu/proceedings không có mã số ISBN'),
(7, 1, 64, 'Báo cáo khoa học/tham luận đăng toàn văn trong kỷ yếu hội nghị hội thảo chuyên ngành bên ngoài trường có phản biện, sử dụng ngôn ngữ tiếng Việt và các hội thảo hội nghị khác có chỉ số ISBN', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(8, 1, 234, 'Báo cáo khoa học/tham luận đăng toàn văn trong kỷ yếu (proceedings) hội nghị hội thảo quốc tế xuất bản bằng ngôn ngữ tiếng Anh có phản biện, có chỉ số ISBN không thuộc danh mục WoS/Scopus.', 'Có', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(9, 1, 378, ' Báo cáo khoa học/tham luận đăng toàn văn trong kỷ yếu (proceedings) hội nghị hội thảo quốc tế xuất bản bằng ngôn ngữ tiếng Anh, có chỉ số ISBN thuộc danh mục WoS/Scopus.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(10, 1, 0, 'Các báo cáo khoa học/ tham luận đăng toàn văn hoặc tóm tắt tại hội thảo/hội nghị đặc biệt khác phục vụ cho quan hệ đối ngoại, nâng cao hình ảnh và vị thế của Trường ĐHTV, thì các đơn vị được giao tổ chức/tham gia sự kiện phối hợp với Phòng KHCN để trình Hiệu trưởng xem xét, quyết định mức giờ chuẩn quy đổi cụ thể trước khi thực hiện.', 'Không rõ', 'Không rõ', 'Không rõ', 'Không rõ', 'Không rõ', 'Không rõ', 'Không rõ', '2024-2025', 'Đang áp dụng', 'Hiệu trưởng xem xét, quyết định mức giờ chuẩn quy đổi cụ thể trước khi thực hiện.'),
(11, 2, 195, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, không được tính điểm công trình của HĐGSNN.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Tạp chí khoa học Trường ĐHTV'),
(12, 2, 146, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, không được tính điểm công trình của HĐGSNN.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các tập chí khác'),
(13, 2, 235, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, được tính điểm công trình của HĐGSNN (tạp chí khoa học trong nước có uy tín).', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Tạp chí khoa học Trường ĐHTV'),
(14, 2, 195, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Việt, được tính điểm công trình của HĐGSNN (tạp chí khoa học trong nước có uy tín).', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các tạp chí khác'),
(15, 2, 244, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước hoặc quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, không có trong danh mục WoS/Scopus', 'Có', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Tạp chí khoa học Trường ĐHTV'),
(16, 2, 195, 'Bài báo khoa học được công bố trên tạp chí khoa học trong nước hoặc quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, không có trong danh mục WoS/Scopus', 'Có', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các tạp chí khác'),
(17, 2, 420, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS/Scopus (tạp chí khoa học quốc tế uy tín), không được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không được xếp hạng'),
(18, 2, 855, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q1', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(19, 2, 642, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q2', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(20, 2, 535, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q3', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(21, 2, 428, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục Scopus, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q4', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(22, 2, 1050, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q1', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(23, 2, 855, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q2', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(24, 2, 642, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q3', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(25, 2, 535, 'Bài báo khoa học được công bố trên tạp chí khoa học quốc tế có mã số chuẩn quốc tế ISSN, xuất bản bằng ngôn ngữ tiếng Anh, có trong danh mục WoS, được xếp hạng.', 'Có', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Q4', '2024-2025', 'Đang áp dụng', 'Được xếp hạng'),
(26, 2, 98, 'Các sản phẩm KH&CN công bố bởi viên chức (chỉ tính đối với tác giả thứ nhất hoặc tác giả chịu trách nhiệm trong trường hợp tác giả thứ nhất không phải viên chức của Trường ĐHTV, trường hợp đồng tác giả thứ nhất hoặc đồng tác giả chịu trách nhiệm thì chia đôi) được xuất bản bởi các tạp chí và nhà xuất bản quốc tế uy tín (nằm trong danh mục WoS/Scopus) mà tên đơn vị của Trường ĐHTV đứng thứ hai (trường hợp dual-affiliations) thì được tính giờ nhiệm vụ NCKH là 98 giờ, đứng thứ nhất được tính 195 giờ.', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Trường ĐHTV đứng thứ hai (trường hợp dual-affiliations)'),
(27, 2, 195, 'Các sản phẩm KH&CN công bố bởi viên chức (chỉ tính đối với tác giả thứ nhất hoặc tác giả chịu trách nhiệm trong trường hợp tác giả thứ nhất không phải viên chức của Trường ĐHTV, trường hợp đồng tác giả thứ nhất hoặc đồng tác giả chịu trách nhiệm thì chia đôi) được xuất bản bởi các tạp chí và nhà xuất bản quốc tế uy tín (nằm trong danh mục WoS/Scopus) mà tên đơn vị của Trường ĐHTV đứng thứ hai (trường hợp dual-affiliations) thì được tính giờ nhiệm vụ NCKH là 98 giờ, đứng thứ nhất được tính 195 giờ.', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Trường ĐHTV đứng thứ nhất'),
(28, 3, 390, 'Bằng độc quyền Giải pháp hữu ích Việt Nam', 'Không', 'Không', 'Không', 'Không', 'Bằng', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các sản phẩm SHTT (đơn vị tính trên 01 bằng).'),
(29, 3, 488, 'Bằng độc quyền sáng chế (chuẩn patent Việt Nam)', 'Không', 'Không', 'Không', 'Không', 'Bằng', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các sản phẩm SHTT (đơn vị tính trên 01 bằng).'),
(30, 3, 585, 'Bằng độc quyền sáng chế chuẩn Patent của Mỹ/ của Châu Âu/ của Đông Bắc Á', 'Không', 'Không', 'Không', 'Không', 'Bằng', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Các sản phẩm SHTT (đơn vị tính trên 01 bằng).'),
(31, 4, 295, 'Sách chuyên khảo', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(32, 4, 295, 'Giáo trình', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(33, 4, 295, 'Sách tham khảo', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(34, 4, 295, 'Sách hướng dẫn, tự điển chuyên ngành, sách bài tập, sách dịch', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(35, 4, 1500, 'Xuất bản sách phục vụ đào tạo do một nhà xuất bản có uy tín (top 10, thuộc danh mục WoS/Scopus) trên thế giới xuất bản', 'Có', 'Có', 'Top 10', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Top 10, thuộc danh mục WoS/Scopus'),
(36, 4, 342, 'Xuất bản sách phục vụ đào tạo do một nhà xuất bản có uy tín (top 1000, thuộc danh mục WoS/Scopus) trên thế giới xuất bản', 'Có', 'Có', 'Top 1000', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Top 1000, thuộc danh mục WoS/Scopus'),
(37, 4, 390, 'Xuất bản chương sách phục vụ đào tạo do một nhà xuất bản có uy tín (top 10, thuộc danh mục WoS/Scopus) trên thế giới xuất bản', 'Có', 'Có', 'Top 10', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Top 10, thuộc danh mục WoS/Scopus'),
(38, 4, 145, 'Xuất bản chương sách phục vụ đào tạo do một nhà xuất bản có uy tín (top 1000, thuộc danh mục WoS/Scopus) trên thế giới xuất bản', 'Có', 'Có', 'Top 1000', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Top 1000, thuộc danh mục WoS/Scopus'),
(39, 4, 115, 'Chương sách nằm trong bộ sách nâng cấp từ bài báo khoa học/báo cáo khoa học (tham luận toàn văn) đã công bố thuộc danh mục WoS/Scopus.', 'Có', 'Có', 'Không', 'Không', 'Sản phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(40, 5, 100, 'Viết thuyết minh nhiệm vụ KH&CN cấp quốc gia, cấp bộ và tương đương;', 'Không', 'Không', 'Không', 'Không', 'Thuyết minh', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(41, 5, 50, 'Viết thuyết minh nhiệm vụ KH&CN cấp tỉnh và tương đương;', 'Không', 'Không', 'Không', 'Không', 'Thuyết minh', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(42, 5, 40, 'Viết thuyết minh/đề xuất dự án quốc tế được Trường ĐHTV giao', 'Không', 'Không', 'Không', 'Không', 'Thuyết minh', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(43, 5, 98, 'Viết hồ sơ đăng ký sáng chế Việt Nam được Trường ĐHTV giao;', 'Không', 'Không', 'Không', 'Không', 'Hồ sơ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(44, 5, 195, 'Viết hồ sơ đăng ký sáng chế quốc tế được Trường ĐHTV giao;', 'Không', 'Không', 'Không', 'Không', 'Hồ sơ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(45, 5, 78, 'Viết hồ sơ đăng ký giải pháp hữu ích Việt Nam được Trường ĐHTV giao;', 'Không', 'Không', 'Không', 'Không', 'Hồ sơ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(46, 5, 98, 'Thiết kế đồ hoạ sản phẩm SHTT được Trường ĐHTV sử dụng đăng ký;', 'Không', 'Không', 'Không', 'Không', 'Sản Phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(47, 5, 10, 'Phản biện bài báo khoa học trong nước;', 'Không', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(48, 5, 20, 'Phản biện bài báo khoa học quốc tế;', 'Không', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(49, 5, 8, 'Phản biện bài báo cáo (tham luận) hội thảo hội nghị khoa học trong nước;', 'Không', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(50, 5, 15, 'Phản biện bài báo cáo (tham luận) hội thảo hội nghị khoa học quốc tế;', 'Không', 'Không', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(51, 5, 10, 'Bài báo khoa học đăng trên các tạp chí quốc tế nằm trong danh mục WoS/Scopus có trích dẫn bài báo khoa học đăng trên tạp chí khoa học Trường ĐHTV (tính cho tác giả thứ nhất, trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV thì tính cho tác giả chịu trách nhiệm)', 'Không', 'Có', 'Không', 'Không', 'Bài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(52, 5, 46, 'Hướng dẫn người học thực hiện đề tài NCKH cấp Trường và tương đương được nghiệm thu đạt;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(53, 5, 98, 'Hướng dẫn người học thực hiện đề tài NCKH cấp Trường và tương đương được nghiệm thu đạt loại xuất sắc;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(54, 5, 195, 'Hướng dẫn người học có kết quả nghiên cứu được áp dụng, triển khai đem lại lợi nhuận tính theo mỗi 25 triệu đồng', 'Không', 'Không', 'Không', '25 triệu đồng', 'Sản Phẩm', 'Không', 'Không', '2024-2025', 'Đang áp dụng', '195/25 triệu đồng'),
(55, 5, 195, 'Hướng dẫn người học tham gia các giải thưởng KH&CN trong nước cấp tỉnh hoặc tương đương đạt huy chương vàng (giải nhất)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Vàng (giải nhất)', 'Không', '2024-2025', 'Đang áp dụng', 'Vàng (giải nhất)'),
(56, 5, 137, 'Hướng dẫn người học tham gia các giải thưởng KH&CN trong nước cấp tỉnh hoặc tương đương đạt huy chương bạc (giải nhì)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Bạc (giải nhì)', 'Không', '2024-2025', 'Đang áp dụng', 'Bạc (giải nhì)'),
(57, 5, 98, 'Hướng dẫn người học tham gia các giải thưởng KH&CN trong nước cấp tỉnh hoặc tương đương đạt huy chương đồng (giải ba);', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Đồng (giải ba);', 'Không', '2024-2025', 'Đang áp dụng', 'Đồng (giải ba);'),
(58, 5, 390, 'Hướng dẫn người học tham gia các 3 giải thưởng KH&CN trong nước cấp vùng trở lên đạt huy chương vàng (giải nhất)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Vàng (giải nhất)', 'Không', '2024-2025', 'Đang áp dụng', 'Vàng (giải nhất)'),
(59, 5, 273, 'Hướng dẫn người học tham gia các 3 giải thưởng KH&CN trong nước cấp vùng trở lên đạt huy chương bạc (giải nhì)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Bạc (giải nhì)', 'Không', '2024-2025', 'Đang áp dụng', 'Bạc (giải nhì)'),
(60, 5, 195, 'Hướng dẫn người học tham gia các 3 giải thưởng KH&CN trong nước cấp vùng trở lên đạt huy chương đồng (giải ba)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Đồng (giải ba);', 'Không', '2024-2025', 'Đang áp dụng', 'Đồng (giải ba);'),
(61, 5, 49, 'Hướng dẫn người học tham gia các 3 giải thưởng KH&CN trong nước cấp vùng trở lên đạt giải khuyến khích và không đạt giải;', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Giải khuyến khích và không đạt giải;', 'Không', '2024-2025', 'Đang áp dụng', 'Giải khuyến khích và không đạt giải;'),
(62, 5, 273, 'Hướng dẫn người học tham gia các 2 cuộc thi về học thuật (Olympic Tin học, Toán học, Hóa học,...) trong nước cấp vùng trở lên đạt huy chương vàng (giải nhất)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Vàng (giải nhất)', 'Không', '2024-2025', 'Đang áp dụng', 'Vàng (giải nhất)'),
(63, 5, 195, 'Hướng dẫn người học tham gia các 2 cuộc thi về học thuật (Olympic Tin học, Toán học, Hóa học,...) trong nước cấp vùng trở lên đạt huy chương bạc (giải nhì)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Bạc (giải nhì)', 'Không', '2024-2025', 'Đang áp dụng', 'Bạc (giải nhì)'),
(64, 5, 137, 'Hướng dẫn người học tham gia các 2 cuộc thi về học thuật (Olympic Tin học, Toán học, Hóa học,...) trong nước cấp vùng trở lên đạt huy chương đồng (giải ba)', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Đồng (giải ba);', 'Không', '2024-2025', 'Đang áp dụng', 'Đồng (giải ba);'),
(65, 5, 49, 'Hướng dẫn người học tham gia các 2 cuộc thi về học thuật (Olympic Tin học, Toán học, Hóa học,...) trong nước cấp vùng trở lên đạt khuyến khích và không đạt giải;', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Giải khuyến khích và không đạt giải;', 'Không', '2024-2025', 'Đang áp dụng', 'Giải khuyến khích và không đạt giải;'),
(66, 5, 390, 'Hướng dẫn người học tham gia các giải thưởng khởi nghiệp từ cấp bộ hoặc tương đương trở lên.', 'Không', 'Không', 'Không', 'Không', 'Giải thưởng', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(67, 5, 195, 'Tham gia thực hiện Dự án nghiên cứu bên ngoài Trường với mức kinh phí dự án từ 100 triệu trở lên (do đơn vị bên ngoài Trường cấp kinh phí thực hiện và thông qua BGH kí Hợp đồng) và có số tiền trích nộp về Trường/giảng viên từ 25 triệu đồng trở lên;', 'Không', 'Không', 'Không', '25 triệu đồng', 'Dự án', 'Không', 'Không', '2024-2025', 'Đang áp dụng', '195 giờ/thành viên có trích nộp về Trường theo quy định.'),
(68, 5, 195, 'Tham gia thực hiện hoạt động sản xuất dịch vụ với lợi nhuận có trích nộp về Trường/giảng viên từ 25 triệu đồng trở lên;', 'Không', 'Không', 'Không', '25 triệu đồng', 'Hoạt động', 'Không', 'Không', '2024-2025', 'Đang áp dụng', '195 giờ/thành viên có trích nộp về Trường theo quy định.'),
(69, 5, 195, 'Biên soạn 01 bộ ngân hàng câu hỏi trắc nghiệm trên máy tính (tối thiểu 400 câu) không nhận thù lao biên soạn.', 'Không', 'Không', 'Không', 'Không', 'Bộ ngân hàng câu hỏi', 'Không', 'Không', '2024-2025', 'Đang áp dụng', '(tối thiểu 400 câu) không nhận thù lao biên soạn.'),
(70, 6, 195, 'Đề tài KH&CN cấp Trường ĐHTV, cấp huyện hoặc tương đương được nghiệm thu đạt;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(71, 6, 390, 'Đề tài KH&CN cấp Bộ, Tỉnh, Thành phố (TP) thuộc Trung ương được nghiệm thu đạt có kinh phí ≥ 500 triệu đồng;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Được nghiệm thu đạt có kinh phí ≥ 500 triệu đồng;'),
(72, 6, 244, 'Đề tài KH&CN cấp Bộ, Tỉnh, TP thuộc Trung ương được nghiệm thu đạt có kinh phí < 500 triệu đồng;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Được nghiệm thu đạt có kinh phí < 500 triệu đồng;'),
(73, 6, 488, 'Đề tài KH&CN cấp Quốc gia được nghiệm thu đạt;', 'Không', 'Không', 'Không', 'Không', 'Đề tài', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(74, 6, 293, 'Dự án KH&CN đem lại lợi nhuận trên 100 triệu và dưới 300 triệu đồng;', 'Không', 'Không', 'Không', 'Không', 'Dự án', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Lợi nhuận trên 100 triệu và dưới 300 triệu đồng;'),
(75, 6, 390, 'Dự án KH&CN đem lại lợi nhuận từ trên 300 triệu đồng đến 500 triệu đồng;', 'Không', 'Không', 'Không', 'Không', 'Dự án', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Lợi nhuận từ trên 300 triệu đồng đến 500 triệu đồng;'),
(76, 6, 585, 'Dự án KH&CN đem lại lợi nhuận từ trên 500 triệu đồng;', 'Không', 'Không', 'Không', 'Không', 'Dự án', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Lợi nhuận từ trên 500 triệu đồng;'),
(77, 6, 0, 'Các trường hợp khác (đề tài/dự án hợp tác doanh nghiệp, hợp tác quốc tế, nghị định thư, ...) không nêu trong quy chế các đơn vị làm tờ trình trình Hiệu trưởng quyết định trước khi thực hiện.', 'Không', 'Không', 'Không', 'Không', 'Theo tờ trình được duyệt', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Làm tờ trình trình Hiệu trưởng quyết định trước khi thực hiện.'),
(78, 7, 250, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp tỉnh và tương đương) đạt huy chương vàng', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Vàng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(79, 7, 200, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp tỉnh và tương đương) đạt huy chương bạc', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Bạc', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(80, 7, 150, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp tỉnh và tương đương) đạt huy chương đồng;', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Đồng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(81, 7, 400, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc gia) đạt huy chương vàng', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Vàng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(82, 7, 300, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc gia) đạt huy chương bạc', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Bạc', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(83, 7, 200, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc gia) đạt huy chương đồng;', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Đồng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(84, 7, 600, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc tế) đạt huy chương vàng', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Vàng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(85, 7, 500, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc tế) đạt huy chương bạc', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Bạc', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(86, 7, 400, 'Thành tích huấn luyện, thi đấu thể dục thể thao (giải cấp quốc tế) đạt huy chương đồng;', 'Không', 'Không', 'Không', 'Không', 'Huy chương', 'Đồng', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(87, 7, 195, 'Sáng tác một tác phẩm âm nhạc, múa, điện ảnh được công diễn từ cấp tỉnh trở lên và đạt giải;', 'Không', 'Không', 'Không', 'Không', 'Tác phẩm', 'Có', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(88, 7, 195, 'Dàn dựng/Biên đạo Đạo diễn một tác phẩm âm nhạc, múa, điện ảnh được công diễn từ cấp tỉnh trở lên và đạt giải;', 'Không', 'Không', 'Không', 'Không', 'Tác phẩm', 'Có', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(89, 7, 195, 'Sáng tác và Dàn dựng/Biên đạo Đạo diễn một tác phẩm âm nhạc, múa, điện ảnh được công diễn cấp tỉnh trở lên và đạt giải;', 'Không', 'Không', 'Không', 'Không', 'Tác phẩm', 'Có', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(90, 7, 195, 'Đạo diễn trọn một vở diễn cấp tỉnh trở lên có thời gian từ 30 phút trở lên;', 'Không', 'Không', 'Không', 'Không', 'Vở diễn', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không'),
(91, 7, 195, 'Biên đạo múa (một vở kịch múa từ ba màn trở lên hoặc một chương trình từ 5 tiết mục trở lên được dựng ở các Nhà hát cấp tỉnh trở lên);', 'Không', 'Không', 'Không', 'Không', 'Vở kịch múa', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Một vở kịch múa từ ba màn trở lên hoặc một chương trình từ 5 tiết mục trở lên được dựng ở các Nhà hát cấp tỉnh trở lên'),
(92, 7, 195, 'Dàn dựng, chỉ huy hoặc biểu diễn một chương trình hòa nhạc có độ dài trên 45 phút cấp tỉnh trở lên;', 'Không', 'Không', 'Không', 'Không', 'Không rõ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Dàn dựng, chỉ huy hoặc biểu diễn một chương trình hòa nhạc có độ dài trên 45 phút cấp tỉnh trở lên;'),
(93, 7, 195, 'Sáng tác và dàn dựng một tác phẩm âm nhạc/tác phẩm múa/ tác phẩm kịch hoặc tuồng được công diễn từ cấp tỉnh trở lên có độ dài trên 30 phút;', 'Không', 'Không', 'Không', 'Không', 'Không rõ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Từ cấp tỉnh trở lên có độ dài trên 30 phút;'),
(94, 7, 98, 'Các bài hát, bài thơ sáng tác mới và được cấp phép sử dụng;', 'Không', 'Không', 'Không', 'Không', 'Không rõ', 'Không', 'Không', '2024-2025', 'Đang áp dụng', 'Không');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `MAGV` varchar(255) NOT NULL,
  `MABOMON` int(11) NOT NULL,
  `TENGV` varchar(100) DEFAULT NULL,
  `EMAIL` text DEFAULT NULL,
  `DIENTHOAI` varchar(50) DEFAULT NULL,
  `DIACHI` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giangvien`
--

INSERT INTO `giangvien` (`MAGV`, `MABOMON`, `TENGV`, `EMAIL`, `DIENTHOAI`, `DIACHI`) VALUES
('00241', 16, 'Nguyễn Hoàng Duy Thiện', 'duythien@tvu.edu.vn', '0912345678', '123 Đường ABC, Trà Vinh'),
('00242', 16, 'Dương Ngọc Vân Khanh', 'vankhanh@tvu.edu.vn', '0912345679', '456 Đường DEF, Trà Vinh'),
('00243', 16, 'Huỳnh Văn Thanh', 'vanthanh@tvu.edu.vn', '0912345680', '789 Đường GHI, Trà Vinh'),
('00244', 16, 'Nguyễn Nhứt Lam', 'nhutlam@tvu.edu.vn', '0912345681', '101 Đường JKL, Trà Vinh'),
('00245', 16, 'Anh Tư', 'annb@tvu.edu.vn', '0369258147', 'Mỹ'),
('00246', 16, 'Nguyễn Ngọc Đan Thanh', 'danthanh@tvu.edu.vn', '0912345682', '102 Đường MNO, Trà Vinh'),
('00248', 16, 'Hồ Hoàng Phúc Fix', 'duongminh@tvu.edu.vn', '0258741369', 'Đáy biển Đen'),
('00249', 16, 'Hà Thị Thúy Vi', 'Hattvi201084@tvu.edu.vn', '0123654987', 'Trà Vinh'),
('00250', 16, 'Võ Thanh C', 'vothanhc@tvu.edu.vn', '0912345683', '103 Đường PQR, Trà Vinh'),
('00251', 16, 'Trịnh Quốc Việt', 'quocviet@tvu.edu.vn', '0912345684', '104 Đường STU, Trà Vinh'),
('00252', 16, 'Trầm Hoàng Nam', 'hoangnam@tvu.edu.vn', '0912345685', '105 Đường VWX, Trà Vinh'),
('00253', 16, 'Đoàn Phước Miền', 'phuocmien@tvu.edu.vn', '0912345686', '106 Đường YZ, Trà Vinh'),
('00254', 16, 'Ngô Thanh Huy', 'huyngocntt@tvu.edu.vn', '0912345687', '107 Đường ABC, Trà Vinh'),
('00255', 16, 'Phạm Thị Trúc Mai', 'trucmai@tvu.edu.vn', '0912345688', '108 Đường DEF, Trà Vinh'),
('00257', 16, 'Nguyễn Mộng Hiền', 'hientvu@tvu.edu.vn', '0123456987', 'TV'),
('01027', 16, 'Nguyễn Khánh Duy', 'khanhduy@tvu.edu.vn', '0912345689', '109 Đường GHI, Trà Vinh'),
('0122', 16, 'Nguyễn Tín Thành', 'tinthanhtv2014@gmail.com', '0325698741', 'Sao Hỏa'),
('0123', 16, 'Hồ Hoàng Phúc', 'hohoangphucjob@gmail.com', '0327434821', 'Sao Hỏa'),
('01548', 16, 'Thạch Kọng SaOane', 'saone@tvu.edu.vn', '0912345690', '110 Đường JKL, Trà Vinh'),
('03539', 16, 'Lê Minh Tự', 'minhtu@tvu.edu.vn', '0912345691', '111 Đường MNO, Trà Vinh'),
('03546', 16, 'Phan Thị Phương Nam', 'phuongnam@tvu.edu.vn', '0912345692', '112 Đường PQR, Trà Vinh'),
('03562', 16, 'Nguyễn Khắc Quốc', 'khacquoc@tvu.edu.vn', '0912345693', '113 Đường STU, Trà Vinh'),
('11012', 2, 'Nguyễn Văn A', 'vana@tvu.edu.vn', '0912345694', '114 Đường VWX, Trà Vinh'),
('12700', 16, 'Khấu Văn Nhựt', 'vannhut@tvu.edu.vn', '0912345695', '115 Đường YZ, Trà Vinh'),
('12701', 16, 'Trần Văn Nam', 'vannam@tvu.edu.vn', '0912345696', '116 Đường ABC, Trà Vinh'),
('12702', 16, 'Nguyễn Thừa Phát Tài', 'phattai@tvu.edu.vn', '0912345697', '117 Đường DEF, Trà Vinh'),
('12705', 16, 'Lê Văn B', 'vanb@tvu.edu.vn', '0912345698', '118 Đường GHI, Trà Vinh'),
('14204', 16, 'Nguyễn Bá Nhiệm', 'banhiem@tvu.edu.vn', '0912345699', '119 Đường JKL, Trà Vinh'),
('99997', 16, 'Bảo Trưởng Khoa', 'baoquocone@gmail.com', '0325698741', 'Sao Hỏa'),
('99999', 16, 'Nguyễn Lâm Quốc Bảo', 'baoquoczero@gmail.com', '0987654321', 'Sao Hỏa'),
('GVNT22424', 16, 'Nguyễn Ngọc Đan Thanh', 'ngocdanthanhdt@tvu.edu.vn', '0325641789', 'Mặt Trăng'),
('GVNT8909', 18, 'Hana', 'hana@gmail.com', '3210456987', 'Bắc Cực');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giu_chuc_vu`
--

CREATE TABLE `giu_chuc_vu` (
  `MAGV` varchar(255) NOT NULL,
  `MACHUCVU` int(11) NOT NULL,
  `SOQUYETDINH` varchar(255) DEFAULT NULL,
  `TUNGAY` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giu_chuc_vu`
--

INSERT INTO `giu_chuc_vu` (`MAGV`, `MACHUCVU`, `SOQUYETDINH`, `TUNGAY`) VALUES
('00244', 9, NULL, NULL),
('00245', 2, '99', '2024-07-08'),
('00248', 8, '99', '2024-07-08'),
('00249', 1, '99', '2024-07-09'),
('00254', 1, '99', '2024-07-09'),
('00257', 1, '99', '2024-07-08'),
('0122', 1, '21', '2024-08-08'),
('01548', 8, NULL, NULL),
('12705', 8, NULL, NULL),
('14204', 8, NULL, NULL),
('99997', 6, '', '2024-09-20'),
('99999', 6, '', '2024-08-13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhthucdanhgia`
--

CREATE TABLE `hinhthucdanhgia` (
  `MADANHGIAKETTHUC` int(11) NOT NULL,
  `TENDANHGIA` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hinhthucdanhgia`
--

INSERT INTO `hinhthucdanhgia` (`MADANHGIAKETTHUC`, `TENDANHGIA`) VALUES
(1, 'Trắc nghiệm'),
(2, 'Tự luận'),
(3, 'Thực hành');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hockynienkhoa`
--

CREATE TABLE `hockynienkhoa` (
  `MAHKNK` int(11) NOT NULL,
  `TENHKNK` text DEFAULT NULL,
  `TEN_NAM_HOC` varchar(255) DEFAULT NULL,
  `NGAYBATDAUNIENKHOA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hockynienkhoa`
--

INSERT INTO `hockynienkhoa` (`MAHKNK`, `TENHKNK`, `TEN_NAM_HOC`, `NGAYBATDAUNIENKHOA`) VALUES
(23, 'Học Kì 1', 'Năm học 2020-2021', '2020-09-01'),
(24, 'Học Kì 2', 'Năm học 2020-2021', '2021-02-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `MAKHOA` int(11) NOT NULL,
  `TENKHOA` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khoa`
--

INSERT INTO `khoa` (`MAKHOA`, `TENKHOA`) VALUES
(1, 'Khoa Công Nghệ Thông Tin'),
(11, 'Khoa Kỹ Thuật Công Nghệ'),
(12, 'Ngoài trường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khunggiochuan`
--

CREATE TABLE `khunggiochuan` (
  `MAKHUNG` int(11) NOT NULL,
  `MACHUCDANH` int(11) NOT NULL,
  `TENKHUNGCHUAN` text DEFAULT NULL,
  `GIOGIANGDAY_HANHCHINH` int(11) DEFAULT NULL,
  `GIOGIANGDAY_CHUAN` int(11) DEFAULT NULL,
  `GIONGHIENCUUKHOAHOC_HANHCHINH` int(11) DEFAULT NULL,
  `GIONGHIENCUUKHOAHOC_CHUAN` int(11) DEFAULT NULL,
  `GIOPHUCVUCONGDONG_HANHCHINH` int(11) DEFAULT NULL,
  `GIOPHUCVUCONGDONG_CHUAN` int(11) DEFAULT NULL,
  `GHICHU` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khunggiochuan`
--

INSERT INTO `khunggiochuan` (`MAKHUNG`, `MACHUCDANH`, `TENKHUNGCHUAN`, `GIOGIANGDAY_HANHCHINH`, `GIOGIANGDAY_CHUAN`, `GIONGHIENCUUKHOAHOC_HANHCHINH`, `GIONGHIENCUUKHOAHOC_CHUAN`, `GIOPHUCVUCONGDONG_HANHCHINH`, `GIOPHUCVUCONGDONG_CHUAN`, `GHICHU`) VALUES
(10, 1, 'Khung 1', 630, 210, 855, 285, 275, 91, NULL),
(11, 1, 'Khung 2', 810, 270, 720, 240, 230, 76, NULL),
(12, 1, 'Khung 3', 990, 330, 585, 195, 185, 61, NULL),
(13, 2, 'Khung 1', 630, 210, 765, 255, 365, 121, NULL),
(14, 2, 'Khung 2', 810, 270, 630, 210, 320, 106, NULL),
(15, 2, 'Khung 3', 990, 330, 495, 165, 275, 91, NULL),
(16, 3, 'Khung 1', 630, 210, 675, 225, 455, 151, NULL),
(17, 3, 'Khung 2', 810, 270, 540, 180, 410, 136, NULL),
(18, 3, 'Khung 3', 990, 330, 405, 135, 365, 121, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_danh_muc`
--

CREATE TABLE `loai_danh_muc` (
  `MA_LOAI_DANH_MUC` int(11) NOT NULL,
  `TEN_LOAI_DANH_MUC` text DEFAULT NULL,
  `TRANG_THAI_DANH_MUC` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_danh_muc`
--

INSERT INTO `loai_danh_muc` (`MA_LOAI_DANH_MUC`, `TEN_LOAI_DANH_MUC`, `TRANG_THAI_DANH_MUC`) VALUES
(1, 'Điều 17. Quy đổi sản phẩm KH&CN là các báo cáo khoa học tại các hội thảo được tính giờ chuẩn NCKH', 'Đang áp dụng'),
(2, 'Điều 18. Quy đổi sản phẩm KH&CN là các sản phẩm SHTT', 'Đang áp dụng'),
(3, 'Điều 18. Quy đổi sản phẩm KH&CN là bài báo khoa học đăng trên các tạp chí khoa học được tính giờ chuẩn NCKH', 'Đang áp dụng'),
(4, 'Điều 19. Quy đổi sản phẩm KH&CN là sách phục vụ đào tạo được tính giờ chuẩn NCKH', 'Đang áp dụng'),
(5, 'Điều 20. Quy đổi hoạt động viết thuyết minh các đề tài, dự án, các hoạt động KH&CN khác được tính giờ chuẩn NCKH', 'Đang áp dụng'),
(6, 'Điều 21. Quy đổi các hoạt động thực hiện đề tài, dự án các cấp được tính giờ chuẩn NCKH', 'Đang áp dụng'),
(7, 'Điều 22. Quy đổi các hoạt động thể dục thể thao, sáng tác, biểu diễn nghệ thuật đặc thù được tính giờ chuẩn NCKH', 'Đang áp dụng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_tac_gia`
--

CREATE TABLE `loai_tac_gia` (
  `MA_LOAI_TAC_GIA` int(11) NOT NULL,
  `TEN_LOAI_TAC_GIA` text DEFAULT NULL,
  `DO_UU_TIEN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_tac_gia`
--

INSERT INTO `loai_tac_gia` (`MA_LOAI_TAC_GIA`, `TEN_LOAI_TAC_GIA`, `DO_UU_TIEN`) VALUES
(1, 'Tác giả thứ nhất', 1),
(2, 'Tác giả chịu trách nhiệm', 2),
(3, 'Tác giả còn lại', 3),
(4, 'Chủ đơn', 1),
(5, 'Đồng chủ đơn', 2),
(6, 'Chủ biên', 1),
(7, 'Đồng chủ biên', 2),
(8, 'Cá nhân', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop`
--

CREATE TABLE `lop` (
  `MALOP` varchar(255) NOT NULL,
  `MACHUONGTRINH` int(11) NOT NULL,
  `TENLOP` text DEFAULT NULL,
  `NAMTUYENSINH` int(11) DEFAULT NULL,
  `SISO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lop`
--

INSERT INTO `lop` (`MALOP`, `MACHUONGTRINH`, `TENLOP`, `NAMTUYENSINH`, `SISO`) VALUES
('DA20TTA', 1, 'Đại học Công nghệ thông tin A 2020', 2020, 30),
('DA20TTB', 1, 'Đại học Công nghệ thông tin B 2020', 2020, 44),
('DA21TTA', 1, 'Đại học Công nghệ thông tin A 2021', 2021, 44),
('DA21TTB', 1, 'Đại học Công nghệ thông tin B 2021', 2021, 46),
('DA21TTC', 1, 'Đại học Công nghệ thông tin C 2021', 2021, 46),
('DA22TTA', 1, 'Đại học Công nghệ thông tin A 2022', 2022, 50),
('DA22TTB', 1, 'Đại học Công nghệ thông tin B 2022', 2022, 47),
('DA22TTC', 1, 'Đại học Công nghệ thông tin C 2022', 2022, 47),
('DA22TTD', 1, 'Đại học Công nghệ thông tin D 2022', 2022, 53),
('DA23TTA', 1, 'Đại học Công nghệ thông tin A 2023', 2023, 48),
('DA23TTB', 1, 'Đại học Công nghệ thông tin B 2023', 2023, 53),
('DA23TTC', 1, 'Đại học Công nghệ thông tin C 2023', 2023, 50),
('DA23TTD', 1, 'Đại học Công nghệ thông tin D 2023', 2023, 48),
('DA24TTA', 1, 'Đại học Công nghệ thông tin A 2024', 2024, 45),
('DA24TTB', 1, 'Đại học Công nghệ thông tin B 2024', 2024, 39),
('DA24TTC', 1, 'Đại học Công nghệ thông tin C 2024', 2024, 42),
('DA24TTD', 1, 'Đại học Công nghệ thông tin D 2024', 2024, 43);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monhoc`
--

CREATE TABLE `monhoc` (
  `MAMONHOC` int(11) NOT NULL,
  `TENMONHOC` text DEFAULT NULL,
  `SOTINCHILYTHUYET` int(11) DEFAULT NULL,
  `SOTINCHITHUCHANH` int(11) DEFAULT NULL,
  `GHICHU` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `monhoc`
--

INSERT INTO `monhoc` (`MAMONHOC`, `TENMONHOC`, `SOTINCHILYTHUYET`, `SOTINCHITHUCHANH`, `GHICHU`) VALUES
(1, 'Giáo dục quốc phòng - An ninh', 2, 6, 'bb'),
(2, 'Giáo dục thể chất 1*', 0, 1, 'bb'),
(3, 'Triết học Mác - Lênin', 3, 0, 'bb'),
(4, 'Anh văn không chuyên 1', 2, 1, 'bb'),
(5, 'Pháp luật đại cương', 1, 1, 'bb'),
(6, 'Nhập môn công nghệ thông tin', 1, 1, 'bb'),
(7, 'Vi tích phân A1', 2, 1, 'bb'),
(8, 'Đại số tuyến tính', 1, 1, 'bb'),
(9, 'Kỹ thuật lập trình', 2, 2, 'bb'),
(10, 'Giáo dục thể chất 2*', 0, 1, 'bb'),
(11, 'Kinh tế chính trị Mác - Lênin', 2, 0, 'bb'),
(12, 'Anh văn không chuyên 2', 2, 2, 'bb'),
(13, 'Phương pháp NC khoa học', 1, 1, 'bb'),
(14, 'Tiếng Việt thực hành', 1, 1, 'bb'),
(15, 'Logic học đại cương', 1, 1, 'bb'),
(16, 'Toán rời rạc', 1, 1, 'bb'),
(17, 'Đại số đại cương', 1, 1, 'bb'),
(18, 'Cấu trúc dữ liệu và giải thuật', 2, 2, 'bb'),
(19, 'Giáo dục thể chất 3*', 0, 1, 'bb'),
(20, 'Chủ nghĩa xã hội khoa học', 2, 0, 'bb'),
(21, 'Anh văn không chuyên 3', 2, 1, 'bb'),
(22, 'Cơ sở dữ liệu', 2, 1, 'bb'),
(23, 'Vi tích phân A2', 2, 0, 'bb'),
(24, 'Lý thuyết đồ thị', 2, 1, 'bb'),
(25, 'Kiến trúc máy tính', 2, 1, 'bb'),
(26, 'Lập trình hướng đối tượng', 2, 1, 'bb'),
(27, 'Lịch sử Đảng cộng sản', 2, 0, 'bb'),
(28, 'Anh văn không chuyên 4', 2, 1, 'bb'),
(29, 'Hệ điều hành', 2, 1, 'bb'),
(30, 'Thiết kế Web', 2, 1, 'bb'),
(31, 'Mạng máy tính', 2, 1, 'bb'),
(32, 'Tiếng Anh chuyên ngành CNTT', 2, 1, 'bb'),
(33, 'Lý thuyết xếp hàng', 1, 1, 'tc'),
(34, 'Quy hoạch tuyến tính', 1, 1, 'tc'),
(35, 'Vật lý đại cương', 1, 1, 'tc'),
(36, 'Tư tưởng Hồ Chí Minh', 2, 0, 'bb'),
(37, 'Điện toán đám mây', 2, 1, 'tc'),
(38, 'Thống kê và Phân tích dữ liệu', 2, 1, 'bb'),
(39, 'Đồ án CSN', 0, 3, 'bb'),
(40, 'Chuyên đề Linux', 2, 1, 'bb'),
(41, 'Phân tích thiết kế hệ thống thông tin', 2, 1, 'bb'),
(42, 'Lập trình ứng dụng trên Windows', 2, 1, 'tc'),
(43, 'Thương mại điện tử', 2, 1, 'tc'),
(44, 'Đồ họa ứng dụng', 2, 1, 'tc'),
(45, 'An toàn và bảo mật thông tin', 2, 1, 'bb'),
(46, 'Công nghệ phần mềm', 2, 1, 'bb'),
(47, 'Lập trình thiết bị di động', 2, 1, 'bb'),
(48, 'Khai khoáng dữ liệu', 2, 1, 'bb'),
(49, 'Cơ sở trí tuệ nhân tạo', 2, 1, 'bb'),
(50, 'Hệ quản trị cơ sở dữ liệu', 2, 1, 'bb'),
(51, 'Nguyên lý kế toán', 1, 1, 'tc'),
(52, 'Kĩ thuật xây dựng và ban hành văn bản', 1, 1, 'tc'),
(53, 'Tâm lí học đại cương', 1, 1, 'tc'),
(54, 'Quản trị doanh nghiệp', 1, 1, 'tc'),
(55, 'Phát triển ứng dụng Web với mã nguồn mở', 2, 1, 'bb'),
(56, 'Xây dựng phần mềm HĐT', 2, 1, 'bb'),
(57, 'Phát triển ứng dụng hướng dịch vụ', 2, 1, 'bb'),
(58, 'Quản trị dự án công nghệ thông tin', 2, 1, 'bb'),
(59, 'Đồ án chuyên ngành', 0, 3, 'bb'),
(60, 'Xử lý ảnh', 2, 1, 'bb'),
(61, 'Tương tác người máy', 2, 1, 'tc'),
(62, 'Hệ hỗ trợ ra quyết định', 2, 1, 'tc'),
(63, 'Chuyên đề ASP.net', 2, 1, 'tc'),
(64, 'Blockchaine', 2, 1, 'tc'),
(65, 'Máy học ứng dụng', 2, 1, 'bb'),
(66, 'Thực tập tốt nghiệp', 0, 3, 'bb'),
(67, 'Khóa luận tốt nghiệp', 0, 7, 'bb'),
(68, 'Hệ thống thông tin quản lý', 2, 1, 'bb'),
(69, 'Thị giác máy tính', 2, 2, 'bb'),
(70, 'Những nguyên lý cơ bản của Chủ nghĩa Mác - Lênin', 5, 0, 'bb'),
(71, 'Giáo dục thể chất 1', 0, 1, 'bb'),
(72, 'Giáo dục Quốc phòng- An ninh', 2, 6, 'bb'),
(73, 'Tin học đại cương', 1, 2, 'bb'),
(74, 'Nhập môn ngành công nghệ kỹ thuật cơ khí', 1, 1, 'bb'),
(75, 'Toán cao cấp A1', 2, 1, 'bb'),
(76, 'Vật lý đại cương A1', 2, 1, 'bb'),
(77, 'Giáo dục thể chất 2', 0, 1, 'bb'),
(78, 'Toán cao cấp A2', 1, 1, 'bb'),
(79, 'Vật lý đại cương A2', 2, 1, 'bb'),
(80, 'Hình họa - Vẽ kỹ thuật', 1, 1, 'bb'),
(81, 'Dung sai – kỹ thuật đo', 1, 1, 'bb'),
(82, 'An toàn lao động và môi trường công nghiệp', 2, 0, 'bb'),
(83, 'Tâm lý học đại cương', 1, 1, 'tc'),
(84, 'Maketing căn bản', 1, 1, 'tc'),
(85, 'Tiếng Việt thực hành ', 1, 1, 'tc'),
(86, 'Kinh tế học đại cương', 2, 0, 'tc'),
(87, 'Giáo dục thể chất 3', 0, 1, 'bb'),
(88, 'Đường lối cách mạng của Đảng Cộng sản Việt Nam', 3, 0, 'bb'),
(89, 'Phương pháp Nghiên cứu khoa học', 1, 1, 'bb'),
(90, 'Cơ lý thuyết', 2, 0, 'bb'),
(91, 'Thực hành nguội ', 0, 2, 'bb'),
(92, 'Vật liệu cơ khí', 2, 0, 'bb'),
(93, 'Văn hóa Việt Nam', 1, 1, 'tc'),
(94, 'Kỹ năng chăm sóc khách hàng', 1, 1, 'tc'),
(95, 'Kỹ năng giao tiếp', 1, 1, 'tc'),
(96, 'Tư duy hệ thống', 1, 1, 'tc'),
(97, 'Xác suất thống kê', 1, 1, 'bb'),
(98, 'Kỹ thuật nhiệt         ', 2, 0, 'bb'),
(99, 'Vẽ Kỹ thuật với CAD', 1, 1, 'bb'),
(100, 'Kỹ thuật điện – điện tử      ', 2, 1, 'bb'),
(101, 'Sức bền vật liệu', 1, 1, 'bb'),
(102, 'Nguyên lý - Chi tiết máy ', 3, 0, 'bb'),
(103, 'Đồ án nguyên lý- chi tiết máy', 0, 1, 'bb'),
(104, 'Cơ sở Công nghệ chế tạo máy', 2, 0, 'tc'),
(105, 'Cơ học lưu chất', 2, 0, 'tc'),
(106, 'Kỹ thuật số ', 1, 1, 'tc'),
(107, 'Tổ chức quản lý kinh tế kỹ thuật', 2, 0, 'tc'),
(108, 'Thực hành cơ khí cơ bản', 0, 2, 'tc'),
(109, 'Nguyên lý động cơ đốt trong', 2, 1, 'bb'),
(110, 'Lý thuyết ô tô', 3, 0, 'bb'),
(111, 'Thực hành hệ thống truyền động ô tô', 0, 3, 'bb'),
(112, 'Hệ thống điện động cơ', 2, 2, 'bb'),
(113, 'Kỹ thuật máy nâng vận chuyển', 2, 0, 'tc'),
(114, 'Cảm biến trên ô tô', 1, 1, 'tc'),
(115, 'Vi điều khiển', 1, 1, 'tc'),
(116, 'Kỹ thuật khí nén – Thủy lực', 1, 1, 'tc'),
(117, 'Dao động trong kỹ thuật', 2, 0, 'tc'),
(118, 'Kết cấu và tính toán động cơ đốt trong', 2, 1, 'bb'),
(119, 'Thực hành Động cơ đốt trong', 0, 4, 'bb'),
(120, 'Hệ thống điện thân xe ', 2, 2, 'bb'),
(121, 'Kết cấu tính toán ô tô', 2, 1, 'bb'),
(122, 'Anh văn chuyên ngành ô tô', 2, 0, 'tc'),
(123, 'Chẩn đoán và bảo trì động cơ', 1, 1, 'tc'),
(124, 'Thí nghiệm điện – điện tử ô tô', 0, 2, 'tc'),
(125, 'Ô tô điện', 1, 1, 'tc'),
(126, 'Ô tô và môi trường', 1, 1, 'tc'),
(127, 'Hệ thống điều hòa không khí trên ô tô', 0, 2, 'tc'),
(128, 'Thực hành hệ thống vận hành và điều khiển ô tô', 0, 3, 'bb'),
(129, 'Đồ án chuyên ngành ô tô', 0, 1, 'bb'),
(130, 'Hệ thống điều khiển động cơ', 2, 2, 'bb'),
(131, 'Thực tập xí nghiệp', 0, 2, 'bb'),
(132, 'Kỹ thuật mô tô xe máy', 0, 2, 'tc'),
(133, 'Kiểm định và Chẩn đoán kỹ thuật ô tô', 1, 1, 'tc'),
(134, 'Xe chuyên dùng', 0, 2, 'tc'),
(135, 'Ô tô Hybrid', 1, 1, 'tc'),
(136, 'Hệ thống định vị ô tô (GPS)', 1, 1, 'tc'),
(137, 'Ô tô sử dụng năng lượng mới', 1, 1, 'tc'),
(138, 'Đồ án tốt nghiệp ', 0, 7, 'bb'),
(139, 'Chuyên đề tính toán, thiết kế ô tô', 1, 1, 'bb'),
(140, 'Chuyên đề hệ thống điều khiển ô tô', 2, 1, 'bb'),
(141, 'Chuyên đề công nghệ mới trên ô tô', 1, 1, 'bb'),
(142, 'An toàn lao động và môi trường CN', 2, 0, 'bb'),
(143, 'Anh văn chuyên ngành cơ khí', 2, 0, 'tc'),
(144, 'Quản trị sản xuất và chất lượng', 2, 0, 'tc'),
(145, 'Thí nghiệm cơ học', 0, 1, 'bb'),
(146, 'Trang bị điện, Điện tử trong máy công nghiệp', 1, 1, 'bb'),
(147, 'Thực hành hàn', 0, 2, 'bb'),
(148, 'Thực hành tiện 1', 0, 3, 'bb'),
(149, 'Công nghệ nano', 2, 0, 'tc'),
(150, 'Tối ưu hóa trong kỹ thuật', 2, 0, 'tc'),
(151, 'Kỹ thuật độ tin cậy', 2, 0, 'tc'),
(152, 'Điều khiển tự động', 1, 1, 'tc'),
(153, 'Công nghệ chế tạo máy', 2, 0, 'bb'),
(154, 'Đồ án Công nghệ chế tạo máy', 0, 1, 'bb'),
(155, 'Công nghệ kim loại', 2, 0, 'bb'),
(156, 'Công nghệ khí nén – Thủy lực', 2, 1, 'bb'),
(157, 'Thực hành tiện 2', 0, 3, 'bb'),
(158, 'Thực hành phay', 0, 2, 'bb'),
(159, 'Bảo trì và bảo dưỡng công nghiệp', 1, 1, 'tc'),
(160, 'Công nghệ khuôn mẫu', 2, 0, 'tc'),
(161, 'Máy chế biến lương thực', 2, 0, 'tc'),
(162, 'Công nghệ và thiết bị sấy', 2, 0, 'tc'),
(163, 'Máy cắt kim loại', 2, 0, 'bb'),
(164, 'Tự động hóa quá trình sản xuất', 1, 1, 'bb'),
(165, 'Công nghệ CAD/CAM/CNC', 1, 1, 'bb'),
(166, 'Thực hành CNC', 0, 2, 'bb'),
(167, 'Robot công nghiệp', 1, 1, 'bb'),
(168, 'Thiết kế sản phẩm công nghiệp', 1, 1, 'tc'),
(169, 'Ma sát học', 2, 0, 'tc'),
(170, 'Thiết kế mô phỏng hệ thống máy', 1, 1, 'tc'),
(171, 'Năng lượng và quản lý năng lượng', 2, 0, 'tc'),
(172, 'Các phương pháp gia công đặc biệt', 2, 0, 'tc'),
(173, 'Hoặc học bổ sung kiến thức:', 4, 3, 'bb'),
(174, 'Chuyên đề tính toán, thiết kế trong cơ khí', 1, 1, 'bb'),
(175, 'Chuyên đề các phương pháp gia công mới', 2, 1, 'bb'),
(176, 'Chuyên đề công nghệ và vật liệu mới', 1, 1, 'bb'),
(177, 'Giáo dục thể chất 1 ', 0, 1, 'bb'),
(178, 'Những nguyên lý cơ bản của  Chủ nghĩa Mác - Lênin ', 5, 0, 'bb'),
(179, 'Anh văn không chuyên 1 ', 2, 2, 'bb'),
(180, 'Tin học đại cương ', 1, 2, 'bb'),
(181, 'Pháp luật đại cương ', 1, 1, 'bb'),
(182, 'Đại số tuyến tính ', 1, 1, 'bb'),
(183, 'Toán cao cấp A1 ', 2, 1, 'bb'),
(184, 'Vật lý đại cương A1 ', 2, 1, 'bb'),
(185, 'Giáo dục thể chất 2 ', 0, 1, 'bb'),
(186, 'Nhập môn ngành công nghệ  kỹ thuật Điện ', 1, 1, 'bb'),
(187, 'Anh văn không chuyên 2 ', 2, 1, 'bb'),
(188, 'Tư tưởng Hồ Chí Minh ', 2, 0, 'bb'),
(189, 'Toán cao cấp A2 ', 1, 1, 'bb'),
(190, 'Môi trường và con người ', 2, 0, 'bb'),
(191, 'Vật lý đại cương A2 ', 2, 1, 'bb'),
(192, 'Vẽ kỹ thuật điện với CAD ', 1, 2, 'bb'),
(193, 'Mạch điện 1 ', 3, 0, 'bb'),
(194, 'Giáo dục thể chất 3 ', 0, 1, 'bb'),
(195, 'Đường lối cách mạng của  Đảng Cộng sản Việt Nam ', 3, 0, 'bb'),
(196, 'Anh văn không chuyên 3 ', 2, 1, 'bb'),
(197, 'Thực hành Điện cơ bản ', 0, 2, 'bb'),
(198, 'Điện tử cơ bản ', 3, 0, 'bb'),
(199, 'Hàm biến phức và phép biến  đổi Laplace ', 2, 0, 'tc'),
(200, 'Kỹ thuật lập trình ', 1, 1, 'tc'),
(201, 'Khởi tạo doanh nghiệp ', 1, 1, 'tc'),
(202, 'Hoá học đại cương ', 3, 1, 'tc'),
(203, 'Xác suất thống kê ', 1, 1, 'tc'),
(204, 'Anh văn chuyên ngành ', 1, 1, 'bb'),
(205, 'Đo lường điện ', 2, 0, 'bb'),
(206, 'Vi mạch tương tự và số ', 3, 0, 'bb'),
(207, 'An toàn điện ', 2, 0, 'bb'),
(208, 'Mạch điện 2 (MĐ 2) ', 2, 0, 'bb'),
(209, 'Thiết bị điện trong truyền tải  và phân phối điện ', 2, 0, 'bb'),
(210, 'Vật liệu điện ', 2, 0, 'bb'),
(211, 'Máy điện 1 ', 3, 0, 'bb'),
(212, 'Thực hành điện tử cơ bản ', 0, 1, 'bb'),
(213, 'Máy điện 2 ', 2, 0, 'bb'),
(214, 'Kỹ thuật điều khiển tự động ', 2, 0, 'bb'),
(215, 'Đồ án máy điện ', 0, 1, 'bb'),
(216, 'Điện tử công suất ', 3, 0, 'bb'),
(217, 'Trang bị điện ', 2, 0, 'bb'),
(218, 'Mạng cung cấp điện ', 3, 0, 'bb'),
(219, 'Phương pháp nghiên cứu khoa  học ', 1, 1, 'bb'),
(220, 'Thực hành đo lường điện ', 0, 1, 'bb'),
(221, 'Thực hành vi mạch ', 0, 1, 'bb'),
(222, 'Vi điều khiển ', 2, 0, 'bb'),
(223, 'Thí nghiệm máy điện ', 0, 2, 'bb'),
(224, 'Ngắn mạch trong hệ thống  điện ', 3, 0, 'bb'),
(225, 'Đồ án điện tử công suất ', 0, 1, 'bb'),
(226, 'Thực hành Điện tử công suất ', 0, 2, 'bb'),
(227, 'Truyền động điện ', 2, 0, 'bb'),
(228, 'Thực hành trang bị điện – khí  nén ', 0, 3, 'bb'),
(229, 'Đồ án Mạng cung cấp điện ', 0, 1, 'bb'),
(230, 'Thực hành cảm biến ', 0, 2, 'bb'),
(231, 'Thực hành PLC ', 0, 3, 'bb'),
(232, 'Lập trình giao diện điều khiển  người – máy (HMI) ', 0, 2, 'bb'),
(233, 'Thực hành Vi điều khiển ', 0, 2, 'tc'),
(234, 'Truyền số liệu ', 2, 0, 'tc'),
(235, 'Thực hành máy điện ', 0, 2, 'tc'),
(236, 'Đo lường và điều khiển bằng  máy tính ', 2, 0, 'tc'),
(237, 'Tự động hoá quá trình sản  xuất ', 2, 0, 'tc'),
(238, 'Máy điện đặc biệt trong các  thiết bị tự động ', 2, 0, 'tc'),
(239, 'Năng lượng tái tạo ', 2, 0, 'tc'),
(240, 'Quản lý dự án công trình điện ', 2, 0, 'tc'),
(241, 'Thiết kế chiếu sáng ', 2, 0, 'bb'),
(242, 'Thực hành Điều khiển động  cơ bằng biến tần ', 0, 2, 'bb'),
(243, 'Thực tập tốt nghiệp ', 0, 3, 'bb'),
(244, 'Kỹ thuật thuỷ khí ', 2, 0, 'tc'),
(245, 'Bảo vệ rơ le trong hệ thống  điện ', 3, 0, 'tc'),
(246, 'Phần điện trong nhà máy điện  và trạm biến áp ', 3, 0, 'tc'),
(247, 'Robot công nghiệp ', 2, 0, 'tc'),
(248, 'Thiết kế máy biến áp ', 2, 0, 'tc'),
(249, 'CAD trong điện công nghiệp ', 0, 2, 'tc'),
(250, 'Kỹ thuật cao áp ', 2, 0, 'tc'),
(251, 'Thực hành Mạng cung cấp  điện ', 0, 2, 'tc'),
(252, 'Quản trị công nghiệp ', 2, 0, 'tc'),
(253, '- Mạng truyền thông và điều  khiển công nghiệp (CC ', 1, 2, 'bb'),
(254, '- Giải tích và điều khiển  máy điện ', 4, 0, 'bb');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `namhoc`
--

CREATE TABLE `namhoc` (
  `MANAMHOC` int(11) NOT NULL,
  `TENNAMHOC` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `namhoc`
--

INSERT INTO `namhoc` (`MANAMHOC`, `TENNAMHOC`) VALUES
(5, 'Năm học 2020-2021'),
(6, 'Năm học 2021-2022'),
(7, 'Năm học 2022-2023'),
(8, 'Năm học 2023-2024'),
(9, 'Năm Học 2024-2025');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nghien_cuu_kh`
--

CREATE TABLE `nghien_cuu_kh` (
  `TEN_DE_TAI` varchar(255) NOT NULL,
  `THOI_GIAN_DANG_KY` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phan_cong_gv_tu_dong`
--

CREATE TABLE `phan_cong_gv_tu_dong` (
  `MAPCGVTD` int(11) NOT NULL,
  `MAGV_PCGVTD` varchar(255) DEFAULT NULL,
  `MA_MON_HOC_PCGVTD` varchar(255) DEFAULT NULL,
  `MA_LOP_PCGVTD` varchar(255) DEFAULT NULL,
  `DO_UU_TIEN_PCGVTD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phan_cong_gv_tu_dong`
--

INSERT INTO `phan_cong_gv_tu_dong` (`MAPCGVTD`, `MAGV_PCGVTD`, `MA_MON_HOC_PCGVTD`, `MA_LOP_PCGVTD`, `DO_UU_TIEN_PCGVTD`) VALUES
(1, '00241', '36', 'DA21TTA', '60'),
(2, '00241', '37', 'DA21TTA', '60'),
(3, '00241', '38', 'DA21TTA', '60'),
(4, '00241', '39', 'DA21TTA', '60'),
(5, '00241', '40', 'DA21TTA', '60'),
(6, '00241', '41', 'DA21TTA', '60'),
(7, '00241', '42', 'DA21TTA', '60'),
(8, '00241', '43', 'DA21TTA', '60'),
(9, '00241', '44', 'DA21TTA', '60'),
(10, '00242', '36', 'DA21TTA', '60'),
(11, '00242', '37', 'DA21TTA', '60'),
(12, '00242', '38', 'DA21TTA', '60'),
(13, '00242', '39', 'DA21TTA', '60'),
(14, '00242', '40', 'DA21TTA', '60'),
(15, '00242', '41', 'DA21TTA', '60'),
(16, '00242', '42', 'DA21TTA', '60'),
(17, '00242', '43', 'DA21TTA', '60'),
(18, '00242', '44', 'DA21TTA', '60'),
(19, '00243', '36', 'DA21TTA', '60'),
(20, '00243', '37', 'DA21TTA', '60'),
(21, '00243', '38', 'DA21TTA', '60'),
(22, '00243', '39', 'DA21TTA', '60'),
(23, '00243', '40', 'DA21TTA', '60'),
(24, '00243', '41', 'DA21TTA', '60'),
(25, '00243', '42', 'DA21TTA', '60'),
(26, '00243', '43', 'DA21TTA', '60'),
(27, '00243', '44', 'DA21TTA', '60'),
(28, '00244', '36', 'DA21TTA', '60'),
(29, '00244', '37', 'DA21TTA', '60'),
(30, '00244', '38', 'DA21TTA', '60'),
(31, '00244', '39', 'DA21TTA', '60'),
(32, '00244', '40', 'DA21TTA', '60'),
(33, '00244', '41', 'DA21TTA', '60'),
(34, '00244', '42', 'DA21TTA', '60'),
(35, '00244', '43', 'DA21TTA', '60'),
(36, '00244', '44', 'DA21TTA', '60'),
(37, '00245', '36', 'DA21TTA', '60'),
(38, '00245', '37', 'DA21TTA', '60'),
(39, '00245', '38', 'DA21TTA', '60'),
(40, '00245', '39', 'DA21TTA', '60'),
(41, '00245', '40', 'DA21TTA', '60'),
(42, '00245', '41', 'DA21TTA', '60'),
(43, '00245', '42', 'DA21TTA', '60'),
(44, '00245', '43', 'DA21TTA', '60'),
(45, '00245', '44', 'DA21TTA', '60'),
(46, '00246', '36', 'DA21TTA', '60'),
(47, '00246', '37', 'DA21TTA', '60'),
(48, '00246', '38', 'DA21TTA', '60'),
(49, '00246', '39', 'DA21TTA', '60'),
(50, '00246', '40', 'DA21TTA', '60'),
(51, '00246', '41', 'DA21TTA', '60'),
(52, '00246', '42', 'DA21TTA', '60'),
(53, '00246', '43', 'DA21TTA', '60'),
(54, '00246', '44', 'DA21TTA', '60'),
(55, '00248', '36', 'DA21TTA', '60'),
(56, '00248', '37', 'DA21TTA', '60'),
(57, '00248', '38', 'DA21TTA', '60'),
(58, '00248', '39', 'DA21TTA', '60'),
(59, '00248', '40', 'DA21TTA', '60'),
(60, '00248', '41', 'DA21TTA', '60'),
(61, '00248', '42', 'DA21TTA', '60'),
(62, '00248', '43', 'DA21TTA', '60'),
(63, '00248', '44', 'DA21TTA', '60'),
(64, '00249', '36', 'DA21TTA', '60'),
(65, '00249', '37', 'DA21TTA', '60'),
(66, '00249', '38', 'DA21TTA', '60'),
(67, '00249', '39', 'DA21TTA', '60'),
(68, '00249', '40', 'DA21TTA', '60'),
(69, '00249', '41', 'DA21TTA', '60'),
(70, '00249', '42', 'DA21TTA', '60'),
(71, '00249', '43', 'DA21TTA', '60'),
(72, '00249', '44', 'DA21TTA', '60'),
(73, '00250', '36', 'DA21TTA', '60'),
(74, '00250', '37', 'DA21TTA', '60'),
(75, '00250', '38', 'DA21TTA', '60'),
(76, '00250', '39', 'DA21TTA', '60'),
(77, '00250', '40', 'DA21TTA', '60'),
(78, '00250', '41', 'DA21TTA', '60'),
(79, '00250', '42', 'DA21TTA', '60'),
(80, '00250', '43', 'DA21TTA', '60'),
(81, '00250', '44', 'DA21TTA', '60'),
(82, '00251', '36', 'DA21TTA', '60'),
(83, '00251', '37', 'DA21TTA', '60'),
(84, '00251', '38', 'DA21TTA', '60'),
(85, '00251', '39', 'DA21TTA', '60'),
(86, '00251', '40', 'DA21TTA', '60'),
(87, '00251', '41', 'DA21TTA', '60'),
(88, '00251', '42', 'DA21TTA', '60'),
(89, '00251', '43', 'DA21TTA', '60'),
(90, '00251', '44', 'DA21TTA', '60'),
(91, '00252', '36', 'DA21TTA', '60'),
(92, '00252', '37', 'DA21TTA', '60'),
(93, '00252', '38', 'DA21TTA', '60'),
(94, '00252', '39', 'DA21TTA', '60'),
(95, '00252', '40', 'DA21TTA', '60'),
(96, '00252', '41', 'DA21TTA', '60'),
(97, '00252', '42', 'DA21TTA', '60'),
(98, '00252', '43', 'DA21TTA', '60'),
(99, '00252', '44', 'DA21TTA', '60'),
(100, '00253', '36', 'DA21TTA', '60'),
(101, '00253', '37', 'DA21TTA', '60'),
(102, '00253', '38', 'DA21TTA', '60'),
(103, '00253', '39', 'DA21TTA', '60'),
(104, '00253', '40', 'DA21TTA', '60'),
(105, '00253', '41', 'DA21TTA', '60'),
(106, '00253', '42', 'DA21TTA', '60'),
(107, '00253', '43', 'DA21TTA', '60'),
(108, '00253', '44', 'DA21TTA', '60'),
(109, '00254', '36', 'DA21TTA', '60'),
(110, '00254', '37', 'DA21TTA', '60'),
(111, '00254', '38', 'DA21TTA', '60'),
(112, '00254', '39', 'DA21TTA', '60'),
(113, '00254', '40', 'DA21TTA', '60'),
(114, '00254', '41', 'DA21TTA', '60'),
(115, '00254', '42', 'DA21TTA', '60'),
(116, '00254', '43', 'DA21TTA', '60'),
(117, '00254', '44', 'DA21TTA', '60'),
(118, '00255', '36', 'DA21TTA', '60'),
(119, '00255', '37', 'DA21TTA', '60'),
(120, '00255', '38', 'DA21TTA', '60'),
(121, '00255', '39', 'DA21TTA', '60'),
(122, '00255', '40', 'DA21TTA', '60'),
(123, '00255', '41', 'DA21TTA', '60'),
(124, '00255', '42', 'DA21TTA', '60'),
(125, '00255', '43', 'DA21TTA', '60'),
(126, '00255', '44', 'DA21TTA', '60'),
(127, '00257', '36', 'DA21TTA', '60'),
(128, '00257', '37', 'DA21TTA', '60'),
(129, '00257', '38', 'DA21TTA', '60'),
(130, '00257', '39', 'DA21TTA', '60'),
(131, '00257', '40', 'DA21TTA', '60'),
(132, '00257', '41', 'DA21TTA', '60'),
(133, '00257', '42', 'DA21TTA', '60'),
(134, '00257', '43', 'DA21TTA', '60'),
(135, '00257', '44', 'DA21TTA', '60'),
(136, '01027', '36', 'DA21TTA', '60'),
(137, '01027', '37', 'DA21TTA', '60'),
(138, '01027', '38', 'DA21TTA', '60'),
(139, '01027', '39', 'DA21TTA', '60'),
(140, '01027', '40', 'DA21TTA', '60'),
(141, '01027', '41', 'DA21TTA', '60'),
(142, '01027', '42', 'DA21TTA', '60'),
(143, '01027', '43', 'DA21TTA', '60'),
(144, '01027', '44', 'DA21TTA', '60'),
(145, '0122', '36', 'DA21TTA', '60'),
(146, '0122', '37', 'DA21TTA', '60'),
(147, '0122', '38', 'DA21TTA', '60'),
(148, '0122', '39', 'DA21TTA', '60'),
(149, '0122', '40', 'DA21TTA', '60'),
(150, '0122', '41', 'DA21TTA', '60'),
(151, '0122', '42', 'DA21TTA', '60'),
(152, '0122', '43', 'DA21TTA', '60'),
(153, '0122', '44', 'DA21TTA', '60'),
(154, '0123', '36', 'DA21TTA', '60'),
(155, '0123', '37', 'DA21TTA', '60'),
(156, '0123', '38', 'DA21TTA', '60'),
(157, '0123', '39', 'DA21TTA', '60'),
(158, '0123', '40', 'DA21TTA', '60'),
(159, '0123', '41', 'DA21TTA', '60'),
(160, '0123', '42', 'DA21TTA', '60'),
(161, '0123', '43', 'DA21TTA', '60'),
(162, '0123', '44', 'DA21TTA', '60'),
(163, '01548', '36', 'DA21TTA', '60'),
(164, '01548', '37', 'DA21TTA', '60'),
(165, '01548', '38', 'DA21TTA', '60'),
(166, '01548', '39', 'DA21TTA', '60'),
(167, '01548', '40', 'DA21TTA', '60'),
(168, '01548', '41', 'DA21TTA', '60'),
(169, '01548', '42', 'DA21TTA', '60'),
(170, '01548', '43', 'DA21TTA', '60'),
(171, '01548', '44', 'DA21TTA', '60'),
(172, '03539', '36', 'DA21TTA', '60'),
(173, '03539', '37', 'DA21TTA', '60'),
(174, '03539', '38', 'DA21TTA', '60'),
(175, '03539', '39', 'DA21TTA', '60'),
(176, '03539', '40', 'DA21TTA', '60'),
(177, '03539', '41', 'DA21TTA', '60'),
(178, '03539', '42', 'DA21TTA', '60'),
(179, '03539', '43', 'DA21TTA', '60'),
(180, '03539', '44', 'DA21TTA', '60'),
(181, '03546', '36', 'DA21TTA', '60'),
(182, '03546', '37', 'DA21TTA', '60'),
(183, '03546', '38', 'DA21TTA', '60'),
(184, '03546', '39', 'DA21TTA', '60'),
(185, '03546', '40', 'DA21TTA', '60'),
(186, '03546', '41', 'DA21TTA', '60'),
(187, '03546', '42', 'DA21TTA', '60'),
(188, '03546', '43', 'DA21TTA', '60'),
(189, '03546', '44', 'DA21TTA', '60'),
(190, '03562', '36', 'DA21TTA', '60'),
(191, '03562', '37', 'DA21TTA', '60'),
(192, '03562', '38', 'DA21TTA', '60'),
(193, '03562', '39', 'DA21TTA', '60'),
(194, '03562', '40', 'DA21TTA', '60'),
(195, '03562', '41', 'DA21TTA', '60'),
(196, '03562', '42', 'DA21TTA', '60'),
(197, '03562', '43', 'DA21TTA', '60'),
(198, '03562', '44', 'DA21TTA', '60'),
(199, '12700', '36', 'DA21TTA', '60'),
(200, '12700', '37', 'DA21TTA', '60'),
(201, '12700', '38', 'DA21TTA', '60'),
(202, '12700', '39', 'DA21TTA', '60'),
(203, '12700', '40', 'DA21TTA', '60'),
(204, '12700', '41', 'DA21TTA', '60'),
(205, '12700', '42', 'DA21TTA', '60'),
(206, '12700', '43', 'DA21TTA', '60'),
(207, '12700', '44', 'DA21TTA', '60'),
(208, '12701', '36', 'DA21TTA', '60'),
(209, '12701', '37', 'DA21TTA', '60'),
(210, '12701', '38', 'DA21TTA', '60'),
(211, '12701', '39', 'DA21TTA', '60'),
(212, '12701', '40', 'DA21TTA', '60'),
(213, '12701', '41', 'DA21TTA', '60'),
(214, '12701', '42', 'DA21TTA', '60'),
(215, '12701', '43', 'DA21TTA', '60'),
(216, '12701', '44', 'DA21TTA', '60'),
(217, '12702', '36', 'DA21TTA', '60'),
(218, '12702', '37', 'DA21TTA', '60'),
(219, '12702', '38', 'DA21TTA', '60'),
(220, '12702', '39', 'DA21TTA', '60'),
(221, '12702', '40', 'DA21TTA', '60'),
(222, '12702', '41', 'DA21TTA', '60'),
(223, '12702', '42', 'DA21TTA', '60'),
(224, '12702', '43', 'DA21TTA', '60'),
(225, '12702', '44', 'DA21TTA', '60'),
(226, '12705', '36', 'DA21TTA', '60'),
(227, '12705', '37', 'DA21TTA', '60'),
(228, '12705', '38', 'DA21TTA', '60'),
(229, '12705', '39', 'DA21TTA', '60'),
(230, '12705', '40', 'DA21TTA', '60'),
(231, '12705', '41', 'DA21TTA', '60'),
(232, '12705', '42', 'DA21TTA', '60'),
(233, '12705', '43', 'DA21TTA', '60'),
(234, '12705', '44', 'DA21TTA', '60'),
(235, '14204', '36', 'DA21TTA', '60'),
(236, '14204', '37', 'DA21TTA', '60'),
(237, '14204', '38', 'DA21TTA', '60'),
(238, '14204', '39', 'DA21TTA', '60'),
(239, '14204', '40', 'DA21TTA', '60'),
(240, '14204', '41', 'DA21TTA', '60'),
(241, '14204', '42', 'DA21TTA', '60'),
(242, '14204', '43', 'DA21TTA', '60'),
(243, '14204', '44', 'DA21TTA', '60'),
(244, '99997', '36', 'DA21TTA', '60'),
(245, '99997', '37', 'DA21TTA', '60'),
(246, '99997', '38', 'DA21TTA', '60'),
(247, '99997', '39', 'DA21TTA', '60'),
(248, '99997', '40', 'DA21TTA', '60'),
(249, '99997', '41', 'DA21TTA', '60'),
(250, '99997', '42', 'DA21TTA', '60'),
(251, '99997', '43', 'DA21TTA', '60'),
(252, '99997', '44', 'DA21TTA', '60'),
(253, '99999', '36', 'DA21TTA', '60'),
(254, '99999', '37', 'DA21TTA', '60'),
(255, '99999', '38', 'DA21TTA', '60'),
(256, '99999', '39', 'DA21TTA', '75'),
(257, '99999', '40', 'DA21TTA', '60'),
(258, '99999', '41', 'DA21TTA', '60'),
(259, '99999', '42', 'DA21TTA', '60'),
(260, '99999', '43', 'DA21TTA', '60'),
(261, '99999', '44', 'DA21TTA', '60'),
(262, 'GVNT22424', '36', 'DA21TTA', '60'),
(263, 'GVNT22424', '37', 'DA21TTA', '60'),
(264, 'GVNT22424', '38', 'DA21TTA', '60'),
(265, 'GVNT22424', '39', 'DA21TTA', '60'),
(266, 'GVNT22424', '40', 'DA21TTA', '60'),
(267, 'GVNT22424', '41', 'DA21TTA', '60'),
(268, 'GVNT22424', '42', 'DA21TTA', '60'),
(269, 'GVNT22424', '43', 'DA21TTA', '60'),
(270, 'GVNT22424', '44', 'DA21TTA', '60'),
(271, '00241', '55', 'DA20TTA', '60'),
(272, '00241', '56', 'DA20TTA', '60'),
(273, '00241', '57', 'DA20TTA', '60'),
(274, '00241', '58', 'DA20TTA', '60'),
(275, '00241', '59', 'DA20TTA', '60'),
(276, '00241', '60', 'DA20TTA', '60'),
(277, '00241', '61', 'DA20TTA', '60'),
(278, '00241', '62', 'DA20TTA', '60'),
(279, '00241', '63', 'DA20TTA', '60'),
(280, '00241', '64', 'DA20TTA', '60'),
(281, '00242', '55', 'DA20TTA', '60'),
(282, '00242', '56', 'DA20TTA', '60'),
(283, '00242', '57', 'DA20TTA', '60'),
(284, '00242', '58', 'DA20TTA', '60'),
(285, '00242', '59', 'DA20TTA', '60'),
(286, '00242', '60', 'DA20TTA', '60'),
(287, '00242', '61', 'DA20TTA', '60'),
(288, '00242', '62', 'DA20TTA', '60'),
(289, '00242', '63', 'DA20TTA', '60'),
(290, '00242', '64', 'DA20TTA', '60'),
(291, '00243', '55', 'DA20TTA', '60'),
(292, '00243', '56', 'DA20TTA', '60'),
(293, '00243', '57', 'DA20TTA', '60'),
(294, '00243', '58', 'DA20TTA', '60'),
(295, '00243', '59', 'DA20TTA', '60'),
(296, '00243', '60', 'DA20TTA', '60'),
(297, '00243', '61', 'DA20TTA', '60'),
(298, '00243', '62', 'DA20TTA', '60'),
(299, '00243', '63', 'DA20TTA', '60'),
(300, '00243', '64', 'DA20TTA', '60'),
(301, '00244', '55', 'DA20TTA', '60'),
(302, '00244', '56', 'DA20TTA', '60'),
(303, '00244', '57', 'DA20TTA', '60'),
(304, '00244', '58', 'DA20TTA', '60'),
(305, '00244', '59', 'DA20TTA', '60'),
(306, '00244', '60', 'DA20TTA', '60'),
(307, '00244', '61', 'DA20TTA', '60'),
(308, '00244', '62', 'DA20TTA', '60'),
(309, '00244', '63', 'DA20TTA', '60'),
(310, '00244', '64', 'DA20TTA', '60'),
(311, '00245', '55', 'DA20TTA', '60'),
(312, '00245', '56', 'DA20TTA', '60'),
(313, '00245', '57', 'DA20TTA', '60'),
(314, '00245', '58', 'DA20TTA', '60'),
(315, '00245', '59', 'DA20TTA', '60'),
(316, '00245', '60', 'DA20TTA', '60'),
(317, '00245', '61', 'DA20TTA', '60'),
(318, '00245', '62', 'DA20TTA', '60'),
(319, '00245', '63', 'DA20TTA', '60'),
(320, '00245', '64', 'DA20TTA', '60'),
(321, '00246', '55', 'DA20TTA', '60'),
(322, '00246', '56', 'DA20TTA', '60'),
(323, '00246', '57', 'DA20TTA', '60'),
(324, '00246', '58', 'DA20TTA', '60'),
(325, '00246', '59', 'DA20TTA', '60'),
(326, '00246', '60', 'DA20TTA', '60'),
(327, '00246', '61', 'DA20TTA', '60'),
(328, '00246', '62', 'DA20TTA', '60'),
(329, '00246', '63', 'DA20TTA', '60'),
(330, '00246', '64', 'DA20TTA', '60'),
(331, '00248', '55', 'DA20TTA', '60'),
(332, '00248', '56', 'DA20TTA', '60'),
(333, '00248', '57', 'DA20TTA', '60'),
(334, '00248', '58', 'DA20TTA', '60'),
(335, '00248', '59', 'DA20TTA', '60'),
(336, '00248', '60', 'DA20TTA', '60'),
(337, '00248', '61', 'DA20TTA', '60'),
(338, '00248', '62', 'DA20TTA', '60'),
(339, '00248', '63', 'DA20TTA', '60'),
(340, '00248', '64', 'DA20TTA', '60'),
(341, '00249', '55', 'DA20TTA', '60'),
(342, '00249', '56', 'DA20TTA', '60'),
(343, '00249', '57', 'DA20TTA', '60'),
(344, '00249', '58', 'DA20TTA', '60'),
(345, '00249', '59', 'DA20TTA', '60'),
(346, '00249', '60', 'DA20TTA', '60'),
(347, '00249', '61', 'DA20TTA', '60'),
(348, '00249', '62', 'DA20TTA', '60'),
(349, '00249', '63', 'DA20TTA', '60'),
(350, '00249', '64', 'DA20TTA', '60'),
(351, '00250', '55', 'DA20TTA', '60'),
(352, '00250', '56', 'DA20TTA', '60'),
(353, '00250', '57', 'DA20TTA', '60'),
(354, '00250', '58', 'DA20TTA', '60'),
(355, '00250', '59', 'DA20TTA', '60'),
(356, '00250', '60', 'DA20TTA', '60'),
(357, '00250', '61', 'DA20TTA', '60'),
(358, '00250', '62', 'DA20TTA', '60'),
(359, '00250', '63', 'DA20TTA', '60'),
(360, '00250', '64', 'DA20TTA', '60'),
(361, '00251', '55', 'DA20TTA', '60'),
(362, '00251', '56', 'DA20TTA', '60'),
(363, '00251', '57', 'DA20TTA', '60'),
(364, '00251', '58', 'DA20TTA', '60'),
(365, '00251', '59', 'DA20TTA', '60'),
(366, '00251', '60', 'DA20TTA', '60'),
(367, '00251', '61', 'DA20TTA', '60'),
(368, '00251', '62', 'DA20TTA', '60'),
(369, '00251', '63', 'DA20TTA', '60'),
(370, '00251', '64', 'DA20TTA', '60'),
(371, '00252', '55', 'DA20TTA', '60'),
(372, '00252', '56', 'DA20TTA', '60'),
(373, '00252', '57', 'DA20TTA', '60'),
(374, '00252', '58', 'DA20TTA', '60'),
(375, '00252', '59', 'DA20TTA', '60'),
(376, '00252', '60', 'DA20TTA', '60'),
(377, '00252', '61', 'DA20TTA', '60'),
(378, '00252', '62', 'DA20TTA', '60'),
(379, '00252', '63', 'DA20TTA', '60'),
(380, '00252', '64', 'DA20TTA', '60'),
(381, '00253', '55', 'DA20TTA', '60'),
(382, '00253', '56', 'DA20TTA', '60'),
(383, '00253', '57', 'DA20TTA', '60'),
(384, '00253', '58', 'DA20TTA', '60'),
(385, '00253', '59', 'DA20TTA', '60'),
(386, '00253', '60', 'DA20TTA', '60'),
(387, '00253', '61', 'DA20TTA', '60'),
(388, '00253', '62', 'DA20TTA', '60'),
(389, '00253', '63', 'DA20TTA', '60'),
(390, '00253', '64', 'DA20TTA', '60'),
(391, '00254', '55', 'DA20TTA', '60'),
(392, '00254', '56', 'DA20TTA', '60'),
(393, '00254', '57', 'DA20TTA', '60'),
(394, '00254', '58', 'DA20TTA', '60'),
(395, '00254', '59', 'DA20TTA', '60'),
(396, '00254', '60', 'DA20TTA', '60'),
(397, '00254', '61', 'DA20TTA', '60'),
(398, '00254', '62', 'DA20TTA', '60'),
(399, '00254', '63', 'DA20TTA', '60'),
(400, '00254', '64', 'DA20TTA', '60'),
(401, '00255', '55', 'DA20TTA', '60'),
(402, '00255', '56', 'DA20TTA', '60'),
(403, '00255', '57', 'DA20TTA', '60'),
(404, '00255', '58', 'DA20TTA', '60'),
(405, '00255', '59', 'DA20TTA', '60'),
(406, '00255', '60', 'DA20TTA', '60'),
(407, '00255', '61', 'DA20TTA', '60'),
(408, '00255', '62', 'DA20TTA', '60'),
(409, '00255', '63', 'DA20TTA', '60'),
(410, '00255', '64', 'DA20TTA', '60'),
(411, '00257', '55', 'DA20TTA', '60'),
(412, '00257', '56', 'DA20TTA', '60'),
(413, '00257', '57', 'DA20TTA', '60'),
(414, '00257', '58', 'DA20TTA', '60'),
(415, '00257', '59', 'DA20TTA', '60'),
(416, '00257', '60', 'DA20TTA', '60'),
(417, '00257', '61', 'DA20TTA', '60'),
(418, '00257', '62', 'DA20TTA', '60'),
(419, '00257', '63', 'DA20TTA', '60'),
(420, '00257', '64', 'DA20TTA', '60'),
(421, '01027', '55', 'DA20TTA', '60'),
(422, '01027', '56', 'DA20TTA', '60'),
(423, '01027', '57', 'DA20TTA', '60'),
(424, '01027', '58', 'DA20TTA', '60'),
(425, '01027', '59', 'DA20TTA', '60'),
(426, '01027', '60', 'DA20TTA', '60'),
(427, '01027', '61', 'DA20TTA', '60'),
(428, '01027', '62', 'DA20TTA', '60'),
(429, '01027', '63', 'DA20TTA', '60'),
(430, '01027', '64', 'DA20TTA', '60'),
(431, '0122', '55', 'DA20TTA', '60'),
(432, '0122', '56', 'DA20TTA', '60'),
(433, '0122', '57', 'DA20TTA', '60'),
(434, '0122', '58', 'DA20TTA', '60'),
(435, '0122', '59', 'DA20TTA', '60'),
(436, '0122', '60', 'DA20TTA', '60'),
(437, '0122', '61', 'DA20TTA', '60'),
(438, '0122', '62', 'DA20TTA', '60'),
(439, '0122', '63', 'DA20TTA', '60'),
(440, '0122', '64', 'DA20TTA', '60'),
(441, '0123', '55', 'DA20TTA', '60'),
(442, '0123', '56', 'DA20TTA', '60'),
(443, '0123', '57', 'DA20TTA', '60'),
(444, '0123', '58', 'DA20TTA', '60'),
(445, '0123', '59', 'DA20TTA', '60'),
(446, '0123', '60', 'DA20TTA', '60'),
(447, '0123', '61', 'DA20TTA', '60'),
(448, '0123', '62', 'DA20TTA', '60'),
(449, '0123', '63', 'DA20TTA', '60'),
(450, '0123', '64', 'DA20TTA', '60'),
(451, '01548', '55', 'DA20TTA', '60'),
(452, '01548', '56', 'DA20TTA', '60'),
(453, '01548', '57', 'DA20TTA', '60'),
(454, '01548', '58', 'DA20TTA', '60'),
(455, '01548', '59', 'DA20TTA', '60'),
(456, '01548', '60', 'DA20TTA', '60'),
(457, '01548', '61', 'DA20TTA', '60'),
(458, '01548', '62', 'DA20TTA', '60'),
(459, '01548', '63', 'DA20TTA', '60'),
(460, '01548', '64', 'DA20TTA', '60'),
(461, '03539', '55', 'DA20TTA', '60'),
(462, '03539', '56', 'DA20TTA', '60'),
(463, '03539', '57', 'DA20TTA', '60'),
(464, '03539', '58', 'DA20TTA', '60'),
(465, '03539', '59', 'DA20TTA', '60'),
(466, '03539', '60', 'DA20TTA', '60'),
(467, '03539', '61', 'DA20TTA', '60'),
(468, '03539', '62', 'DA20TTA', '60'),
(469, '03539', '63', 'DA20TTA', '60'),
(470, '03539', '64', 'DA20TTA', '60'),
(471, '03546', '55', 'DA20TTA', '60'),
(472, '03546', '56', 'DA20TTA', '60'),
(473, '03546', '57', 'DA20TTA', '60'),
(474, '03546', '58', 'DA20TTA', '60'),
(475, '03546', '59', 'DA20TTA', '60'),
(476, '03546', '60', 'DA20TTA', '60'),
(477, '03546', '61', 'DA20TTA', '60'),
(478, '03546', '62', 'DA20TTA', '60'),
(479, '03546', '63', 'DA20TTA', '60'),
(480, '03546', '64', 'DA20TTA', '60'),
(481, '03562', '55', 'DA20TTA', '60'),
(482, '03562', '56', 'DA20TTA', '60'),
(483, '03562', '57', 'DA20TTA', '60'),
(484, '03562', '58', 'DA20TTA', '60'),
(485, '03562', '59', 'DA20TTA', '60'),
(486, '03562', '60', 'DA20TTA', '60'),
(487, '03562', '61', 'DA20TTA', '60'),
(488, '03562', '62', 'DA20TTA', '60'),
(489, '03562', '63', 'DA20TTA', '60'),
(490, '03562', '64', 'DA20TTA', '60'),
(491, '12700', '55', 'DA20TTA', '60'),
(492, '12700', '56', 'DA20TTA', '60'),
(493, '12700', '57', 'DA20TTA', '60'),
(494, '12700', '58', 'DA20TTA', '60'),
(495, '12700', '59', 'DA20TTA', '60'),
(496, '12700', '60', 'DA20TTA', '60'),
(497, '12700', '61', 'DA20TTA', '60'),
(498, '12700', '62', 'DA20TTA', '60'),
(499, '12700', '63', 'DA20TTA', '60'),
(500, '12700', '64', 'DA20TTA', '60'),
(501, '12701', '55', 'DA20TTA', '60'),
(502, '12701', '56', 'DA20TTA', '60'),
(503, '12701', '57', 'DA20TTA', '60'),
(504, '12701', '58', 'DA20TTA', '60'),
(505, '12701', '59', 'DA20TTA', '60'),
(506, '12701', '60', 'DA20TTA', '60'),
(507, '12701', '61', 'DA20TTA', '60'),
(508, '12701', '62', 'DA20TTA', '60'),
(509, '12701', '63', 'DA20TTA', '60'),
(510, '12701', '64', 'DA20TTA', '60'),
(511, '12702', '55', 'DA20TTA', '60'),
(512, '12702', '56', 'DA20TTA', '60'),
(513, '12702', '57', 'DA20TTA', '60'),
(514, '12702', '58', 'DA20TTA', '60'),
(515, '12702', '59', 'DA20TTA', '60'),
(516, '12702', '60', 'DA20TTA', '60'),
(517, '12702', '61', 'DA20TTA', '60'),
(518, '12702', '62', 'DA20TTA', '60'),
(519, '12702', '63', 'DA20TTA', '60'),
(520, '12702', '64', 'DA20TTA', '60'),
(521, '12705', '55', 'DA20TTA', '60'),
(522, '12705', '56', 'DA20TTA', '60'),
(523, '12705', '57', 'DA20TTA', '60'),
(524, '12705', '58', 'DA20TTA', '60'),
(525, '12705', '59', 'DA20TTA', '60'),
(526, '12705', '60', 'DA20TTA', '60'),
(527, '12705', '61', 'DA20TTA', '60'),
(528, '12705', '62', 'DA20TTA', '60'),
(529, '12705', '63', 'DA20TTA', '60'),
(530, '12705', '64', 'DA20TTA', '60'),
(531, '14204', '55', 'DA20TTA', '60'),
(532, '14204', '56', 'DA20TTA', '60'),
(533, '14204', '57', 'DA20TTA', '60'),
(534, '14204', '58', 'DA20TTA', '60'),
(535, '14204', '59', 'DA20TTA', '60'),
(536, '14204', '60', 'DA20TTA', '60'),
(537, '14204', '61', 'DA20TTA', '60'),
(538, '14204', '62', 'DA20TTA', '60'),
(539, '14204', '63', 'DA20TTA', '60'),
(540, '14204', '64', 'DA20TTA', '60'),
(541, '99997', '55', 'DA20TTA', '60'),
(542, '99997', '56', 'DA20TTA', '60'),
(543, '99997', '57', 'DA20TTA', '60'),
(544, '99997', '58', 'DA20TTA', '60'),
(545, '99997', '59', 'DA20TTA', '60'),
(546, '99997', '60', 'DA20TTA', '60'),
(547, '99997', '61', 'DA20TTA', '60'),
(548, '99997', '62', 'DA20TTA', '60'),
(549, '99997', '63', 'DA20TTA', '60'),
(550, '99997', '64', 'DA20TTA', '60'),
(551, '99999', '55', 'DA20TTA', '60'),
(552, '99999', '56', 'DA20TTA', '60'),
(553, '99999', '57', 'DA20TTA', '60'),
(554, '99999', '58', 'DA20TTA', '60'),
(555, '99999', '59', 'DA20TTA', '60'),
(556, '99999', '60', 'DA20TTA', '60'),
(557, '99999', '61', 'DA20TTA', '60'),
(558, '99999', '62', 'DA20TTA', '60'),
(559, '99999', '63', 'DA20TTA', '60'),
(560, '99999', '64', 'DA20TTA', '60'),
(561, 'GVNT22424', '55', 'DA20TTA', '60'),
(562, 'GVNT22424', '56', 'DA20TTA', '60'),
(563, 'GVNT22424', '57', 'DA20TTA', '60'),
(564, 'GVNT22424', '58', 'DA20TTA', '60'),
(565, 'GVNT22424', '59', 'DA20TTA', '60'),
(566, 'GVNT22424', '60', 'DA20TTA', '60'),
(567, 'GVNT22424', '61', 'DA20TTA', '60'),
(568, 'GVNT22424', '62', 'DA20TTA', '60'),
(569, 'GVNT22424', '63', 'DA20TTA', '60'),
(570, 'GVNT22424', '64', 'DA20TTA', '60');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quy_dinh`
--

CREATE TABLE `quy_dinh` (
  `MA_QUY_DINH` int(11) NOT NULL,
  `TEN_QUY_DINH` text DEFAULT NULL,
  `TRANG_THAI_QUY_DINH` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `quy_dinh`
--

INSERT INTO `quy_dinh` (`MA_QUY_DINH`, `TEN_QUY_DINH`, `TRANG_THAI_QUY_DINH`) VALUES
(1, 'Tỷ lệ quy đổi giữa các tác giả đối với bài tham luận (báo cáo khoa học) và bài báo khoa học', 'Đang áp dụng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `TENDANGNHAP` varchar(255) NOT NULL,
  `MAGV` varchar(255) NOT NULL,
  `MATKHAU` text DEFAULT NULL,
  `PHANQUYEN` text DEFAULT NULL,
  `TRANGTHAITAIKHOAN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`TENDANGNHAP`, `MAGV`, `MATKHAU`, `PHANQUYEN`, `TRANGTHAITAIKHOAN`) VALUES
('annb@tvu.edu.vn', '00245', NULL, 'Trưởng Khoa', 'Đang hoạt động'),
('baoquocone@gmail.com', '99997', NULL, 'Trưởng Bộ Môn', 'Đang hoạt động'),
('baoquoczero@gmail.com', '99999', NULL, 'Admin', 'Đang hoạt động'),
('diemhanh_tvu@tvu.edu.vn', '12705', NULL, 'Giảng Viên', 'Đang hoạt động'),
('duongminh@tvu.edu.vn', '00248', NULL, 'Trưởng Bộ Môn', 'Đang hoạt động'),
('Hattvi201084@tvu.edu.vn', '00249', NULL, 'Trưởng Khoa', 'Đang hoạt động'),
('hientvu@tvu.edu.vn', '00257', NULL, 'Admin', 'Đang hoạt động'),
('hohoangphucjob@gmail.com', '0123', NULL, 'Admin', 'Đang hoạt động'),
('huyngocntt@tvu.edu.vn', '00254', NULL, 'Admin', 'Đang hoạt động'),
('hvthanh@tvu.edu.vn', '00243', NULL, 'Giảng Viên', 'Đang hoạt động'),
('lamnn@tvu.edu.vn', '00244', NULL, 'Giảng Viên', 'Đang hoạt động'),
('lmtu@tvu.edu.vn', '03539', NULL, 'Giảng Viên', 'Đang hoạt động'),
('namtv@tvu.edu.vn', '12701', NULL, 'Giảng Viên', 'Đang hoạt động'),
('ngocdanthanhdt@tvu.edu.vn', '00246', NULL, 'Giảng Viên', 'Đang hoạt động'),
('nhiemnb@tvu.edu.vn', '14204', NULL, 'Giảng Viên', 'Đang hoạt động'),
('nhutkhau@tvu.edu.vn', '12700', NULL, 'Giảng Viên', 'Đang hoạt động'),
('nkduy@tvu.edu.vn', '01027', NULL, 'Giảng Viên', 'Đang hoạt động'),
('nkquoc@tvu.edu.vn', '03562', NULL, 'Giảng Viên', 'Đang hoạt động'),
('oane@tvu.edu.vn', '01548', NULL, 'Giảng Viên', 'Đang hoạt động'),
('phattai@tvu.edu.vn', '12702', NULL, 'Giảng Viên', 'Đang hoạt động'),
('phuocmien@tvu.edu.vn', '00253', NULL, 'Giảng Viên', 'Đang hoạt động'),
('ptpnam@tvu.edu.vn', '03546', NULL, 'Giảng Viên', 'Đang hoạt động'),
('pttmai@tvu.edu.vn', '00255', NULL, 'Giảng Viên', 'Đang hoạt động'),
('thiennhd@tvu.edu.vn', '00241', NULL, 'Giảng Viên', 'Đang hoạt động'),
('tinthanhtv2014@gmail.com', '0122', NULL, 'Admin', 'Đang hoạt động'),
('tqviettv@tvu.edu.vn', '00251', NULL, 'Giảng Viên', 'Đang hoạt động'),
('tramhoangnam@tvu.edu.vn', '00252', NULL, 'Giảng Viên', 'Đang hoạt động'),
('vankhanh@tvu.edu.vn', '00242', NULL, 'Giảng Viên', 'Đang hoạt động'),
('vothanhc@tvu.edu.vn', '00250', NULL, 'Giảng Viên', 'Đang hoạt động');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thoigian_xacnhan`
--

CREATE TABLE `thoigian_xacnhan` (
  `MA_THOIGIAN_XACNHAN` int(11) NOT NULL,
  `THOIGIANBATDAU` datetime DEFAULT NULL,
  `THOIGIANKETTHUC` datetime DEFAULT NULL,
  `TEN_KHOA` text DEFAULT NULL,
  `GHICHU` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thoigian_xacnhan`
--

INSERT INTO `thoigian_xacnhan` (`MA_THOIGIAN_XACNHAN`, `THOIGIANBATDAU`, `THOIGIANKETTHUC`, `TEN_KHOA`, `GHICHU`) VALUES
(9, '2024-08-06 20:29:00', '2030-12-01 20:29:00', 'Khoa Kỹ Thuật Công Nghệ', 'CHONKHUNG'),
(22, '2024-08-06 20:29:00', '2030-12-01 20:29:00', 'Khoa Công Nghệ Thông Tin', 'CHONKHUNG'),
(34, '2024-08-31 19:03:38', '2030-08-01 19:03:38', 'Khoa Công Nghệ Thông Tin', 'NGHIENCUU'),
(35, '2024-08-31 19:03:38', '2030-08-01 19:03:38', 'Khoa Kỹ Thuật Công Nghệ', 'NGHIENCUU'),
(36, '2024-08-31 19:03:38', '2030-08-01 19:03:38', 'Ngoài trường', 'NGHIENCUU');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuoc`
--

CREATE TABLE `thuoc` (
  `MACHUONGTRINH` int(11) NOT NULL,
  `MAMONHOC` int(11) NOT NULL,
  `SOTHUTUHOCKI` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thuoc`
--

INSERT INTO `thuoc` (`MACHUONGTRINH`, `MAMONHOC`, `SOTHUTUHOCKI`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(1, 7, 1),
(1, 8, 1),
(1, 9, 1),
(1, 10, 2),
(1, 11, 2),
(1, 12, 2),
(1, 13, 2),
(1, 14, 2),
(1, 15, 2),
(1, 16, 2),
(1, 17, 2),
(1, 18, 2),
(1, 19, 3),
(1, 20, 3),
(1, 21, 3),
(1, 22, 3),
(1, 23, 3),
(1, 24, 3),
(1, 25, 3),
(1, 26, 3),
(1, 27, 4),
(1, 28, 4),
(1, 29, 4),
(1, 30, 4),
(1, 31, 4),
(1, 32, 4),
(1, 33, 4),
(1, 34, 4),
(1, 35, 4),
(1, 36, 5),
(1, 37, 5),
(1, 38, 5),
(1, 39, 5),
(1, 40, 5),
(1, 41, 5),
(1, 42, 5),
(1, 43, 5),
(1, 44, 5),
(1, 45, 6),
(1, 46, 6),
(1, 47, 6),
(1, 48, 6),
(1, 49, 6),
(1, 50, 6),
(1, 51, 6),
(1, 52, 6),
(1, 53, 6),
(1, 54, 6),
(1, 55, 7),
(1, 56, 7),
(1, 57, 7),
(1, 58, 7),
(1, 59, 7),
(1, 60, 7),
(1, 61, 7),
(1, 62, 7),
(1, 63, 7),
(1, 64, 7),
(1, 65, 8),
(1, 66, 8),
(1, 67, 8),
(1, 68, 8),
(1, 69, 8),
(2, 4, 1),
(2, 5, 1),
(2, 8, 3),
(2, 9, 4),
(2, 12, 2),
(2, 15, 2),
(2, 21, 3),
(2, 36, 2),
(2, 54, 3),
(2, 66, 8),
(2, 70, 1),
(2, 71, 1),
(2, 72, 1),
(2, 73, 1),
(2, 74, 1),
(2, 75, 1),
(2, 76, 1),
(2, 77, 2),
(2, 78, 2),
(2, 79, 2),
(2, 80, 2),
(2, 81, 2),
(2, 82, 2),
(2, 83, 2),
(2, 84, 2),
(2, 85, 2),
(2, 86, 2),
(2, 87, 3),
(2, 88, 3),
(2, 89, 3),
(2, 90, 3),
(2, 91, 3),
(2, 92, 3),
(2, 93, 3),
(2, 94, 3),
(2, 95, 3),
(2, 96, 3),
(2, 97, 4),
(2, 98, 4),
(2, 99, 4),
(2, 100, 4),
(2, 101, 4),
(2, 102, 4),
(2, 103, 4),
(2, 104, 4),
(2, 105, 4),
(2, 106, 4),
(2, 107, 4),
(2, 108, 4),
(2, 109, 5),
(2, 110, 5),
(2, 111, 5),
(2, 112, 5),
(2, 113, 5),
(2, 114, 5),
(2, 115, 5),
(2, 116, 5),
(2, 117, 5),
(2, 118, 6),
(2, 119, 6),
(2, 120, 6),
(2, 121, 6),
(2, 122, 6),
(2, 123, 6),
(2, 124, 6),
(2, 125, 6),
(2, 126, 6),
(2, 127, 6),
(2, 128, 7),
(2, 129, 7),
(2, 130, 7),
(2, 131, 7),
(2, 132, 7),
(2, 133, 7),
(2, 134, 7),
(2, 135, 7),
(2, 136, 7),
(2, 137, 7),
(2, 138, 8),
(2, 139, 8),
(2, 140, 8),
(2, 141, 8),
(3, 1, 1),
(3, 4, 1),
(3, 5, 1),
(3, 8, 3),
(3, 9, 4),
(3, 12, 2),
(3, 15, 2),
(3, 21, 3),
(3, 36, 2),
(3, 54, 3),
(3, 66, 8),
(3, 70, 1),
(3, 71, 1),
(3, 73, 1),
(3, 74, 1),
(3, 75, 1),
(3, 76, 1),
(3, 77, 2),
(3, 78, 2),
(3, 79, 2),
(3, 80, 2),
(3, 81, 2),
(3, 83, 2),
(3, 84, 2),
(3, 85, 2),
(3, 86, 2),
(3, 87, 3),
(3, 88, 3),
(3, 89, 3),
(3, 90, 3),
(3, 91, 3),
(3, 92, 3),
(3, 93, 3),
(3, 94, 3),
(3, 95, 3),
(3, 96, 3),
(3, 97, 4),
(3, 98, 4),
(3, 99, 4),
(3, 100, 4),
(3, 101, 4),
(3, 102, 4),
(3, 103, 4),
(3, 104, 5),
(3, 105, 5),
(3, 106, 4),
(3, 107, 4),
(3, 113, 6),
(3, 117, 5),
(3, 131, 7),
(3, 138, 8),
(3, 142, 2),
(3, 143, 4),
(3, 144, 4),
(3, 145, 5),
(3, 146, 5),
(3, 147, 5),
(3, 148, 5),
(3, 149, 5),
(3, 150, 5),
(3, 151, 5),
(3, 152, 5),
(3, 153, 6),
(3, 154, 6),
(3, 155, 6),
(3, 156, 6),
(3, 157, 6),
(3, 158, 6),
(3, 159, 6),
(3, 160, 6),
(3, 161, 6),
(3, 162, 6),
(3, 163, 7),
(3, 164, 7),
(3, 165, 7),
(3, 166, 7),
(3, 167, 7),
(3, 168, 7),
(3, 169, 7),
(3, 170, 7),
(3, 171, 7),
(3, 172, 7),
(3, 173, 8),
(3, 174, 8),
(3, 175, 8),
(3, 176, 8),
(4, 1, 1),
(4, 138, 9),
(4, 177, 1),
(4, 178, 1),
(4, 179, 1),
(4, 180, 1),
(4, 181, 1),
(4, 182, 1),
(4, 183, 1),
(4, 184, 1),
(4, 185, 2),
(4, 186, 2),
(4, 187, 2),
(4, 188, 2),
(4, 189, 2),
(4, 190, 2),
(4, 191, 2),
(4, 192, 2),
(4, 193, 2),
(4, 194, 3),
(4, 195, 3),
(4, 196, 3),
(4, 197, 3),
(4, 198, 3),
(4, 199, 3),
(4, 200, 3),
(4, 201, 3),
(4, 202, 3),
(4, 203, 3),
(4, 204, 4),
(4, 205, 4),
(4, 206, 4),
(4, 207, 4),
(4, 208, 4),
(4, 209, 4),
(4, 210, 4),
(4, 211, 4),
(4, 212, 4),
(4, 213, 5),
(4, 214, 5),
(4, 215, 5),
(4, 216, 5),
(4, 217, 5),
(4, 218, 5),
(4, 219, 5),
(4, 220, 5),
(4, 221, 5),
(4, 222, 6),
(4, 223, 6),
(4, 224, 6),
(4, 225, 6),
(4, 226, 6),
(4, 227, 6),
(4, 228, 6),
(4, 229, 7),
(4, 230, 7),
(4, 231, 7),
(4, 232, 7),
(4, 233, 7),
(4, 234, 7),
(4, 235, 7),
(4, 236, 7),
(4, 237, 7),
(4, 238, 7),
(4, 239, 7),
(4, 240, 7),
(4, 241, 8),
(4, 242, 8),
(4, 243, 8),
(4, 244, 8),
(4, 245, 8),
(4, 246, 8),
(4, 247, 8),
(4, 248, 8),
(4, 249, 8),
(4, 250, 8),
(4, 251, 8),
(4, 252, 8),
(4, 253, 9),
(4, 254, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ty_le_quy_doi_gio_chuan`
--

CREATE TABLE `ty_le_quy_doi_gio_chuan` (
  `MA_QUY_DOI` int(11) NOT NULL,
  `MA_QUY_DINH` int(11) NOT NULL,
  `TEN_QUY_DOI` text DEFAULT NULL,
  `TY_LE` float DEFAULT NULL,
  `VIEN_CHUC_TRUONG` varchar(50) DEFAULT NULL,
  `THUC_HIEN_CHUAN` varchar(50) DEFAULT NULL,
  `TRANG_THAI_QUY_DOI` text DEFAULT NULL,
  `GHI_CHU_QUY_DOI` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ty_le_quy_doi_gio_chuan`
--

INSERT INTO `ty_le_quy_doi_gio_chuan` (`MA_QUY_DOI`, `MA_QUY_DINH`, `TEN_QUY_DOI`, `TY_LE`, `VIEN_CHUC_TRUONG`, `THUC_HIEN_CHUAN`, `TRANG_THAI_QUY_DOI`, `GHI_CHU_QUY_DOI`) VALUES
(1, 1, '16.2.b.Tác giả thứ nhất (bài có nhiều tác giả) là viên chức Trường ĐHTV: 50% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18, trường hợp đồng tác giả thứ nhất thì chia đều 50% cho đồng tác giả thứ nhất; 50% còn lại được chia đều cho các đồng tác giả còn lại bao gồm tác giả chịu trách nhiệm (nếu có); tác giả độc lập hưởng 50% như tác giả thứ nhất;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Chia đều cho các Tác giả thứ nhất'),
(2, 1, '16.2.b.Tác giả thứ nhất (bài có nhiều tác giả) là viên chức Trường ĐHTV: 50% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18, trường hợp đồng tác giả thứ nhất thì chia đều 50% cho đồng tác giả thứ nhất; 50% còn lại được chia đều cho các đồng tác giả còn lại bao gồm tác giả chịu trách nhiệm (nếu có); tác giả độc lập hưởng 50% như tác giả thứ nhất;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Chia đều cho các đồng tác giả còn lại bao gồm tác giả chịu trách nhiệm (nếu có). Trừ tác giả thứ nhất'),
(3, 1, '16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);', 0, 'Không', 'Có', 'Đang áp dụng', 'Tác giả thứ nhất không thuộc trường'),
(4, 1, '16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Chia cho 2 tác giả chịu trách nhiệm, chia đều'),
(5, 1, '16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);', 0.3, 'Có', 'Có', 'Đang áp dụng', 'Chia cho 1  tác giả chịu trách nhiệm'),
(6, 1, '16.2.c.Trường hợp tác giả thứ nhất không phải là viên chức của trường thì xét đến tác giả chịu trách nhiệm: nếu có hai tác giả chịu trách nhiệm thì chia đều 50% cho đồng tác giả này, nếu có một tác giả chịu trách nhiệm thì hưởng 30% định mức sản phẩm KH&CN tương ứng quy định tại Điều 17, Điều 18; các đồng tác giả còn lại được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất);', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Các đồng tác giả còn lại (trừ tác giả chịu trách nhiệm) được chia đều từ 50% định mức quy định cho tổng số tác giả (bao gồm tác giả thứ nhất ngoài trường);'),
(7, 1, '16.2.dTrường hợp tác giả thứ nhất là viên chức của Trường ĐHTV nhưng không phải thực hiện chuẩn thì các tác giả còn lại hưởng 50% chia đều cho các đồng tác giả (kể cả tác giả chịu trách nhiệm). Tác giả thứ nhất được thưởng giờ dư theo quy định.', 0, 'Có', 'Không', 'Đang áp dụng', 'Tác giả thứ nhất không thực hiện chuẩn'),
(8, 1, '16.2.dTrường hợp tác giả thứ nhất là viên chức của Trường ĐHTV nhưng không phải thực hiện chuẩn thì các tác giả còn lại hưởng 50% chia đều cho các đồng tác giả (kể cả tác giả chịu trách nhiệm). Tác giả thứ nhất được thưởng giờ dư theo quy định.', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Chia đều cho các đồng tác giả (kể cả tác giả chịu trách nhiệm). Trừ tác giả thứ nhất'),
(9, 1, '16.3.a. Đối với bằng SHTT, chỉ xem xét sản phẩm SHTT do Trường ĐHTV làm chủ đơn hoặc đồng chủ đơn. Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV); Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi; Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV và viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;', 1, 'Có', 'Có', 'Đang áp dụng', 'Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi;'),
(10, 1, '16.3.a. Đối với bằng SHTT, chỉ xem xét sản phẩm SHTT do Trường ĐHTV làm chủ đơn hoặc đồng chủ đơn. Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV); Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi; Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV và viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;', 0, 'Không', 'Có', 'Đang áp dụng', 'Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV'),
(11, 1, '16.3.a. Đối với bằng SHTT, chỉ xem xét sản phẩm SHTT do Trường ĐHTV làm chủ đơn hoặc đồng chủ đơn. Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV); Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi; Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV và viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;', 0, 'Có', 'Không', 'Đang áp dụng', 'Trường hợp tác giả thứ nhất không thực hiện chuẩn (Không được luật nhắc đến)'),
(12, 1, '16.3.a. Đối với bằng SHTT, chỉ xem xét sản phẩm SHTT do Trường ĐHTV làm chủ đơn hoặc đồng chủ đơn. Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV); Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi; Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV và viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV)'),
(13, 1, '16.3.a. Đối với bằng SHTT, chỉ xem xét sản phẩm SHTT do Trường ĐHTV làm chủ đơn hoặc đồng chủ đơn. Tác giả thứ nhất tài sản trí tuệ (TSTT) liên quan quyết định tỷ lệ hưởng giờ quy chuẩn NCKH trên cơ sở đồng thuận đối với TSTT có nhiều tác giả (trường hợp tác giả thứ nhất là viên chức của Trường ĐHTV); Trường hợp cá nhân thực hiện thì hưởng 100% mức quy đổi; Trường hợp tác giả thứ nhất không phải là viên chức Trường ĐHTV và viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Viên chức Trường ĐHTV là tác giả khác thì hưởng bằng 50% định mức chia đều cho tổng số tác giả;'),
(14, 1, '20.3. Quy đổi viết thuyết minh đề tài, dự án và các hoạt động KH&CN ra giờ chuẩn NCKH.', 0, 'Có', 'Không', 'Đang áp dụng', 'Trường hợp không thực hiện chuẩn'),
(15, 1, '20.3. Quy đổi viết thuyết minh đề tài, dự án và các hoạt động KH&CN ra giờ chuẩn NCKH.', 0, 'Không', 'Có', 'Đang áp dụng', 'Trường hợp không thuộc trường'),
(16, 1, '20.3. Quy đổi viết thuyết minh đề tài, dự án và các hoạt động KH&CN ra giờ chuẩn NCKH.', 1, 'Có', 'Có', 'Đang áp dụng', 'Cá nhân thực hiện'),
(17, 1, '21.1. Chủ nhiệm đề tài quyết tỷ lệ hưởng giờ quy chuẩn NCKH cho các thành viên thực hiện đề tài trên cơ sở đồng thuận bằng văn bản (quyết định của chủ nhiệm đề tài là quyết định cuối cùng); trong trường hợp chủ nhiệm đề tài không phải là viên chức Trường ĐHTV thì lấy 50% số giờ được quy chuẩn quy định tại khoản 2 Điều này chia đều cho tổng số thành viên thực hiện đề tài (bao gồm chủ nhiệm đề tài).', 0, 'Có', 'Không', 'Đang áp dụng', 'Trường hợp không thực hiện chuẩn'),
(18, 1, '21.1. Chủ nhiệm đề tài quyết tỷ lệ hưởng giờ quy chuẩn NCKH cho các thành viên thực hiện đề tài trên cơ sở đồng thuận bằng văn bản (quyết định của chủ nhiệm đề tài là quyết định cuối cùng); trong trường hợp chủ nhiệm đề tài không phải là viên chức Trường ĐHTV thì lấy 50% số giờ được quy chuẩn quy định tại khoản 2 Điều này chia đều cho tổng số thành viên thực hiện đề tài (bao gồm chủ nhiệm đề tài).', 0, 'Không', 'Có', 'Đang áp dụng', 'Trường hợp không thuộc trường'),
(19, 1, '21.1. Chủ nhiệm đề tài quyết tỷ lệ hưởng giờ quy chuẩn NCKH cho các thành viên thực hiện đề tài trên cơ sở đồng thuận bằng văn bản (quyết định của chủ nhiệm đề tài là quyết định cuối cùng); trong trường hợp chủ nhiệm đề tài không phải là viên chức Trường ĐHTV thì lấy 50% số giờ được quy chuẩn quy định tại khoản 2 Điều này chia đều cho tổng số thành viên thực hiện đề tài (bao gồm chủ nhiệm đề tài).', 1, 'Có', 'Có', 'Đang áp dụng', 'Cá nhân thực hiện'),
(20, 1, 'Điều 19.d. Trường hợp sản phẩm có chủ biên/tác giả thứ nhất là viên chức thuộc khối phục vụ đào tạo và các đồng tác giả (ĐTG) còn lại nếu là giảng viên thuộc khối đào tạo thì được kê khai nhiệm vụ NCKH với định mức bằng 50% định mức tương ứng quy định tại Điều này được chia đều cho các ĐTG; chủ biên/tác giả thứ nhất được xem xét khen thưởng bằng 50% định mức khen thưởng theo quy định;', 0, 'Có', 'Không', 'Đang áp dụng', 'Trường hợp chủ biên không thực hiện chuẩn'),
(21, 1, 'Điều 19.d. Trường hợp sản phẩm có chủ biên/tác giả thứ nhất là viên chức thuộc khối phục vụ đào tạo và các đồng tác giả (ĐTG) còn lại nếu là giảng viên thuộc khối đào tạo thì được kê khai nhiệm vụ NCKH với định mức bằng 50% định mức tương ứng quy định tại Điều này được chia đều cho các ĐTG; chủ biên/tác giả thứ nhất được xem xét khen thưởng bằng 50% định mức khen thưởng theo quy định;', 0, 'Không', 'Có', 'Đang áp dụng', 'Trường hợp chủ biên không thuộc trường'),
(22, 1, 'Điều 19.d. Trường hợp sản phẩm có chủ biên/tác giả thứ nhất là viên chức thuộc khối phục vụ đào tạo và các đồng tác giả (ĐTG) còn lại nếu là giảng viên thuộc khối đào tạo thì được kê khai nhiệm vụ NCKH với định mức bằng 50% định mức tương ứng quy định tại Điều này được chia đều cho các ĐTG; chủ biên/tác giả thứ nhất được xem xét khen thưởng bằng 50% định mức khen thưởng theo quy định;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Chủ biên/tác giả thứ nhất được xem xét khen thưởng bằng 50% định mức khen thưởng theo quy định;'),
(23, 1, 'Điều 19.d. Trường hợp sản phẩm có chủ biên/tác giả thứ nhất là viên chức thuộc khối phục vụ đào tạo và các đồng tác giả (ĐTG) còn lại nếu là giảng viên thuộc khối đào tạo thì được kê khai nhiệm vụ NCKH với định mức bằng 50% định mức tương ứng quy định tại Điều này được chia đều cho các ĐTG; chủ biên/tác giả thứ nhất được xem xét khen thưởng bằng 50% định mức khen thưởng theo quy định;', 0.5, 'Có', 'Có', 'Đang áp dụng', 'Các đồng tác giả (ĐTG) còn lại nếu là giảng viên thuộc khối đào tạo thì được kê khai nhiệm vụ NCKH với định mức bằng 50% định mức tương ứng quy định tại Điều này được chia đều cho các ĐTG;');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bangphancong`
--
ALTER TABLE `bangphancong`
  ADD PRIMARY KEY (`MAPHANCONG`),
  ADD KEY `FK_PHAN_CONG_HOC_KY` (`MAHKNK`),
  ADD KEY `FK__UOC_PHAN_CONG` (`MAGV`);

--
-- Chỉ mục cho bảng `bao_cao_ket_thuc_mon`
--
ALTER TABLE `bao_cao_ket_thuc_mon`
  ADD PRIMARY KEY (`MADANHGIAKETTHUC`,`MACHITIETPHANCONG`),
  ADD KEY `FK_BAO_CAO_KET_THUC_MON2` (`MACHITIETPHANCONG`);

--
-- Chỉ mục cho bảng `bomon`
--
ALTER TABLE `bomon`
  ADD PRIMARY KEY (`MABOMON`),
  ADD KEY `FK_THUOC_KHOA` (`MAKHOA`);

--
-- Chỉ mục cho bảng `chitietphancong`
--
ALTER TABLE `chitietphancong`
  ADD PRIMARY KEY (`MACHITIETPHANCONG`),
  ADD KEY `FK_CO` (`MAPHANCONG`),
  ADD KEY `FK_PHAN_CONG_DAY` (`MALOP`),
  ADD KEY `FK_PHAN_CONG_MON_HOC` (`MAMONHOC`);

--
-- Chỉ mục cho bảng `chon_khung`
--
ALTER TABLE `chon_khung`
  ADD PRIMARY KEY (`MAGV`,`MANAMHOC`,`MAKHUNG`),
  ADD KEY `FK_CHON_KHUNG2` (`MANAMHOC`),
  ADD KEY `FK_CHON_KHUNG3` (`MAKHUNG`);

--
-- Chỉ mục cho bảng `chucdanh`
--
ALTER TABLE `chucdanh`
  ADD PRIMARY KEY (`MACHUCDANH`);

--
-- Chỉ mục cho bảng `chucvu`
--
ALTER TABLE `chucvu`
  ADD PRIMARY KEY (`MACHUCVU`);

--
-- Chỉ mục cho bảng `chuongtrinhdaotao`
--
ALTER TABLE `chuongtrinhdaotao`
  ADD PRIMARY KEY (`MACHUONGTRINH`),
  ADD KEY `FK_THUOC_CHUONG_TRINH__AO_TAO` (`MABOMON`);

--
-- Chỉ mục cho bảng `chuyen_mon_giang_vien`
--
ALTER TABLE `chuyen_mon_giang_vien`
  ADD PRIMARY KEY (`MACMGV`);

--
-- Chỉ mục cho bảng `co_chuc_danh`
--
ALTER TABLE `co_chuc_danh`
  ADD PRIMARY KEY (`MACHUCDANH`,`MAGV`),
  ADD KEY `FK_CO_CHUC_DANH2` (`MAGV`);

--
-- Chỉ mục cho bảng `co_ty_le`
--
ALTER TABLE `co_ty_le`
  ADD PRIMARY KEY (`MA_QUY_DOI`,`MA_LOAI_DANH_MUC`,`MA_LOAI_TAC_GIA`),
  ADD KEY `FK_CO_TY_LE2` (`MA_LOAI_DANH_MUC`),
  ADD KEY `FK_CO_TY_LE3` (`MA_LOAI_TAC_GIA`);

--
-- Chỉ mục cho bảng `dang_ky_thuc_hien_quy_doi`
--
ALTER TABLE `dang_ky_thuc_hien_quy_doi`
  ADD PRIMARY KEY (`MA_DANH_MUC`,`MAGV`,`MANAMHOC`,`MA_LOAI_TAC_GIA`,`TEN_DE_TAI`),
  ADD KEY `FK_DANG_KY_THUC_HIEN_QUY_DOI2` (`MAGV`),
  ADD KEY `FK_DANG_KY_THUC_HIEN_QUY_DOI3` (`MANAMHOC`),
  ADD KEY `FK_DANG_KY_THUC_HIEN_QUY_DOI4` (`MA_LOAI_TAC_GIA`),
  ADD KEY `FK_DANG_KY_THUC_HIEN_QUY_DOI5` (`TEN_DE_TAI`);

--
-- Chỉ mục cho bảng `danhmucquydoispkhcn`
--
ALTER TABLE `danhmucquydoispkhcn`
  ADD PRIMARY KEY (`MA_DANH_MUC`),
  ADD KEY `FK_THUOC_DANH_MUC` (`MA_LOAI_DANH_MUC`);

--
-- Chỉ mục cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`MAGV`),
  ADD KEY `FK_THUOC_BO_MON` (`MABOMON`);

--
-- Chỉ mục cho bảng `giu_chuc_vu`
--
ALTER TABLE `giu_chuc_vu`
  ADD PRIMARY KEY (`MAGV`,`MACHUCVU`),
  ADD KEY `FK_GIU_CHUC_VU2` (`MACHUCVU`);

--
-- Chỉ mục cho bảng `hinhthucdanhgia`
--
ALTER TABLE `hinhthucdanhgia`
  ADD PRIMARY KEY (`MADANHGIAKETTHUC`);

--
-- Chỉ mục cho bảng `hockynienkhoa`
--
ALTER TABLE `hockynienkhoa`
  ADD PRIMARY KEY (`MAHKNK`);

--
-- Chỉ mục cho bảng `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`MAKHOA`);

--
-- Chỉ mục cho bảng `khunggiochuan`
--
ALTER TABLE `khunggiochuan`
  ADD PRIMARY KEY (`MAKHUNG`),
  ADD KEY `FK_CO_KHUNG_GIO_CHUAN` (`MACHUCDANH`);

--
-- Chỉ mục cho bảng `loai_danh_muc`
--
ALTER TABLE `loai_danh_muc`
  ADD PRIMARY KEY (`MA_LOAI_DANH_MUC`);

--
-- Chỉ mục cho bảng `loai_tac_gia`
--
ALTER TABLE `loai_tac_gia`
  ADD PRIMARY KEY (`MA_LOAI_TAC_GIA`);

--
-- Chỉ mục cho bảng `lop`
--
ALTER TABLE `lop`
  ADD PRIMARY KEY (`MALOP`),
  ADD KEY `FK_HOC` (`MACHUONGTRINH`);

--
-- Chỉ mục cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD PRIMARY KEY (`MAMONHOC`);

--
-- Chỉ mục cho bảng `namhoc`
--
ALTER TABLE `namhoc`
  ADD PRIMARY KEY (`MANAMHOC`);

--
-- Chỉ mục cho bảng `nghien_cuu_kh`
--
ALTER TABLE `nghien_cuu_kh`
  ADD PRIMARY KEY (`TEN_DE_TAI`);

--
-- Chỉ mục cho bảng `phan_cong_gv_tu_dong`
--
ALTER TABLE `phan_cong_gv_tu_dong`
  ADD PRIMARY KEY (`MAPCGVTD`);

--
-- Chỉ mục cho bảng `quy_dinh`
--
ALTER TABLE `quy_dinh`
  ADD PRIMARY KEY (`MA_QUY_DINH`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`TENDANGNHAP`),
  ADD KEY `FK_TAI_KHOAN_CUA_GIANG_VIEN` (`MAGV`);

--
-- Chỉ mục cho bảng `thoigian_xacnhan`
--
ALTER TABLE `thoigian_xacnhan`
  ADD PRIMARY KEY (`MA_THOIGIAN_XACNHAN`);

--
-- Chỉ mục cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  ADD PRIMARY KEY (`MACHUONGTRINH`,`MAMONHOC`),
  ADD KEY `FK_THUOC2` (`MAMONHOC`);

--
-- Chỉ mục cho bảng `ty_le_quy_doi_gio_chuan`
--
ALTER TABLE `ty_le_quy_doi_gio_chuan`
  ADD PRIMARY KEY (`MA_QUY_DOI`),
  ADD KEY `FK_DUOC_QUY_DINH` (`MA_QUY_DINH`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bangphancong`
--
ALTER TABLE `bangphancong`
  MODIFY `MAPHANCONG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `bomon`
--
ALTER TABLE `bomon`
  MODIFY `MABOMON` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `chitietphancong`
--
ALTER TABLE `chitietphancong`
  MODIFY `MACHITIETPHANCONG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `chucdanh`
--
ALTER TABLE `chucdanh`
  MODIFY `MACHUCDANH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `chucvu`
--
ALTER TABLE `chucvu`
  MODIFY `MACHUCVU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `chuongtrinhdaotao`
--
ALTER TABLE `chuongtrinhdaotao`
  MODIFY `MACHUONGTRINH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `chuyen_mon_giang_vien`
--
ALTER TABLE `chuyen_mon_giang_vien`
  MODIFY `MACMGV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `danhmucquydoispkhcn`
--
ALTER TABLE `danhmucquydoispkhcn`
  MODIFY `MA_DANH_MUC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT cho bảng `hinhthucdanhgia`
--
ALTER TABLE `hinhthucdanhgia`
  MODIFY `MADANHGIAKETTHUC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `hockynienkhoa`
--
ALTER TABLE `hockynienkhoa`
  MODIFY `MAHKNK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `khoa`
--
ALTER TABLE `khoa`
  MODIFY `MAKHOA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `khunggiochuan`
--
ALTER TABLE `khunggiochuan`
  MODIFY `MAKHUNG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `loai_danh_muc`
--
ALTER TABLE `loai_danh_muc`
  MODIFY `MA_LOAI_DANH_MUC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `loai_tac_gia`
--
ALTER TABLE `loai_tac_gia`
  MODIFY `MA_LOAI_TAC_GIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  MODIFY `MAMONHOC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT cho bảng `namhoc`
--
ALTER TABLE `namhoc`
  MODIFY `MANAMHOC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `phan_cong_gv_tu_dong`
--
ALTER TABLE `phan_cong_gv_tu_dong`
  MODIFY `MAPCGVTD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=571;

--
-- AUTO_INCREMENT cho bảng `quy_dinh`
--
ALTER TABLE `quy_dinh`
  MODIFY `MA_QUY_DINH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `thoigian_xacnhan`
--
ALTER TABLE `thoigian_xacnhan`
  MODIFY `MA_THOIGIAN_XACNHAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `ty_le_quy_doi_gio_chuan`
--
ALTER TABLE `ty_le_quy_doi_gio_chuan`
  MODIFY `MA_QUY_DOI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bangphancong`
--
ALTER TABLE `bangphancong`
  ADD CONSTRAINT `FK_PHAN_CONG_HOC_KY` FOREIGN KEY (`MAHKNK`) REFERENCES `hockynienkhoa` (`MAHKNK`),
  ADD CONSTRAINT `FK__UOC_PHAN_CONG` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`);

--
-- Các ràng buộc cho bảng `bao_cao_ket_thuc_mon`
--
ALTER TABLE `bao_cao_ket_thuc_mon`
  ADD CONSTRAINT `FK_BAO_CAO_KET_THUC_MON` FOREIGN KEY (`MADANHGIAKETTHUC`) REFERENCES `hinhthucdanhgia` (`MADANHGIAKETTHUC`),
  ADD CONSTRAINT `FK_BAO_CAO_KET_THUC_MON2` FOREIGN KEY (`MACHITIETPHANCONG`) REFERENCES `chitietphancong` (`MACHITIETPHANCONG`);

--
-- Các ràng buộc cho bảng `bomon`
--
ALTER TABLE `bomon`
  ADD CONSTRAINT `FK_THUOC_KHOA` FOREIGN KEY (`MAKHOA`) REFERENCES `khoa` (`MAKHOA`);

--
-- Các ràng buộc cho bảng `chitietphancong`
--
ALTER TABLE `chitietphancong`
  ADD CONSTRAINT `FK_CO` FOREIGN KEY (`MAPHANCONG`) REFERENCES `bangphancong` (`MAPHANCONG`),
  ADD CONSTRAINT `FK_PHAN_CONG_DAY` FOREIGN KEY (`MALOP`) REFERENCES `lop` (`MALOP`),
  ADD CONSTRAINT `FK_PHAN_CONG_MON_HOC` FOREIGN KEY (`MAMONHOC`) REFERENCES `monhoc` (`MAMONHOC`);

--
-- Các ràng buộc cho bảng `chon_khung`
--
ALTER TABLE `chon_khung`
  ADD CONSTRAINT `FK_CHON_KHUNG` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`),
  ADD CONSTRAINT `FK_CHON_KHUNG2` FOREIGN KEY (`MANAMHOC`) REFERENCES `namhoc` (`MANAMHOC`),
  ADD CONSTRAINT `FK_CHON_KHUNG3` FOREIGN KEY (`MAKHUNG`) REFERENCES `khunggiochuan` (`MAKHUNG`);

--
-- Các ràng buộc cho bảng `chuongtrinhdaotao`
--
ALTER TABLE `chuongtrinhdaotao`
  ADD CONSTRAINT `FK_THUOC_CHUONG_TRINH__AO_TAO` FOREIGN KEY (`MABOMON`) REFERENCES `bomon` (`MABOMON`);

--
-- Các ràng buộc cho bảng `co_chuc_danh`
--
ALTER TABLE `co_chuc_danh`
  ADD CONSTRAINT `FK_CO_CHUC_DANH` FOREIGN KEY (`MACHUCDANH`) REFERENCES `chucdanh` (`MACHUCDANH`),
  ADD CONSTRAINT `FK_CO_CHUC_DANH2` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`);

--
-- Các ràng buộc cho bảng `co_ty_le`
--
ALTER TABLE `co_ty_le`
  ADD CONSTRAINT `FK_CO_TY_LE` FOREIGN KEY (`MA_QUY_DOI`) REFERENCES `ty_le_quy_doi_gio_chuan` (`MA_QUY_DOI`),
  ADD CONSTRAINT `FK_CO_TY_LE2` FOREIGN KEY (`MA_LOAI_DANH_MUC`) REFERENCES `loai_danh_muc` (`MA_LOAI_DANH_MUC`),
  ADD CONSTRAINT `FK_CO_TY_LE3` FOREIGN KEY (`MA_LOAI_TAC_GIA`) REFERENCES `loai_tac_gia` (`MA_LOAI_TAC_GIA`);

--
-- Các ràng buộc cho bảng `dang_ky_thuc_hien_quy_doi`
--
ALTER TABLE `dang_ky_thuc_hien_quy_doi`
  ADD CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI` FOREIGN KEY (`MA_DANH_MUC`) REFERENCES `danhmucquydoispkhcn` (`MA_DANH_MUC`),
  ADD CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI2` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`),
  ADD CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI3` FOREIGN KEY (`MANAMHOC`) REFERENCES `namhoc` (`MANAMHOC`),
  ADD CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI4` FOREIGN KEY (`MA_LOAI_TAC_GIA`) REFERENCES `loai_tac_gia` (`MA_LOAI_TAC_GIA`),
  ADD CONSTRAINT `FK_DANG_KY_THUC_HIEN_QUY_DOI5` FOREIGN KEY (`TEN_DE_TAI`) REFERENCES `nghien_cuu_kh` (`TEN_DE_TAI`);

--
-- Các ràng buộc cho bảng `danhmucquydoispkhcn`
--
ALTER TABLE `danhmucquydoispkhcn`
  ADD CONSTRAINT `FK_THUOC_DANH_MUC` FOREIGN KEY (`MA_LOAI_DANH_MUC`) REFERENCES `loai_danh_muc` (`MA_LOAI_DANH_MUC`);

--
-- Các ràng buộc cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD CONSTRAINT `FK_THUOC_BO_MON` FOREIGN KEY (`MABOMON`) REFERENCES `bomon` (`MABOMON`);

--
-- Các ràng buộc cho bảng `giu_chuc_vu`
--
ALTER TABLE `giu_chuc_vu`
  ADD CONSTRAINT `FK_GIU_CHUC_VU` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`),
  ADD CONSTRAINT `FK_GIU_CHUC_VU2` FOREIGN KEY (`MACHUCVU`) REFERENCES `chucvu` (`MACHUCVU`);

--
-- Các ràng buộc cho bảng `khunggiochuan`
--
ALTER TABLE `khunggiochuan`
  ADD CONSTRAINT `FK_CO_KHUNG_GIO_CHUAN` FOREIGN KEY (`MACHUCDANH`) REFERENCES `chucdanh` (`MACHUCDANH`);

--
-- Các ràng buộc cho bảng `lop`
--
ALTER TABLE `lop`
  ADD CONSTRAINT `FK_HOC` FOREIGN KEY (`MACHUONGTRINH`) REFERENCES `chuongtrinhdaotao` (`MACHUONGTRINH`);

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `FK_TAI_KHOAN_CUA_GIANG_VIEN` FOREIGN KEY (`MAGV`) REFERENCES `giangvien` (`MAGV`);

--
-- Các ràng buộc cho bảng `thuoc`
--
ALTER TABLE `thuoc`
  ADD CONSTRAINT `FK_THUOC` FOREIGN KEY (`MACHUONGTRINH`) REFERENCES `chuongtrinhdaotao` (`MACHUONGTRINH`),
  ADD CONSTRAINT `FK_THUOC2` FOREIGN KEY (`MAMONHOC`) REFERENCES `monhoc` (`MAMONHOC`);

--
-- Các ràng buộc cho bảng `ty_le_quy_doi_gio_chuan`
--
ALTER TABLE `ty_le_quy_doi_gio_chuan`
  ADD CONSTRAINT `FK_DUOC_QUY_DINH` FOREIGN KEY (`MA_QUY_DINH`) REFERENCES `quy_dinh` (`MA_QUY_DINH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
