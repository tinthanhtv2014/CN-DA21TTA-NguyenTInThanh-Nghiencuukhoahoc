const express = require("express");
const app = express();
const pool = require("../../config/database");
const router = express.Router();
const axios = require("axios");
const {
  GiangVien_thuoc_KhoaController,
  timkiem_email_taikhoanController,
  timkiem_email_taikhoan_ngoaitruongController,
} = require("../../controllers/TruongkhoaController/TruongKhoaController");

const {
  LoaiDanhMucExcelController,
  DanhMucExcelController,
  TyLeExcelController,
  CoTyLeExcelController,

  PhanCongControllerTest,

  Training_RandomForestControllerTest,
} = require("../../controllers/TruongkhoaController/testControler");

const { GOI_Y_SERVER, GOI_Y_SERVER_rf } = require("../../utils/controllerTEST");

const { checkUserJWT } = require("../../middlewares/JWTAction");
const TruongKhoaRoute = (app) => {
  router.get("/xem", checkUserJWT, GiangVien_thuoc_KhoaController);
  router.post("/timkiem/email", timkiem_email_taikhoanController);
  router.post(
    "/timkiem/ngoaitruong/email",
    checkUserJWT,
    timkiem_email_taikhoan_ngoaitruongController
  );
  router.post("/test/tao/excel", checkUserJWT, CoTyLeExcelController); // Chạy CSDL bằng excel
  // router.post("/test/phancong", checkUserJWT, PhanCongControllerTest);
  router.post(
    "/test/phancong",
    checkUserJWT,
    Training_RandomForestControllerTest
  );

  // router.post("/test/python", checkUserJWT, Training_RandomForestControllerTest);

  router.get("/test/dudoan", checkUserJWT, GOI_Y_SERVER);
  router.post("/test/dudoan/rf", checkUserJWT, GOI_Y_SERVER_rf);

  router.get("/allbomon", async (req, res) => {
    try {
      const [rows] = await pool.execute(
        `SELECT * 
        FROM bomon,khoa 
        where khoa.MAKHOA = bomon.MAKHOA 
        and khoa.TENKHOA = N'Khoa Kỹ Thuật Công Nghệ'`
      );

      // Trả về dữ liệu dưới dạng JSON
      res.status(200).json({
        EM: "Lỗi services selectBomon",
        EC: 1,
        DT: rows,
      });
    } catch (error) {
      console.error("Lỗi truy vấn:", error);
      res.status(500).json({
        message: "Lỗi máy chủ",
        error: error.message,
      });
    }
  });

  router.get("/allbomon/chuachonkhung", async (req, res) => {
    try {
      const TENBOMON = req.body.TENBOMON;
      con;
      let [results_ctdt_bomon, fields1] = await pool.execute(
        `SELECT gv.*
        FROM giangvien,chon_khung,
        
        WHERE ck.MAGV IS NULL
        AND bomon.TENBOMON = ?;`
      );
      // Trả về dữ liệu dưới dạng JSON
      res.status(200).json({
        EM: "Lỗi services selectBomon",
        EC: 1,
        DT: rows,
      });
    } catch (error) {
      console.error("Lỗi truy vấn:", error);
      res.status(500).json({
        message: "Lỗi máy chủ",
        error: error.message,
      });
    }
  });

  router.post("/danhsachgiangvienchuadangkychonkhung", async (req, res) => {
    // try {
    const TENNAMHOC = req.body.TENNAMHOC;
    const TENBOMON = req.body.TENBOMON;
    let [results_ctdt_bomon, fields1] = await pool.execute(
      `SELECT gv.*
FROM giangvien gv
JOIN bomon bm ON gv.MABOMON = bm.MABOMON
WHERE NOT EXISTS (
    SELECT 1
    FROM chon_khung ck
    JOIN namhoc nh ON ck.MANAMHOC = nh.MANAMHOC
    WHERE ck.MAGV = gv.MAGV
    AND nh.TENNAMHOC = ?
)
AND bm.TENBOMON = ?;

`,
      [TENNAMHOC, TENBOMON]
    );
    return res.status(200).json({
      EM: " mã lớp hoặc chương trình bị rỗng",
      EC: 1,
      DT: results_ctdt_bomon,
    });
    // } catch (err) {
    //   console.error("Error fetching hotels:", err.message);
    //   res.status(500).json({ message: err.message });
    // }
  });

  router.post("/danhsachgiangviendadangkychonkhung", async (req, res) => {
    // try {
    const TENNAMHOC = req.body.TENNAMHOC;
    const TENBOMON = req.body.TENBOMON;
    let [results_ctdt_bomon, fields1] = await pool.execute(
      `SELECT gv.*, nh.TENNAMHOC, kgc.*
   FROM giangvien gv
   JOIN bomon bm ON gv.MABOMON = bm.MABOMON
   JOIN chon_khung ck ON gv.MAGV = ck.MAGV
   JOIN khunggiochuan kgc ON kgc.MAKHUNG = ck.MAKHUNG
   JOIN namhoc nh ON nh.MANAMHOC = ck.MANAMHOC
   JOIN taikhoan tk ON gv.MAGV = tk.MAGV
   WHERE tk.TENDANGNHAP IS NOT NULL
   AND nh.TENNAMHOC = ?
   AND bm.TENBOMON = ?
   AND bm.MABOMON = gv.MABOMON`,
      [TENNAMHOC, TENBOMON]
    );
    let danhSachGiangVienDaChonKhung = [];

    results_ctdt_bomon.forEach((dong) => {
      let MaGV = danhSachGiangVienDaChonKhung.find(
        (gv) => gv.MAGV === dong.MAGV
      );

      if (!MaGV) {
        MaGV = {
          MAGV: dong.MAGV,
          ThongtinGiangvien: [],
        };
        danhSachGiangVienDaChonKhung.push(MaGV);
      }

      let giangvien = MaGV.ThongtinGiangvien.find(
        (m) => m.TENGV === dong.TENGV
      );

      if (!giangvien) {
        giangvien = {
          MABOMON: dong.MABOMON,
          TENNAMHOC: dong.TENNAMHOC,
          TENGIANGVIEN: dong.TENGV,
          EMAIL: dong.EMAIL,
          GIOCHUAN: [],
        };
        MaGV.ThongtinGiangvien.push(giangvien);
      }
      if (!giangvien.GIOCHUAN.includes(dong.TENKHHUNGCHUAN)) {
        giangvien.GIOCHUAN.push({
          GIOGIANGDAY_HANHCHINH: dong.GIOGIANGDAY_HANHCHINH,
          GIOGIANGDAY_CHUAN: dong.GIOGIANGDAY_CHUAN,
          GIONGHIENCUUKHOAHOC_HANHCHINH: dong.GIONGHIENCUUKHOAHOC_HANHCHINH,
          GIONGHIENCUUKHOAHOC_CHUAN: dong.GIONGHIENCUUKHOAHOC_CHUAN,
          GIOPHUCVUCONGDONG_HANHCHINH: dong.GIOPHUCVUCONGDONG_HANHCHINH,
          GIOPHUCVUCONGDONG_CHUAN: dong.GIOPHUCVUCONGDONG_CHUAN,
        });
      }
    });

    return res.status(200).json({
      EM: " mã lớp hoặc chương trình bị rỗng",
      EC: 1,
      DT: danhSachGiangVienDaChonKhung,
    });
    // } catch (err) {
    //   console.error("Error fetching hotels:", err.message);
    //   res.status(500).json({ message: err.message });
    // }
  });

  router.post("/danhsachgiangviendangkynkhktheobomon", async (req, res) => {
    // try {
    const TENNAMHOC = req.body.TENNAMHOC;
    const TENBOMON = req.body.TENBOMON;
    let [results_ctdt_bomon, fields1] = await pool.execute(
      `SELECT 
    giangvien.*, 
    namhoc.TENNAMHOC, 
    COUNT(dang_ky_thuc_hien_quy_doi.TEN_DE_TAI) AS SoLuongDeTai,
    GROUP_CONCAT(dang_ky_thuc_hien_quy_doi.TEN_DE_TAI SEPARATOR ', ') AS DanhSachDeTai
FROM 
    giangvien
JOIN 
    bomon ON bomon.MABOMON = giangvien.MABOMON
JOIN 
    dang_ky_thuc_hien_quy_doi 
    ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
JOIN 
    namhoc 
    ON namhoc.MANAMHOC = dang_ky_thuc_hien_quy_doi.MANAMHOC
WHERE 
    namhoc.TENNAMHOC = ? 
    AND bomon.TENBOMON = ? 
GROUP BY 
    giangvien.MAGV, giangvien.TENGV, namhoc.TENNAMHOC;

`,
      [TENNAMHOC, TENBOMON]
    );
    return res.status(200).json({
      EM: " mã lớp hoặc chương trình bị rỗng",
      EC: 200,
      DT: results_ctdt_bomon,
    });
    // } catch (err) {
    //   console.error("Error fetching hotels:", err.message);
    //   res.status(500).json({ message: err.message });
    // }
  });

  router.post("/danhsachgiangvienchuadangkynkhktheobomon", async (req, res) => {
    try {
      const TENNAMHOC = req.body.TENNAMHOC;
      const TENBOMON = req.body.TENBOMON;
      let [results_ctdt_bomon, fields1] = await pool.execute(
        `SELECT 
    giangvien.*
FROM 
    giangvien
LEFT JOIN 
    bomon ON bomon.MABOMON = giangvien.MABOMON
LEFT JOIN 
    dang_ky_thuc_hien_quy_doi 
    ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
    AND dang_ky_thuc_hien_quy_doi.MANAMHOC = (SELECT MANAMHOC FROM namhoc WHERE TENNAMHOC = ?)
WHERE 
    dang_ky_thuc_hien_quy_doi.MAGV IS NULL
    AND bomon.TENBOMON = ?;

`,
        [TENNAMHOC, TENBOMON]
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

  router.post("/bomondangkynhieunhat", async (req, res) => {
    try {
      const TENNAMHOC = req.body.TENNAMHOC;
      let [results_ctdt_bomon, fields1] = await pool.execute(
        `SELECT bomon.TENBOMON, COUNT(dang_ky_thuc_hien_quy_doi.MAGV) AS SoLuongDeTai
FROM bomon
INNER JOIN giangvien ON bomon.MABOMON = giangvien.MABOMON
INNER JOIN khoa ON khoa.MAKHOA = bomon.MAKHOA
INNER JOIN dang_ky_thuc_hien_quy_doi ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
INNER JOIN namhoc ON namhoc.MANAMHOC = dang_ky_thuc_hien_quy_doi.MANAMHOC
WHERE khoa.TENKHOA = N'Khoa Kỹ Thuật Công Nghệ'
AND namhoc.TENNAMHOC = ?
GROUP BY bomon.TENBOMON
ORDER BY SoLuongDeTai DESC
LIMIT 1;

`,
        [TENNAMHOC]
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

  router.post("/laytongsoluong", async (req, res) => {
    try {
      const TENNAMHOC = req.body.TENNAMHOC;
      let [results_ctdt_bomon, fields1] = await pool.execute(
        ` SELECT COUNT(dang_ky_thuc_hien_quy_doi.MAGV) AS TongSoLuongDeTai
FROM bomon
INNER JOIN giangvien ON bomon.MABOMON = giangvien.MABOMON
INNER JOIN khoa ON khoa.MAKHOA = bomon.MAKHOA
INNER JOIN dang_ky_thuc_hien_quy_doi ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
INNER JOIN namhoc ON namhoc.MANAMHOC = dang_ky_thuc_hien_quy_doi.MANAMHOC
WHERE khoa.TENKHOA = N'Khoa Kỹ Thuật Công Nghệ'
AND namhoc.TENNAMHOC = ?

`,
        [TENNAMHOC]
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

  router.post("/laygiangviendangkynhieunhat", async (req, res) => {
    try {
      const TENNAMHOC = req.body.TENNAMHOC;
      let [results_ctdt_bomon, fields1] = await pool.execute(
        ` SELECT 
    giangvien.TENGV AS TenGiangVien, 
    COUNT(dang_ky_thuc_hien_quy_doi.MAGV) AS SoLuongDeTai
FROM bomon
INNER JOIN giangvien ON bomon.MABOMON = giangvien.MABOMON
INNER JOIN khoa ON khoa.MAKHOA = bomon.MAKHOA
INNER JOIN dang_ky_thuc_hien_quy_doi ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
INNER JOIN namhoc ON namhoc.MANAMHOC = dang_ky_thuc_hien_quy_doi.MANAMHOC
WHERE khoa.TENKHOA = 'Khoa Kỹ Thuật Công Nghệ'
AND namhoc.TENNAMHOC = ?
GROUP BY giangvien.TENGV
ORDER BY SoLuongDeTai DESC
LIMIT 1;
`,
        [TENNAMHOC]
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

  router.post("/laydanhsachgiangviendangkytheobomon", async (req, res) => {
    try {
      const TENNAMHOC = req.body.TENNAMHOC;
      const TENBOMON = req.body.TENBOMON;
      let [results_ctdt_bomon, fields1] = await pool.execute(
        `SELECT 
    giangvien.TENGV AS TenGiangVien, 
    COUNT(dang_ky_thuc_hien_quy_doi.MAGV) AS SoLuongDeTai
FROM bomon
INNER JOIN giangvien 
    ON bomon.MABOMON = giangvien.MABOMON
INNER JOIN khoa 
    ON khoa.MAKHOA = bomon.MAKHOA
LEFT JOIN dang_ky_thuc_hien_quy_doi 
    ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
    AND dang_ky_thuc_hien_quy_doi.MANAMHOC = (
        SELECT MANAMHOC FROM namhoc WHERE TENNAMHOC = ?
    ) -- Điều kiện năm học từ tham số
WHERE bomon.TENBOMON = ?
GROUP BY giangvien.TENGV
ORDER BY SoLuongDeTai DESC;
`,
        [TENNAMHOC, TENBOMON]
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

  router.post("/laydanhsachchudegiangviendangkynhieunhat", async (req, res) => {
    try {
      const TENNAMHOC = req.body.TENNAMHOC;
      let [results_ctdt_bomon, fields1] = await pool.execute(
        `SELECT 
    giangvien.TENGV AS TenGiangVien, 
    COUNT(dang_ky_thuc_hien_quy_doi.MAGV) AS SoLuongDeTai,
    danhmucquydoispkhcn.DON_VI_TINH AS DonViTinh
FROM giangvien 
LEFT JOIN taikhoan 
    ON taikhoan.MAGV = giangvien.MAGV
LEFT JOIN dang_ky_thuc_hien_quy_doi 
    ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
LEFT JOIN danhmucquydoispkhcn 
    ON dang_ky_thuc_hien_quy_doi.MA_DANH_MUC = danhmucquydoispkhcn.MA_DANH_MUC
LEFT JOIN namhoc
    ON namhoc.MANAMHOC = dang_ky_thuc_hien_quy_doi.MANAMHOC -- Hoặc bảng liên kết đúng với giảng viên
WHERE namhoc.TENNAMHOC = ?
GROUP BY danhmucquydoispkhcn.DON_VI_TINH
HAVING COUNT(dang_ky_thuc_hien_quy_doi.MAGV) > 0 -- Bỏ qua các giá trị có SoLuongDeTai = 0
ORDER BY SoLuongDeTai DESC;


`,
        [TENNAMHOC]
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

  router.post("/laydanhsachcuabanthan", async (req, res) => {
    try {
      const TENDANGNHAP = req.body.TENDANGNHAP;
      let [results_ctdt_bomon, fields1] = await pool.execute(
        `SELECT k.TENKHOA, bomon.TENBOMON, giangvien.MAGV, giangvien.TENGV,
       khunggiochuan.*, taikhoan.TENDANGNHAP
FROM namhoc
JOIN chon_khung ON namhoc.MANAMHOC = chon_khung.MANAMHOC
JOIN giangvien ON chon_khung.MAGV = giangvien.MAGV
JOIN khunggiochuan ON chon_khung.MAKHUNG = khunggiochuan.MAKHUNG
JOIN bomon ON bomon.MABOMON = giangvien.MABOMON
JOIN khoa AS k ON k.MAKHOA = bomon.MAKHOA
JOIN taikhoan ON taikhoan.MAGV = giangvien.MAGV
WHERE chon_khung.MAGV IS NOT NULL
  AND taikhoan.TENDANGNHAP = ?
LIMIT 5;
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

  router.get("/laydanhsachloaitacgia", async (req, res) => {
    try {
      let [results_ctdt_bomon, fields1] = await pool.execute(
        `SELECT  loai_tac_gia.TEN_LOAI_TAC_GIA, COUNT(*) AS so_luong_nghien_cuu
FROM dang_ky_thuc_hien_quy_doi
JOIN loai_tac_gia ON loai_tac_gia.MA_LOAI_TAC_GIA = dang_ky_thuc_hien_quy_doi.MA_LOAI_TAC_GIA
GROUP BY loai_tac_gia.MA_LOAI_TAC_GIA, loai_tac_gia.TEN_LOAI_TAC_GIA;
`
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

  router.get("/laydanhsachtheothoigian", async (req, res) => {
    try {
      let [results_ctdt_bomon, fields1] = await pool.execute(
        `SELECT 
  CASE 
    WHEN SOGIOQUYDOI BETWEEN 0 AND 100 THEN '0-100 giờ'
    WHEN SOGIOQUYDOI BETWEEN 101 AND 200 THEN '101-200 giờ'
    WHEN SOGIOQUYDOI BETWEEN 201 AND 300 THEN '201-300 giờ'
    WHEN SOGIOQUYDOI BETWEEN 301 AND 400 THEN '301-400 giờ'
    ELSE 'Khác'
  END AS GIO_QUY_DOI_KHOANG,
  COUNT(*) AS so_luong_nghien_cuu
FROM dang_ky_thuc_hien_quy_doi
GROUP BY GIO_QUY_DOI_KHOANG;

`
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

  return app.use("/api/v1/truongkhoa", router);
};

module.exports = TruongKhoaRoute;
