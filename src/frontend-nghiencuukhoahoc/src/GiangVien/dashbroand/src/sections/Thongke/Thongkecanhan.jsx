import React from "react";
import { Bar, Pie } from "react-chartjs-2"; // Sử dụng react-chartjs-2
import "chart.js/auto";
import axios from "axios";
import { jwtDecode } from "jwt-decode";
import Cookies from "js-cookie";
import { useEffect, useState } from "react";
import {
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TablePagination,
  TableRow,
} from "@mui/material";
const PersonalStats = () => {
  // Dữ liệu mẫu
  const token = Cookies.get("accessToken");
  const [tendangnhap, setTenDangNhap] = useState(null);
  const [barchartData, setBarchartData] = useState(null);
  const [piechartData, setPiechartData] = useState(null);
  const [namhoc, setNamhoc] = useState(""); // Trạng thái bộ môn
  const [namhocList, setNamhocList] = useState([]); // Danh sách bộ môn
  const [tabledata, setTableData] = useState([]); // Danh sách bộ môn

  useEffect(() => {
    if (token) {
      const decodedToken = jwtDecode(token);
      const name = decodedToken.taikhoan; // Hoặc thuộc tính nào đó trong token
      setTenDangNhap(name);
      //setTenDangNhap2(decodedToken.taikhoan);
      console.log("check", name);
    }
  }, [token]);

  const fetchDataBarchart = async () => {
    const response = await axios.post(
      `http://localhost:8081/api/v1/quyengiangvien/giangvien/laysoluongdetaicanhantheonam`,
      {
        TENDANGNHAP: tendangnhap,
      }
    );
    console.log("check data", response);

    if (response.data.EC === 200) {
      // Lấy TENNAMHOC và SoLuongDeTai từ phản hồi
      const data = response.data.DT.map((item) => item.TongSoLuongDeTai);
      const labels = response.data.DT.map((item) => item.NamHoc);

      // Kiểm tra xem nếu không có dữ liệu, ta sẽ gán mảng rỗng
      if (!data.length) {
        setBarchartData({
          labels: ["Năm học chưa có dữ liệu"], // Mặc định nếu không có dữ liệu
          datasets: [
            {
              label: "Số lượng nghiên cứu hoàn thành",
              data: [0],
              backgroundColor: "rgba(54, 162, 235, 0.6)",
            },
          ],
        });
      } else {
        setBarchartData({
          labels: labels, // Sử dụng TENNAMHOC làm nhãn
          datasets: [
            {
              label: "Số lượng nghiên cứu hoàn thành",
              data: data, // Sử dụng SoLuongDeTai làm dữ liệu
              backgroundColor: "rgba(54, 162, 235, 0.6)",
            },
          ],
        });
      }
    }
  };

  const fetchnamhoc = async () => {
    try {
      const response = await axios.get(
        `http://localhost:8081/api/v1/admin/namhoc/xem`
      );

      if (response.data.EC === 1) {
        setNamhocList(response.data.DT);
        setNamhoc(response.data.DT[0]?.TENNAMHOC); // Set bộ môn mặc định (nếu có)
      }
    } catch (error) {
      console.error("Lỗi khi lấy bộ môn", error);
    }
  };

  const fetchtableData = async () => {
    try {
      const response = await axios.post(
        `http://localhost:8081/api/v1/quyengiangvien/giangvien/laydetaicanhantheonam`,
        {
          TENDANGNHAP: tendangnhap,
          TENNAMHOC: namhoc,
        }
      );
      console.log(
        "check nè ádahaldhjashdlahdklahjdklakldakdhakdakshd",
        response.data
      );
      if (response.data.EC === 200) {
        setTableData(response.data.DT);
      }
    } catch (error) {
      console.error("Lỗi khi lấy bộ môn", error);
    }
  };

  useEffect(() => {
    if (tendangnhap && namhoc) {
      fetchtableData();
    }
  }, [tendangnhap, namhoc]);

  const generateRandomColor = () => {
    const letters = "0123456789ABCDEF";
    let color = "#";
    for (let i = 0; i < 6; i++) {
      color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
  };

  const fetchDataPiechart = async () => {
    const response = await axios.post(
      `http://localhost:8081/api/v1/quyengiangvien/giangvien/laysoluongdetaicanhantheophanloainghiencuu`,
      {
        TENDANGNHAP: tendangnhap,
      }
    );
    console.log("check data", response);

    if (response.data.EC === 200) {
      // Lấy TENNAMHOC và SoLuongDeTai từ phản hồi
      const data = response.data.DT.map((item) => item.TongSoLuongDeTai);
      const labels = response.data.DT.map((item) => {
        switch (item.DonViTinh) {
          case "Bài":
            return "Bài báo";
          case "Bằng":
            return "Bằng khen";
          case "Theo tờ trình được duyệt":
            return "Theo tờ trình";
          default:
            return item.DonViTinh;
        }
      });

      // Kiểm tra xem nếu không có dữ liệu, ta sẽ gán mảng rỗng
      if (!data.length) {
        setPiechartData({
          labels: ["đơn vị tính chưa có dữ liệu"], // Mặc định nếu không có dữ liệu
          datasets: [
            {
              label: "Số lượng nghiên cứu hoàn thành",
              data: [0],
              backgroundColor: "rgba(54, 162, 235, 0.6)",
            },
          ],
        });
      } else {
        setPiechartData({
          labels: labels, // Sử dụng TENNAMHOC làm nhãn
          datasets: [
            {
              label: "Số lượng nghiên cứu hoàn thành",
              data: data,
              backgroundColor: data.map(() => generateRandomColor()),
            },
          ],
        });
      }
    }
  };

  useEffect(() => {
    if (tendangnhap) {
      fetchDataBarchart();
      fetchDataPiechart();
      fetchnamhoc();
    }
  }, [tendangnhap]);

  const pieChartData = {
    labels: ["Bài báo", "Đề tài nghiên cứu", "Sách xuất bản"],
    datasets: [
      {
        data: [30, 50, 20],
        backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56"],
      },
    ],
  };

  return (
    <div className="">
      <h1 className="text-center mb-4">Thống Kê Cá Nhân</h1>

      {/* Tổng quan */}
      {/* <div
        className="d-flex justify-content-center mb-4"
        style={{ gap: "50px" }}
      >
        <div
          className="text-center p-4 border rounded-2 shadow-sm w-40"
          style={{ borderColor: "#ddd" }}
        >
          <h2>10</h2>
          <p className="fs-5 text-muted">Nghiên cứu đã hoàn thành</p>
        </div>
        <div
          className="text-center p-4 border rounded-2 shadow-sm w-40"
          style={{ borderColor: "#ddd" }}
        >
          <h2>5</h2>
          <p className="fs-5 text-muted">Nghiên cứu đang thực hiện</p>
        </div>
        <div
          className="text-center p-4 border rounded-2 shadow-sm w-40"
          style={{ borderColor: "#ddd" }}
        >
          <h2>3</h2>
          <p className="fs-5 text-muted">Dự án được tài trợ</p>
        </div>
      </div> */}

      {/* Biểu đồ */}
      <div className="row justify-content-around">
        <div className="col-5 mb-4" style={{ marginBottom: "20px" }}>
          <h3 className="text-center">Tiến Độ Theo Năm</h3>{" "}
          {/* Thêm tiêu đề cho biểu đồ Bar */}
          <div
            style={{
              width: "100%",
              height: "563px",
              display: "flex",
              justifyContent: "center",
              alignItems: "center",
              backgroundColor: "#f8f9fa",
              borderRadius: "8px",
              padding: "10px",
              boxShadow: "0 4px 8px rgba(0, 0, 0, 0.1)",
            }}
          >
            {barchartData ? (
              <Bar data={barchartData} options={{ responsive: true }} />
            ) : (
              <p>Đang tải dữ liệu...</p>
            )}
          </div>
        </div>

        <div className="col-5 mb-4" style={{ marginBottom: "20px" }}>
          <h3 className="text-center">Phân Loại Nghiên Cứu</h3>{" "}
          {/* Thêm tiêu đề cho biểu đồ Pie */}
          <div
            style={{
              width: "100%",
              height: "563px",
              display: "flex",
              justifyContent: "center",
              alignItems: "center",
              backgroundColor: "#f8f9fa",
              borderRadius: "8px",
              padding: "10px",
              boxShadow: "0 4px 8px rgba(0, 0, 0, 0.1)",
            }}
          >
            {piechartData ? (
              <Pie data={piechartData} options={{ responsive: true }} />
            ) : (
              <p>Đang tải dữ liệu...</p>
            )}
          </div>
        </div>
        <div
          className="col-8"
          style={{ marginBottom: "20px", marginTop: "40px" }}
        >
          <div
            style={{
              marginBottom: "60px",
              display: "flex",
              justifyContent: "center",
              alignItems: "center",
            }}
          >
            {/* Label và Dropdown chọn năm học */}
            <label
              htmlFor="namhoc-select"
              style={{
                marginRight: "10px", // Khoảng cách giữa label và select
                fontSize: "16px",
                fontWeight: "bold",
              }}
            >
              Chọn Năm học:
            </label>
            <select
              id="namhoc-select"
              value={namhoc}
              onChange={(e) => setNamhoc(e.target.value)} // Cập nhật năm học khi thay đổi
              style={{
                padding: "10px",
                fontSize: "16px",
                borderRadius: "4px",
                border: "1px solid #ccc",
              }}
            >
              {namhocList &&
                namhocList.length > 0 &&
                namhocList.map((item) => (
                  <option key={item.MANAMHOC} value={item.TENNAMHOC}>
                    {item.TENNAMHOC}
                  </option>
                ))}
            </select>
          </div>

          <div
            style={{
              width: "100%",
              padding: "16px",
              backgroundColor: "#fff",
              borderRadius: "8px",
              boxShadow: "0 4px 6px rgba(0, 0, 0, 0.1)",
            }}
          >
            <TableContainer
              style={{
                maxWidth: "100%", // Đảm bảo bảng không vượt quá chiều rộng
                overflowX: "auto", // Kích hoạt thanh cuộn ngang khi bảng dài hơn
                height: "531px", // Giữ chiều cao cố định
                overflowY: "auto", // Kích hoạt thanh cuộn dọc khi bảng dài hơn
              }}
            >
              <Table sx={{ minWidth: 950 }} aria-labelledby="tableTitle">
                <TableHead>
                  <TableRow>
                    <TableCell>Đề Tài</TableCell>
                    <TableCell>Giờ chuẩn của danh mục</TableCell>
                    <TableCell>Năm Học</TableCell>
                    <TableCell>Giảng Viên</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {tabledata.length === 0
                    ? // Nếu không có dữ liệu, hiển thị các hàng trống để giữ nguyên chiều cao bảng
                      Array.from({ length: 5 }).map((_, index) => (
                        <TableRow key={index}>
                          <TableCell
                            colSpan={3}
                            style={{ textAlign: "center" }}
                          >
                            Không có dữ liệu
                          </TableCell>
                        </TableRow>
                      ))
                    : // Hiển thị dữ liệu trong bảng
                      tabledata.map((row, index) => (
                        <TableRow hover key={index}>
                          <TableCell>{row.TEN_DE_TAI}</TableCell>
                          <TableCell>{row.GIO_CHUAN}</TableCell>
                          <TableCell>{row.TENNAMHOC}</TableCell>
                          <TableCell>{row.GiangVienGop}</TableCell>
                        </TableRow>
                      ))}
                </TableBody>
              </Table>
            </TableContainer>
          </div>
        </div>
      </div>
    </div>
  );
};

export default PersonalStats;
