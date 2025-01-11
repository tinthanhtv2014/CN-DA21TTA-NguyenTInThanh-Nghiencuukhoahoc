import React, { useState, useEffect } from "react";
import {
  Box,
  Button,
  FormControl,
  InputLabel,
  MenuItem,
  Modal,
  Select,
  TextField,
  Typography,
  createTheme,
} from "@mui/material";
import { toast } from "react-toastify";
// import "../components/KhoaList.scss";
import "./updateGiangVienModal.scss";

const UpdateGiangVienModal = ({
  show,
  handleClose,
  lecturerData,
  updateLecturer,
  dataListChucVuGiangVien,
  dataListChucDanhGiangVien,
  isOpenGetAllApiGV,
}) => {
  const [tenGV, setTenGV] = useState();
  const [tenDangNhapGV, setTenDangNhapGV] = useState();
  const [SodienthoaiGV, setSodienthoaiGV] = useState();
  const [diaChiGiangVien, setdiaChiGiangVien] = useState();
  const [chucVuGiangVien, setchucVuGiangVien] = useState();
  const [ChucDanhGiangVien, setChucDanhGiangVien] = useState();
  const [PhanQuyenGiangVien, setPhanQuyenGiangVien] = useState();
  const [TenBoMon, setTenBoMon] = useState();
  const [TrangThaiDangNhap, setTrangThaiDangNhap] = useState();
  const [TimeChucDanh, setTimeChucDanh] = useState();
  const [TimeChucVu, setTimeChucVu] = useState();
  const [SoQuyetDinh, setSoQuyetDinh] = useState();
  useEffect(() => {
    console.log("Check lecturerData =>", lecturerData);
    if (lecturerData) {
      setTenGV(lecturerData.TENGV);
      setTenDangNhapGV(lecturerData.TENDANGNHAP);
      setdiaChiGiangVien(lecturerData.DIACHI);
      setSodienthoaiGV(lecturerData.DIENTHOAI);
      setChucDanhGiangVien(lecturerData.TENCHUCDANH);
      setchucVuGiangVien(lecturerData.TENCHUCVU);
      setPhanQuyenGiangVien(lecturerData.PHANQUYEN);
      setTenBoMon(lecturerData.TENBOMON);
      setTrangThaiDangNhap(lecturerData.TRANGTHAITAIKHOAN);
      setSoQuyetDinh(lecturerData.SOQUYETDINH);
      if (lecturerData.THOIGIANNHAN) {
        setTimeChucDanh(lecturerData.THOIGIANNHAN.split("T")[0]);
      }

      if (lecturerData.TUNGAY) {
        setTimeChucVu(lecturerData.TUNGAY.split("T")[0]);
      }

      // toast.success("Dữ liệu giảng viên đã được tải.");
    } else {
      toast.error("Không có dữ liệu giảng viên.");
    }
  }, [lecturerData]);
  const handleUpdate = (e) => {
    e.preventDefault();

    try {
      // Kiểm tra số điện thoại (đảm bảo chỉ chứa số và có độ dài hợp lệ)
      const phoneRegex = /^[0-9]{10,11}$/;
      if (!phoneRegex.test(SodienthoaiGV)) {
        alert(
          "Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại hợp lệ."
        );
        return;
      }

      // Kiểm tra ngày tháng (đảm bảo không phải ngày trong tương lai)
      const today = new Date();
      if (TimeChucVu && new Date(TimeChucVu) > today) {
        alert("Ngày nhận chức vụ phải là ngày trong quá khứ.");
        return;
      }
      if (TimeChucDanh && new Date(TimeChucDanh) > today) {
        alert("Thời gian nhận chức danh phải là ngày trong quá khứ.");
        return;
      }

      // Tạo object cập nhật dựa trên các trường có giá trị thay đổi
      const updatedData = {
        ...(tenGV && { TENGV: tenGV }),
        ...(diaChiGiangVien && { DIACHI: diaChiGiangVien }),
        ...(SodienthoaiGV && { DIENTHOAI: SodienthoaiGV }),
        ...(ChucDanhGiangVien && { TENCHUCDANH: ChucDanhGiangVien }),
        ...(chucVuGiangVien && { TENCHUCVU: chucVuGiangVien }),
        ...(PhanQuyenGiangVien && { PHANQUYEN: PhanQuyenGiangVien }),
        ...(tenDangNhapGV && { TENDANGNHAP: tenDangNhapGV }),
        ...(TenBoMon && { TENBOMON: TenBoMon }),
        ...(TrangThaiDangNhap && { TRANGTHAITAIKHOAN: TrangThaiDangNhap }),
        ...(TimeChucDanh && { THOIGIANNHAN: TimeChucDanh }),
        ...(TimeChucVu && { TUNGAY: TimeChucVu }),
        ...(SoQuyetDinh && { SOQUYETDINH: SoQuyetDinh }),
      };

      // Kiểm tra nếu không có thay đổi gì thì thông báo
      if (Object.keys(updatedData).length === 0) {
        alert("Không có thay đổi nào để cập nhật.");
        return;
      }

      // Gọi hàm cập nhật với dữ liệu đã chuẩn bị
      updateLecturer(updatedData);
      alert("Cập nhật thành công!");
    } catch (error) {
      console.error("Đã xảy ra lỗi khi cập nhật giảng viên:", error);
      alert("Đã xảy ra lỗi. Vui lòng thử lại sau.");
    }
  };

  console.log("checkChucDanhGiangVien => ", ChucDanhGiangVien);

  console.log("chucVuGiangVien => ", chucVuGiangVien);
  console.log("tenGV => ", tenGV);
  return (
    <Modal
      open={show}
      onClose={handleClose}
      sx={{
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
      }}
    >
      <Box
        sx={{
          boxShadow: 24,
          p: 4,
          borderRadius: 2,
          width: {
            xs: "90%", // Width for extra small screens
            sm: "70%", // Width for small screens
            md: "50%", // Width for medium and up screens
          },
          maxHeight: "95vh", // Maximum height of the modal
          overflow: "auto", // Enable scrolling if content overflows
        }}
        className="modal-updateGV"
      >
        <Typography variant="h6" component="h2" gutterBottom>
          Thay Đổi Thông Tin Giảng Viên
        </Typography>
        <form onSubmit={handleUpdate}>
          <FormControl fullWidth margin="normal">
            <TextField
              label="Email"
              value={tenDangNhapGV}
              disabled
              variant="outlined"
              className="height-selectGV"
            />
          </FormControl>
          <FormControl fullWidth margin="normal">
            <TextField
              label="Tên Giảng Viên"
              value={tenGV}
              onChange={(e) => setTenGV(e.target.value)}
              variant="outlined"
              className="height-selectGV"
            />
          </FormControl>

          <FormControl fullWidth margin="normal">
            <InputLabel id="chuc-vu-label">Tên Chức Vụ</InputLabel>
            <Select
              displayEmpty
              labelId="chuc-vu-label"
              value={chucVuGiangVien}
              defaultValue={lecturerData.TENCHUCVU}
              onChange={(e) => setchucVuGiangVien(e.target.value)}
              variant="outlined"
              className="height-selectGV"
              label={chucVuGiangVien}
            >
              {dataListChucVuGiangVien && dataListChucVuGiangVien.length > 0 ? (
                dataListChucVuGiangVien.map((chucvu, index) => (
                  <MenuItem key={index} value={chucvu.TENCHUCVU}>
                    {chucvu.TENCHUCVU}
                  </MenuItem>
                ))
              ) : (
                <MenuItem disabled>Chức vụ không có</MenuItem>
              )}
            </Select>
          </FormControl>
          {chucVuGiangVien !== lecturerData.TENCHUCVU ? (
            <>
              <FormControl fullWidth margin="normal">
                <TextField
                  label="Số Quyết Định"
                  value={SoQuyetDinh}
                  onChange={(e) => setSoQuyetDinh(e.target.value)}
                  variant="outlined"
                  className="height-selectGV"
                />
              </FormControl>{" "}
            </>
          ) : (
            false
          )}
          {chucVuGiangVien !== lecturerData.TENCHUCVU ? (
            <>
              {" "}
              <FormControl fullWidth margin="normal">
                <div className="div-inputtime">
                  {" "}
                  <input
                    label="Thời gian nhận chức vụ"
                    type="date"
                    value={TimeChucVu}
                    onChange={(e) => setTimeChucVu(e.target.value)}
                    InputLabelProps={{
                      shrink: true,
                    }}
                    fullWidth
                  />
                </div>
              </FormControl>
            </>
          ) : (
            false
          )}

          <FormControl fullWidth margin="normal">
            <InputLabel id="chuc-danh-label">Tên Chức Danh</InputLabel>
            <Select
              labelId="chuc-danh-label"
              value={ChucDanhGiangVien}
              onChange={(e) => setChucDanhGiangVien(e.target.value)}
              variant="outlined"
              defaultValue={lecturerData.TENCHUCDANH}
              className="height-selectGV"
              label="Tên Chức Danh"
            >
              {dataListChucDanhGiangVien &&
              dataListChucDanhGiangVien.length > 0 ? (
                dataListChucDanhGiangVien.map((chucdanh, index) => (
                  <MenuItem key={index} value={chucdanh.TENCHUCDANH}>
                    {chucdanh.TENCHUCDANH}
                  </MenuItem>
                ))
              ) : (
                <MenuItem disabled>Chức danh không có</MenuItem>
              )}
            </Select>
          </FormControl>
          {ChucDanhGiangVien !== lecturerData.TENCHUCDANH ? (
            <>
              <FormControl fullWidth margin="normal">
                <div className="div-inputtime">
                  {" "}
                  <input
                    type="date"
                    value={TimeChucDanh}
                    onChange={(e) => setTimeChucDanh(e.target.value)}
                    className="input-time-modal"
                  />
                </div>
              </FormControl>
            </>
          ) : (
            false
          )}

          <FormControl fullWidth margin="normal">
            <TextField
              label="Số Điện Thoại"
              value={SodienthoaiGV}
              onChange={(e) => setSodienthoaiGV(e.target.value)}
              variant="outlined"
              className="height-selectGV"
            />
          </FormControl>
          <FormControl fullWidth margin="normal">
            <TextField
              label="Địa chỉ"
              value={diaChiGiangVien}
              onChange={(e) => setdiaChiGiangVien(e.target.value)}
              variant="outlined"
              className="height-selectGV"
            />
          </FormControl>
          <FormControl fullWidth margin="normal">
            <InputLabel id="phan-quyen-label">Phân Quyền</InputLabel>
            <Select
              labelId="phan-quyen-label"
              value={PhanQuyenGiangVien}
              defaultValue={lecturerData.PHANQUYEN}
              onChange={(e) => setPhanQuyenGiangVien(e.target.value)}
              variant="outlined"
              className="height-selectGV"
              label="Phân Quyền"
            >
              <MenuItem value="Admin">Admin</MenuItem>
              <MenuItem value="Trưởng Khoa">Trưởng Khoa</MenuItem>
              <MenuItem value="Trưởng Bộ Môn">Trưởng Bộ Môn</MenuItem>
              <MenuItem value="Giảng Viên">Giảng Viên</MenuItem>{" "}
              <MenuItem value="Giảng Viên Ngoài Trường">
                Giảng Viên Ngoài Trường
              </MenuItem>
            </Select>
          </FormControl>
          <Button variant="contained" type="submit" className="mt-2">
            Cập Nhật Thông Tin
          </Button>
        </form>
      </Box>
    </Modal>
  );
};

export default UpdateGiangVienModal;
