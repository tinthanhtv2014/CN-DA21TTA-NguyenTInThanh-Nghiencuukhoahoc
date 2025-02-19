const express = require("express");
const router = express.Router();
const {
  getDanhMucQuyDoi,
  addDanhMucQuyDoi,
  editDanhMucQuyDoi,
  removeDanhMucQuyDoi,
  getOnlyDanhMucQuyDoi,

  getQuyDinh,
  addQuyDinh,
  editQuyDinh,
  removeQuyDinh,
  getAllQuyDinh_TRANGTHAI,

  getLoaiDanhMuc,
  addLoaiDanhMuc,
  editLoaiDanhMuc,
  removeLoaiDanhMuc,
  getLoaiDanhMuc_TRANGTHAI,

  getLoaiTacGia,
  addLoaiTacGia,
  editLoaiTacGia,
  removeLoaiTacGia,

  getTyLeQuyDoi,
  addTyLeQuyDoi,
  editTyLeQuyDoi,
  removeTyLeQuyDoi,

  getAll_Co_Quy_Dinh,
  addCoQuyDinh,
  add_Co_Quy_Dinh_excel,
  getAll_Co_Quy_Dinh_REQ,
} = require("../../controllers/AdminController/danhmucAdminController.js");

const { checkUserJWT } = require("../../middlewares/JWTAction.js");

const CRUDDanhMuc = (app) => {
  // Route cho các API quản lý quy định, yêu cầu xác thực JWT
  router.get("/quydinh", checkUserJWT, getQuyDinh);
  router.post("/quydinh", checkUserJWT, addQuyDinh);
  router.post("/quydinh/trangthai", checkUserJWT, getAllQuyDinh_TRANGTHAI);
  router.put("/quydinh/:id", checkUserJWT, editQuyDinh);
  router.delete("/quydinh/:id", checkUserJWT, removeQuyDinh);

  // Route cho các API quản lý danh mục quy đổi, yêu cầu xác thực JWT
  router.get("/danhmucquydoi", checkUserJWT, getDanhMucQuyDoi);
  router.get("/danhmucquydoi/:id", checkUserJWT, getOnlyDanhMucQuyDoi);
  router.post("/danhmucquydoi", checkUserJWT, addDanhMucQuyDoi);
  router.put("/danhmucquydoi/:id", checkUserJWT, editDanhMucQuyDoi);
  router.delete("/danhmucquydoi/:id", checkUserJWT, removeDanhMucQuyDoi);

  // Route cho các API quản lý loại danh mục, yêu cầu xác thực JWT
  router.get("/loaidanhmuc", checkUserJWT, getLoaiDanhMuc);
  router.post("/loaidanhmuc", checkUserJWT, addLoaiDanhMuc);
  router.post("/loaidanhmuc/trangthai", checkUserJWT, getLoaiDanhMuc_TRANGTHAI);
  router.put("/loaidanhmuc/:id", checkUserJWT, editLoaiDanhMuc);
  router.delete("/loaidanhmuc/:id", checkUserJWT, removeLoaiDanhMuc);

  // Route cho các API quản lý loại tác giả, yêu cầu xác thực JWT
  router.get("/loaitacgia", getLoaiTacGia);
  router.post("/loaitacgia", checkUserJWT, addLoaiTacGia);
  router.put("/loaitacgia/:id", checkUserJWT, editLoaiTacGia);
  router.delete("/loaitacgia/:id", checkUserJWT, removeLoaiTacGia);

  // Route cho các API quản lý tỷ lệ quy đổi, yêu cầu xác thực JWT
  router.get("/tylequydoi", checkUserJWT, getTyLeQuyDoi);
  router.post("/tylequydoi", checkUserJWT, addTyLeQuyDoi);
  router.put("/tylequydoi/:id", checkUserJWT, editTyLeQuyDoi);
  router.delete("/tylequydoi/:id", checkUserJWT, removeTyLeQuyDoi);

  // Route cho các API bảng có quy định yêu cầu xác thực JWT
  router.get("/coquydinh", checkUserJWT, getAll_Co_Quy_Dinh);
  router.post("/coquydinh", checkUserJWT, addCoQuyDinh);
  router.post("/coquydinh/xem", checkUserJWT, getAll_Co_Quy_Dinh_REQ);
  router.post("/coquydinh/excel", checkUserJWT, add_Co_Quy_Dinh_excel);
  return app.use("/api/v1/admin/danhmuc", router);
};

module.exports = CRUDDanhMuc;
