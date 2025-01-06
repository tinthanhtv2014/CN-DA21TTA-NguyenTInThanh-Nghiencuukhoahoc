const express = require("express");
const router = express.Router();
const pool = require("../../config/database");
const {
  updateThongTinGiangVienController,
} = require("../../controllers/GiangvienController/GiangVienController");
const {
  select_thongtin_danhmuc,
} = require("../../controllers/GiangvienController/danhmucGiangVienCONTROLLER");

const {
  getKhungGioChuan_TENCHUCDANH,
  getAllTenKhung_TENCHUCDANH,
} = require("../../controllers/AdminController/khunggiochuanController");

const {
  create_CHONKHUNG,
  select_CHONKHUNG,
  update_CHONKHUNG,
  create_THOIGIAN_XACNHAN,
  update_THOIGIAN_XACNHAN,
  xem_THOIGIAN_XACNHAN,
  xem_THOIGIAN_XACNHAN_theoTENKHOA,
  delete_THOIGIAN_XACNHAN,
} = require("../../controllers/GiangvienController/ChonkhungGiangvienCONTROLLER");
const { checkUserJWT } = require("../../middlewares/JWTAction");
const QuyenGiangVienRouter = (app) => {
  const router = require("express").Router(); // Thêm dòng này để khởi tạo router
  // route cho giảng viên
  router.put(
    "/sua/thongtin/:TENDANGNHAP",
    checkUserJWT,
    updateThongTinGiangVienController
  );
  router.get(
    "/xem/khunggiochuan/:TENCHUCDANH",
    checkUserJWT,
    getKhungGioChuan_TENCHUCDANH
  ); // Sử dụng phương thức GET thay vì PUT
  router.get(
    "/xem/all/tenkhung/:TENCHUCDANH",
    checkUserJWT,
    getAllTenKhung_TENCHUCDANH
  );
  //route chọn khung cho giảng viên
  router.post("/xem/canhan/khunggiochuan", checkUserJWT, select_CHONKHUNG); // xem thông tin khung chuẩn của 1 giảng viên
  router.post("/tao/khunggiochuan", checkUserJWT, create_CHONKHUNG); // tạo khung chuẩn cho 1 giảng viên chưa có
  router.post("/tao/thoigianxacnhan", checkUserJWT, create_THOIGIAN_XACNHAN);
  router.post("/xoa/thoigianxacnhan", checkUserJWT, delete_THOIGIAN_XACNHAN);
  router.put(
    "/sua/thoigianxacnhan/:SONGAYKETTHUC",
    checkUserJWT,
    update_THOIGIAN_XACNHAN
  );
  router.get("/xem/thoigianxacnhan", checkUserJWT, xem_THOIGIAN_XACNHAN);
  router.get(
    "/xem/thoigianxacnhantheokhoa/:tenKhoa",
    checkUserJWT,
    xem_THOIGIAN_XACNHAN_theoTENKHOA
  );

  // router.put("/sua/khunggiochuan/:MAGV", update_CHONKHUNG); //phúc viểt

  //router cho danh mục chọn khung
  router.post(
    "/xem/canhan/thongtinkhung",
    checkUserJWT,
    select_thongtin_danhmuc
  );

  ////////////////////////
  ////////////////////////
  ////////////////////////
  ////////////////////////
  ////////////////////////
  ////////////////////////
  ////////////////////////

  router.post("/laysoluongdetaicanhantheonam", async (req, res) => {
    try {
      const TENDANGNHAP = req.body.TENDANGNHAP;
      let [results_ctdt_bomon, fields1] = await pool.execute(
        `SELECT 
    namhoc.TENNAMHOC AS NamHoc,
    COALESCE(COUNT(dang_ky_thuc_hien_quy_doi.MAGV), 0) AS TongSoLuongDeTai
FROM namhoc
LEFT JOIN dang_ky_thuc_hien_quy_doi
    ON namhoc.MANAMHOC = dang_ky_thuc_hien_quy_doi.MANAMHOC
LEFT JOIN taikhoan
    ON taikhoan.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
WHERE taikhoan.TENDANGNHAP = ?  
GROUP BY namhoc.TENNAMHOC
ORDER BY namhoc.TENNAMHOC;
`,
        [TENDANGNHAP]
      );
      return res.status(200).json({
        EM: " mã lớp hoặc chương trình bị rỗng",
        EC: 200,
        DT: results_ctdt_bomon,
      });
    } catch (err) {
      console.error("Error fetching hotels:", err.message);
      res.status(500).json({ message: err.message });
    }
  });

  router.post(
    "/laysoluongdetaicanhantheophanloainghiencuu",
    async (req, res) => {
      try {
        const TENDANGNHAP = req.body.TENDANGNHAP;
        let [results_ctdt_bomon, fields1] = await pool.execute(
          `SELECT 
    taikhoan.TENDANGNHAP AS TenDangNhap,
    danhmucquydoispkhcn.DON_VI_TINH AS DonViTinh,
    COALESCE(COUNT(dang_ky_thuc_hien_quy_doi.MAGV), 0) AS TongSoLuongDeTai
FROM taikhoan
LEFT JOIN dang_ky_thuc_hien_quy_doi
    ON taikhoan.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
LEFT JOIN danhmucquydoispkhcn
    ON dang_ky_thuc_hien_quy_doi.MA_DANH_MUC = danhmucquydoispkhcn.MA_DANH_MUC
WHERE taikhoan.TENDANGNHAP = 'annb@tvu.edu.vn'  -- Thay dấu ? bằng tên đăng nhập của giảng viên
GROUP BY taikhoan.TENDANGNHAP, danhmucquydoispkhcn.DON_VI_TINH
ORDER BY TongSoLuongDeTai DESC

`,
          [TENDANGNHAP]
        );
        return res.status(200).json({
          EM: " mã lớp hoặc chương trình bị rỗng",
          EC: 200,
          DT: results_ctdt_bomon,
        });
      } catch (err) {
        console.error("Error fetching hotels:", err.message);
        res.status(500).json({ message: err.message });
      }
    }
  );

  router.post("/laydetaicanhantheonam", async (req, res) => {
    try {
      const TENDANGNHAP = req.body.TENDANGNHAP;
      const TENNAMHOC = req.body.TENNAMHOC;
      let [results_ctdt_bomon, fields1] = await pool.execute(
        `SELECT 
    dang_ky_thuc_hien_quy_doi.TEN_DE_TAI,
    namhoc.TENNAMHOC,
    danhmucquydoispkhcn.GIO_CHUAN,
    IFNULL(GROUP_CONCAT(DISTINCT giangvien.TENGV ORDER BY giangvien.TENGV SEPARATOR ', '), '') AS GiangVienGop
FROM 
    loai_tac_gia
JOIN 
    dang_ky_thuc_hien_quy_doi ON loai_tac_gia.MA_LOAI_TAC_GIA = dang_ky_thuc_hien_quy_doi.MA_LOAI_TAC_GIA
JOIN 
    giangvien ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
JOIN 
    namhoc ON namhoc.MANAMHOC = dang_ky_thuc_hien_quy_doi.MANAMHOC
JOIN 
    nghien_cuu_kh ON dang_ky_thuc_hien_quy_doi.TEN_DE_TAI = nghien_cuu_kh.TEN_DE_TAI
JOIN 
    danhmucquydoispkhcn ON dang_ky_thuc_hien_quy_doi.MA_DANH_MUC = danhmucquydoispkhcn.MA_DANH_MUC
JOIN 
    taikhoan ON taikhoan.MAGV = giangvien.MAGV  -- Kết nối bảng taikhoan với giangvien
WHERE 
    namhoc.TENNAMHOC = ?
    AND dang_ky_thuc_hien_quy_doi.TEN_DE_TAI IN (
        SELECT dang_ky_thuc_hien_quy_doi.TEN_DE_TAI
        FROM dang_ky_thuc_hien_quy_doi
        JOIN giangvien ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
        JOIN taikhoan ON taikhoan.MAGV = giangvien.MAGV  -- Thêm kết nối bảng taikhoan
        WHERE taikhoan.TENDANGNHAP = ? -- Thêm điều kiện lọc cho TENDANGNHAP
    )
GROUP BY 
    dang_ky_thuc_hien_quy_doi.TEN_DE_TAI;


`,
        [TENNAMHOC, TENDANGNHAP]
      );
      return res.status(200).json({
        EM: " mã lớp hoặc chương trình bị rỗng",
        EC: 200,
        DT: results_ctdt_bomon,
      });
    } catch (err) {
      console.error("Error fetching hotels:", err.message);
      res.status(500).json({ message: err.message });
    }
  });

  return app.use("/api/v1/quyengiangvien/giangvien", router);
};

module.exports = QuyenGiangVienRouter;
