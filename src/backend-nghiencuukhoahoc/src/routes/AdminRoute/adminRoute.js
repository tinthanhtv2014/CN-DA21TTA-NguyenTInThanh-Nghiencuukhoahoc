const express = require("express");
const app = express();
const pool = require("../../config/database.js");
const nodemailer = require("nodemailer");
require("dotenv").config();
const bcrypt = require("bcrypt");
const saltRounds = 10;
const salt = bcrypt.genSaltSync(saltRounds);
const router = express.Router();
// const { RandomForestClassifier } = require("ml-random-forest");
const {
  getAllTaiKhoanController,
  createTaiKhoanController,
  createTaiKhoanExcelController,
  updateTaiKhoanController,
  createTaiKhoanOnlyController,
  loginTaikhoanGOOGLEController,
  loginTaikhoanAdminController,
  logoutTaikhoanAdminController,
  getAllTaiKhoanPHANQUYENController,
  getAllTaiKhoanTRANGTHAIController,
} = require("../../controllers/AdminController/adminController.js");
const { checkUserJWT } = require("../../middlewares/JWTAction.js");

const CRUDTaiKhoan = (app) => {
  // Routes không yêu cầu xác thực JWT
  router.post("/dangnhap", loginTaikhoanAdminController); // Đăng nhập với tài khoản và mật khẩu
  router.post("/dangxuat", logoutTaikhoanAdminController); // Đăng xuất
  router.post("/dangnhapgoogle", loginTaikhoanGOOGLEController); // Đăng nhập với email Google

  // Các routes yêu cầu xác thực JWT
  router.post("/tao", checkUserJWT, createTaiKhoanController); // Tạo tài khoản
  router.post("/tao/excel", checkUserJWT, createTaiKhoanExcelController); // Tạo hàng loạt tài khoản
  router.post("/only/tao", checkUserJWT, createTaiKhoanOnlyController); // Tạo tài khoản chỉ với thông tin cần thiết

  router.post("/xem", checkUserJWT, getAllTaiKhoanController); // Xem tất cả tài khoản theo mã bộ môn
  router.get(
    "/xem/phanquyen/:MABOMON",
    checkUserJWT,
    getAllTaiKhoanPHANQUYENController
  ); // Xem tài khoản theo phân quyền và mã bộ môn
  router.get(
    "/xem/trangthai/:MABOMON",
    checkUserJWT,
    getAllTaiKhoanTRANGTHAIController
  ); // Xem tài khoản theo trạng thái và mã bộ môn
  router.get("/protected", checkUserJWT, (req, res) => {
    res.json({ message: "Protected data", user: req.user }); // Sử dụng thông tin người dùng từ req.user
  });

  // Sửa tài khoản
  router.put("/sua/:tenDangNhap", checkUserJWT, updateTaiKhoanController);

  let savedOtp = {}; // Biến toàn cục để lưu OTP (chỉ dùng để demo)

  const hashPassword = (userPassword) => {
    let hashPassword = bcrypt.hashSync(userPassword, salt);
    //let check = bcrypt.compareSync(password, hashPassword);
    return hashPassword;
  };
  //đổi mật khẩu với OTP
  router.put("/doimatkhau/:tendangnhap", async (req, res) => {
    const tendangnhap = req.params.tendangnhap;
    const matkhaumoi = req.body.newPassword;
    let hashpass = await hashPassword(matkhaumoi);
    const [results, fields] = await pool.execute(
      `UPDATE taikhoan SET MATKHAU = ? WHERE TENDANGNHAP = ?`,
      [hashpass, tendangnhap]
    );

    return res.status(200).json({ message: "OTP is valid", EC: 1 });
  });

  //SEND OTP
  router.post("/sendotpdoimatkhau", async (req, res) => {
    const { action, email, otp } = req.body;

    if (!action || !email) {
      return res.status(400).json({ message: "Action and email are required" });
    }

    try {
      if (action === "send") {
        savedOtp[email] = otp;

        // Thiết lập transporter cho nodemailer
        const transporter = nodemailer.createTransport({
          service: "gmail",
          auth: {
            user: process.env.EMAIL_USER, // Tài khoản Gmail của bạn
            pass: process.env.EMAIL_PASSWORD, // Mật khẩu ứng dụng (App Password)
          },
        });

        // Gửi OTP qua email
        await transporter.sendMail({
          from: process.env.EMAIL_USER, // Địa chỉ email gửi
          to: email, // Địa chỉ email nhận
          subject: "Verify to change your password", // Tiêu đề email
          text: `Your OTP code is: ${otp}`, // Nội dung email chứa OTP
        });

        return res.status(200).json({ message: "OTP sent successfully!" });
      }

      if (action === "verify") {
        if (savedOtp[email] && savedOtp[email] === otp) {
          delete savedOtp[email]; // Xóa OTP sau khi xác thực
          return res.status(200).json({ message: "OTP is valid", EC: 1 });
        } else {
          return res.status(400).json({ message: "Invalid OTP" });
        }
      }

      res.status(400).json({ message: "Invalid action" });
    } catch (error) {
      res.status(500).json({ message: "Something went wrong", error });
    }
  });

  //KIỂM TRA TÊN ĐĂNG NHẬP
  router.post("/timkiemtaikhoan", async (req, res) => {
    const tendangnhap = req.body.tendangnhap;

    const [results, fields] = await pool.execute(
      `select * from taikhoan where TENDANGNHAP = ?`,
      [tendangnhap]
    );

    if (results.length > 0) {
      return res.status(200).json({ message: "đã tìm thấy", EC: 1 });
    }
    return res.status(200).json({ message: "không tìm thấy", EC: 0 });
  });

  return app.use("/api/v1/admin/taikhoan", router);
};

module.exports = CRUDTaiKhoan;
