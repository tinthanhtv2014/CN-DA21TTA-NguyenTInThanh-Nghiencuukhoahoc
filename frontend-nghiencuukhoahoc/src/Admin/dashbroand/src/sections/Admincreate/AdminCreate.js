import React, { useState, useEffect } from "react";
import { Card, Button, Container, Row, Col } from "react-bootstrap";
import Khoa from "../../../../../public/img-admin/Khoa.png";
import BoMon from "../../../../../public/img-admin/BoMon.png";
import CTDT from "../../../../../public/img-admin/CTDT.png";
import ChucVu from "../../../../../public/img-admin/ChucVu.png";
import GiangVien from "../../../../../public/img-admin/GiangVien.png";
import "./AdminCreate.scss";
import { jwtDecode } from "jwt-decode";
import Cookies from "js-cookie";
import { useNavigate } from "react-router-dom";
import { Line } from "react-chartjs-2";
import "chart.js/auto"; // Để tránh lỗi khi dùng Chart.js 3+
import Plot from "react-plotly.js";
import axios from "axios";
import { BiListUl, BiCodeAlt, BiBarChart } from "react-icons/bi";
const AdminCreate = () => {
  const navigate = useNavigate();
  const token = Cookies.get("accessToken");
  const [TenDangNhap, setTenDangNhap] = useState(null);
  const [chartData, setChartData] = useState(null);
  const [chartData2, setChartData2] = useState(null);
  const [chartData3, setChartData3] = useState(null);
  const [nhieunhat, setNhieunhat] = useState([]);
  const [soluong, setSoluong] = useState([]);
  const [soluong2, setSoluong2] = useState([]);
  const [tengiangvien, setTengiangvien] = useState([]);
  const fetchBomonNhieuNhat = async () => {
    const response = await axios.get(
      `http://localhost:8081/api/v1/truongkhoa/bomondangkynhieunhat`
    );

    if (response.data.EC === 200) {
      setNhieunhat(response.data.DT[0].TENBOMON);
      setSoluong(response.data.DT[0].SoLuongDeTai);
    }
  };

  const fetchSoluongNhieuNhat = async () => {
    const response = await axios.get(
      `http://localhost:8081/api/v1/truongkhoa/laytongsoluong`
    );
    console.log("checkaosdhaldhlahlkdhalkhdlkasd", response);
    if (response.data.EC === 200) {
      setSoluong2(response.data.DT[0].TongSoLuongDeTai);
    }
  };

  const fetchGiangviennhieunhat = async () => {
    const response = await axios.get(
      `http://localhost:8081/api/v1/truongkhoa/laygiangviendangkynhieunhat`
    );
    console.log("checkaosdhaldhlahlkdhalkhdlkasd", response);
    if (response.data.EC === 200) {
      setTengiangvien(response.data.DT[0].TenGiangVien);
    }
  };

  const cards = [
    {
      icon: "bi bi-bar-chart",
      title: "Bộ môn có số lượng nhiều nhất",
      amount: nhieunhat + ` - ` + soluong + ` Đề tài `,
    },
    {
      icon: "bi bi-list-ul",
      title: "Tổng số lượng đề tài của khoa",
      amount: soluong2,
    },
    {
      icon: "bi bi-code-alt",
      title: "Giảng viên đăng ký nhiều nhất",
      amount: tengiangvien,
    },
  ];
  useEffect(() => {
    if (token) {
      const decodedToken = jwtDecode(token);
      const name = decodedToken.phanquyen; // Hoặc thuộc tính nào đó trong token
      setTenDangNhap(name);

      console.log("check", name);
    }
  }, [token]);
  // const handleToCreateKhoa = () => {
  //   navigate("/admin/quan-ly-khoa");
  // };
  // const handleToCreateBM = () => {
  //   navigate("/admin/quan-ly-bm");
  // };
  // const handleToCreateGV = () => {
  //   navigate("/admin/giangvien");
  // };

  // const handleQuanLy = () => {
  //   navigate("/admin/quan-ly");
  // };
  // const handleToCreateCTDT = () => {
  //   navigate("/admin/chuong-trinh-dao-tao");
  // };
  const data = {
    labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
    datasets: [
      {
        label: "Lớp A",
        data: [65, 59, 80, 81, 56, 55],
        borderColor: "rgba(75,192,192,1)",
        fill: false,
      },
      {
        label: "Lớp B",
        data: [28, 48, 40, 19, 86, 27],
        borderColor: "rgba(255,99,132,1)",
        fill: false,
      },
    ],
  };
  useEffect(() => {
    // Gọi API từ server Python để lấy dữ liệu biểu đồ
    fetch("http://localhost:5000/api/plotly")
      .then((response) => response.json())
      .then((data) => {
        if (data.EM === "Success") {
          // Giả sử data.DT là đối tượng JSON với dữ liệu biểu đồ
          try {
            console.log(data.DT); // Kiểm tra dữ liệu nhận được
            setChartData(data.DT);
          } catch (e) {
            console.error("Error parsing chart data:", e);
          }
        } else {
          console.error("Error fetching chart:", data.EM);
        }
      })
      .catch((error) => console.error("Error fetching chart data:", error));
    fetchBomonNhieuNhat();
    fetchSoluongNhieuNhat();
    fetchGiangviennhieunhat();
  }, []);

  useEffect(() => {
    // Gọi API từ server Python để lấy dữ liệu biểu đồ
    fetch("http://localhost:5000/api/chart")
      .then((response) => response.json())
      .then((data) => {
        if (data.EM === "Success") {
          // Giả sử data.DT là đối tượng JSON với dữ liệu biểu đồ
          try {
            console.log(data.DT); // Kiểm tra dữ liệu nhận được
            setChartData2(data.DT);
          } catch (e) {
            console.error("Error parsing chart data:", e);
          }
        } else {
          console.error("Error fetching chart:", data.EM);
        }
      })
      .catch((error) => console.error("Error fetching chart data:", error));
  }, []);
  useEffect(() => {
    // Gọi API từ server Python để lấy dữ liệu biểu đồ
    fetch("http://localhost:5000/api/piechart")
      .then((response) => response.json())
      .then((data) => {
        if (data.EM === "Success") {
          // Giả sử data.DT là đối tượng JSON với dữ liệu biểu đồ
          try {
            console.log(data.DT); // Kiểm tra dữ liệu nhận được
            setChartData3(data.DT);
          } catch (e) {
            console.error("Error parsing chart data:", e);
          }
        } else {
          console.error("Error fetching chart:", data.EM);
        }
      })
      .catch((error) => console.error("Error fetching chart data:", error));
  }, []);
  const cardStyle = {
    backgroundColor: "#f8f9fa", // Đồng bộ màu nền với biểu đồ
    color: "black", // Điều chỉnh màu chữ để tương phản
    padding: "1rem",
    display: "flex",
    alignItems: "center",
    height: "100%",
    borderRadius: "8px", // Tạo góc bo tròn
    boxShadow: "0 4px 8px rgba(0, 0, 0, 0.1)", // Thêm viền nổi
    border: "1px solid #dee2e6", // Đường viền sáng để nổi bật
  };

  const iconStyle = {
    fontSize: "2rem", // Cái này vẫn giữ nguyên
    color: "#000000", // Màu đen
    marginRight: "1rem",
    width: "2rem", // Cung cấp chiều rộng
    height: "2rem", // Cung cấp chiều cao
  };

  return (
    // <>
    //   <Container className="mt-4">
    //     {" "}
    //     <Row>
    //       {" "}
    //       <h3 className="welcome-adminCreate">
    //         Chúc {TenDangNhap} ngày mới tốt lành!
    //       </h3>{" "}
    //       <Col md={4} className="mb-4">
    //         <Card className="adminCreate-card" onClick={handleToCreateKhoa}>
    //           <div className="adminCreate-center">
    //             {" "}
    //             <Card.Img
    //               variant="top"
    //               src={Khoa}
    //               className="adminCreate-img"
    //             />
    //           </div>

    //           <Card.Body>
    //             <Card.Title>Khoa Kỹ thuật và Công nghệ</Card.Title>
    //             <Card.Text>
    //               Bạn có thể tạo thêm một khoa mới vào hệ thống.
    //             </Card.Text>
    //             {/* <Button className="adminCreate-button">Tạo Khoa</Button> */}
    //           </Card.Body>
    //         </Card>
    //       </Col>
    //       <Col md={4} className="mb-4">
    //         <Card className="adminCreate-card" onClick={handleToCreateBM}>
    //           <div className="adminCreate-center adminCreate-center-BM">
    //             {" "}
    //             <Card.Img
    //               variant="top"
    //               src={BoMon}
    //               className="adminCreate-img"
    //             />
    //           </div>

    //           <Card.Body>
    //             <Card.Title>Các ộ môn Kỹ thuật và Công nghệ</Card.Title>
    //             <Card.Text>
    //               Bạn có thể tạo thêm một bộ môn mới vào hệ thống.
    //             </Card.Text>
    //             {/* <Button className="adminCreate-button">Tạo Bộ Môn</Button> */}
    //           </Card.Body>
    //         </Card>
    //       </Col>
    //       <Col md={4} className="mb-4">
    //         <Card className="adminCreate-card" onClick={handleToCreateGV}>
    //           <div className="adminCreate-center adminCreate-center-GV">
    //             {" "}
    //             <Card.Img
    //               variant="top"
    //               src={GiangVien}
    //               className="adminCreate-img"
    //             />
    //           </div>

    //           <Card.Body>
    //             <Card.Title>Giảng viên khoa Kỹ thuật và Công nghệ</Card.Title>
    //             <Card.Text>
    //               Bạn có thể tạo thêm giảng viên mới vào hệ thống.
    //             </Card.Text>
    //             {/* <Button className="adminCreate-button">Thêm Giảng Viên</Button> */}
    //           </Card.Body>
    //         </Card>
    //       </Col>
    //       <Col md={4} className="mb-4">
    //         <Card className="adminCreate-card" onClick={handleQuanLy}>
    //           <div className="adminCreate-center adminCreate-center-CV">
    //             {" "}
    //             <Card.Img
    //               variant="top"
    //               src={ChucVu}
    //               className="adminCreate-img"
    //             />
    //           </div>

    //           <Card.Body>
    //             <Card.Title>Quản Lý Các Chức Năng Nhỏ</Card.Title>
    //             <Card.Text>
    //               Bạn có thể tạo thêm một số mục mới vào hệ thống.
    //             </Card.Text>
    //             {/* <Button className="adminCreate-button">Tạo Chức Vụ</Button> */}
    //           </Card.Body>
    //         </Card>
    //       </Col>
    //       <Col md={4} className="mb-4">
    //         <Card className="adminCreate-card " onClick={handleToCreateCTDT}>
    //           <div className="adminCreate-center adminCreate-center-CTDT">
    //             {" "}
    //             <Card.Img
    //               variant="top"
    //               src={CTDT}
    //               className="adminCreate-img"
    //             />
    //           </div>

    //           <Card.Body>
    //             <Card.Title>Chương Trình Đào Tạo Cho Bộ Môn</Card.Title>
    //             <Card.Text>
    //               Bạn có thể thêm chương trình đào tạo mới của bộ vào hệ thống.
    //             </Card.Text>
    //             {/* <Button className="adminCreate-button">
    //               Thêm Chương Trình Đào Tạo
    //             </Button> */}
    //           </Card.Body>
    //         </Card>
    //       </Col>
    //     </Row>
    //   </Container>
    // </>
    <>
      <div
        className="row g-4"
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          justifyContent: "center",
        }}
      >
        {/* Cards Row */}
        <div
          className="row"
          style={{
            display: "flex",
            justifyContent: "center",
            width: "100%",
            marginBottom: "20px",
          }}
        >
          {cards.map((card, index) => (
            <div
              className="col-md-3"
              key={index}
              style={{
                margin: "0 10px", // Thêm khoảng cách ngang giữa các card
                display: "flex",
                justifyContent: "center",
              }}
            >
              <div
                className="card"
                style={{
                  ...cardStyle,
                  padding: "1rem",
                  width: "400px", // Đặt width cố định nếu cần
                }}
              >
                <div className="d-flex align-items-center justify-content-between">
                  <i className={`card-icon ${card.icon}`} style={iconStyle}></i>
                  <div className="ms-3">
                    <h5 className="mb-0">{card.title}</h5>
                    <p className="mb-0">{card.amount}</p>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* Charts Row */}
        <div
          className="row"
          style={{
            display: "flex",
            justifyContent: "center",
            width: "100%",
          }}
        >
          <div className="col-5" style={{ marginBottom: "20px" }}>
            <div
              style={{
                width: "100%",
                height: "500px",
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
                backgroundColor: "#f8f9fa",
                borderRadius: "8px",
                padding: "10px",
                boxShadow: "0 4px 8px rgba(0, 0, 0, 0.1)",
              }}
            >
              {chartData ? (
                <Plot
                  data={chartData.data} // Dữ liệu đồ thị, truyền từ API
                  layout={chartData.layout} // Bố cục của đồ thị, truyền từ API
                  style={{ width: "100%", height: "100%" }}
                />
              ) : (
                <p>Loading chart...</p>
              )}
            </div>
          </div>
          <div className="col-5" style={{ marginBottom: "20px" }}>
            <div
              style={{
                width: "100%",
                height: "500px",
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
                backgroundColor: "#f8f9fa",
                borderRadius: "8px",
                padding: "10px",
                boxShadow: "0 4px 8px rgba(0, 0, 0, 0.1)",
              }}
            >
              {chartData2 ? (
                <Plot
                  data={chartData2.data} // Dữ liệu đồ thị, truyền từ API
                  layout={chartData2.layout} // Bố cục của đồ thị, truyền từ API
                  style={{ width: "100%", height: "100%" }}
                />
              ) : (
                <p>Loading chart...</p>
              )}
            </div>
          </div>
          <div className="col-5" style={{ marginBottom: "20px" }}>
            <div
              style={{
                width: "100%",
                height: "500px",
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
                backgroundColor: "#f8f9fa",
                borderRadius: "8px",
                padding: "10px",
                boxShadow: "0 4px 8px rgba(0, 0, 0, 0.1)",
              }}
            >
              {chartData3 ? (
                <Plot
                  data={chartData3.data} // Dữ liệu đồ thị, truyền từ API
                  layout={chartData3.layout} // Bố cục của đồ thị, truyền từ API
                  style={{ width: "100%", height: "100%" }}
                />
              ) : (
                <p>Loading chart...</p>
              )}
            </div>
          </div>
        </div>
      </div>

      {/* <div style={{ width: "80%", margin: "auto" }}>
        <h3>Biểu đồ đường theo lớp</h3>
        <Line data={data} />
      </div> */}
    </>
  );
};

export default AdminCreate;
