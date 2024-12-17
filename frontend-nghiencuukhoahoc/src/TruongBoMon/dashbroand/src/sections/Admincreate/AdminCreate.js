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
import { Line, Bar, Radar } from "react-chartjs-2";
import "chart.js/auto"; // Để tránh lỗi khi dùng Chart.js 3+
import Plot from "react-plotly.js";
import axios from "axios";
import logo1 from "../../img/clipboard.png";
import logo2 from "../../img/profile.png";
import logo3 from "../../img/statistics.png";

import {
  Chart as ChartJS,
  BarElement,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from "chart.js";
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
  const [danhsach, setDanhsach] = useState([]);
  const [tongLuyKe, setTongLuyKe] = useState([]);
  const [TenDangNhap2, setTenDangNhap2] = useState(null);
  const [xuhuong, setxuhuong] = useState(null);
  const [bomon, setBomon] = useState(""); // Trạng thái bộ môn
  const [bomonList, setBomonList] = useState([]); // Danh sách bộ môn
  const [tacgiachartData, setTacgiaChartData] = useState(null);
  const [timechartData, setTimeChartData] = useState(null);
  useEffect(() => {
    if (token) {
      const decodedToken = jwtDecode(token);
      const name = decodedToken.phanquyen; // Hoặc thuộc tính nào đó trong token
      setTenDangNhap(name);
      //setTenDangNhap2(decodedToken.taikhoan);
      console.log("check", name);
    }
  }, [token]);

  const fetchxuhuongcuacanhan = async () => {
    const response = await axios.get(
      `http://localhost:8081/api/v1/truongkhoa/laydanhsachchudegiangviendangkynhieunhat`
    );

    if (response.data.EC === 200) {
      setxuhuong(response.data.DT);
    }
  };

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

    if (response.data.EC === 200) {
      setSoluong2(response.data.DT[0].TongSoLuongDeTai);
    }
  };

  const fetchGiangviennhieunhat = async () => {
    const response = await axios.get(
      `http://localhost:8081/api/v1/truongkhoa/laygiangviendangkynhieunhat`
    );

    if (response.data.EC === 200) {
      setTengiangvien(response.data.DT[0].TenGiangVien);
    }
  };

  const fetchbomon = async () => {
    try {
      const response = await axios.get(
        `http://localhost:8081/api/v1/admin/bomon/xem`
      );
      console.log(
        "check nè ádahaldhjashdlahdklahjdklakldakdhakdakshd",
        response.data
      );
      if (response.data.EC === 1) {
        setBomonList(response.data.DT);
        setBomon(response.data.DT[0]?.TENBOMON); // Set bộ môn mặc định (nếu có)
      }
    } catch (error) {
      console.error("Lỗi khi lấy bộ môn", error);
    }
  };

  const fetchGiangvientrongbomon = async (selectedBomon) => {
    try {
      const response = await axios.get(
        `http://localhost:8081/api/v1/truongkhoa/laydanhsachgiangviendangkytheobomon/${selectedBomon}`
      );
      if (response.data.EC === 200) {
        console.log("Danh sách giảng viên:", response.data.DT);
        setDanhsach(response.data.DT);
      }
    } catch (error) {
      console.error("Lỗi khi fetch dữ liệu giảng viên:", error);
    }
  };
  useEffect(() => {
    if (bomon) {
      fetchGiangvientrongbomon(bomon);
    }
  }, [bomon]);
  const calculateTongLuyKe = (soLuongDeTai) => {
    const luyKe = [];
    soLuongDeTai.reduce((acc, curr) => {
      luyKe.push(acc + curr);
      return acc + curr;
    }, 0);
    return luyKe;
  };

  useEffect(() => {
    fetchGiangvientrongbomon();
    fetchxuhuongcuacanhan();
    fetchbomon();
  }, []);

  useEffect(() => {
    if (danhsach.length > 0) {
      const soLuongDeTai = danhsach.map((item) => item.SoLuongDeTai); // Trích số lượng đề tài
      const luyKe = calculateTongLuyKe(soLuongDeTai);
      setTongLuyKe(luyKe);
    }
  }, [danhsach]);

  const cards = [
    {
      icon: logo1,
      title: "Bộ môn có số lượng nhiều nhất",
      amount: nhieunhat + ` - ` + soluong + ` Đề tài `,
    },
    {
      icon: logo3,
      title: "Tổng số lượng đề tài của khoa",
      amount: soluong2 + ` Đề tài`,
    },
    {
      icon: logo2,
      title: "Giảng viên đăng ký nhiều nhất",
      amount: `Giảng viên: ` + tengiangvien,
    },
  ];

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
    labels:
      danhsach && danhsach.length > 0
        ? danhsach.map((item) => item.TenGiangVien)
        : [], // Trích tên giảng viên
    datasets: [
      {
        type: "bar",
        label: "Số lượng đề tài",
        data:
          danhsach && danhsach.length > 0
            ? danhsach.map((item) => item.SoLuongDeTai)
            : [], // Trích số lượng đề tài
        backgroundColor: "rgba(54, 162, 235, 0.6)",
        borderColor: "rgba(54, 162, 235, 1)",
        borderWidth: 1,
      },
      {
        type: "line",
        label: "Tổng số đề tài lũy kế",
        data: tongLuyKe, // Lũy kế
        borderColor: "rgba(255, 99, 132, 1)",
        borderWidth: 2,
        fill: false,
        tension: 0.4, // Đường cong
      },
    ],
  };

  // Tùy chỉnh hiển thị
  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: "top",
      },
      title: {
        display: true,
        text: "Thống kê số lượng đề tài của từng giảng viên",
      },
    },
    scales: {
      y: {
        beginAtZero: true,
        title: {
          display: true,
          text: "Số lượng đề tài",
        },
      },
      x: {
        title: {
          display: true,
          text: "Giảng viên",
        },
      },
    },
  };

  const options3 = {
    responsive: true,
    plugins: {
      legend: {
        position: "top",
      },
      title: {
        display: true,
        text: "Thống kê số lượng đề tài của từng giảng viên theo tác giả",
      },
    },
    scales: {
      y: {
        beginAtZero: true,
        title: {
          display: true,
          text: "Số lượng đề tài",
        },
      },
      x: {
        title: {
          display: true,
          text: "Tác giả",
        },
      },
    },
  };

  const options2 = {
    responsive: true,
    plugins: {
      legend: {
        position: "top",
      },
      title: {
        display: true,
        text: "Thống kê số lượng đề tài theo đơn vị chủ đề",
      },
    },
    scales: {
      r: {
        beginAtZero: true, // Bắt đầu từ 0
        angleLines: {
          display: false, // Ẩn các đường góc
        },
        suggestedMin: 0, // Đảm bảo bắt đầu từ 0
        suggestedMax:
          xuhuong && xuhuong.length > 0
            ? Math.max(...xuhuong.map((item) => item.SoLuongDeTai)) + 5
            : 5, // Tính giá trị max cho trục khi có dữ liệu
        ticks: {
          display: false, // Ẩn các giá trị trên trục
        },
      },
    },
  };

  const data2 = {
    labels:
      xuhuong && xuhuong.length > 0
        ? xuhuong.map((item) => item.DonViTinh)
        : [], // Đơn vị tính (tạo nhãn cho các trục của radar chart)
    datasets: [
      {
        label: "Số lượng đề tài",
        data:
          xuhuong && xuhuong.length > 0
            ? xuhuong.map((item) => item.SoLuongDeTai)
            : [], // Số lượng đề tài
        backgroundColor: "rgba(54, 162, 235, 0.6)", // Màu nền của radar chart
        borderColor: "rgba(54, 162, 235, 1)", // Màu viền của radar chart
        borderWidth: 1,
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
    width: "2.8rem", // Cung cấp chiều rộng
    height: "2.8rem", // Cung cấp chiều cao
  };

  useEffect(() => {
    // Fetch data from the API using axios
    const fetchData = async () => {
      try {
        const response = await axios.get(
          "http://localhost:8081/api/v1/truongkhoa/laydanhsachloaitacgia"
        ); // Replace with your actual API URL
        const data = response.data;
        if (data.EC === 200) {
          const chartData = data.DT;

          // Format the data for the Bar chart
          const labels = chartData.map((item) => item.TEN_LOAI_TAC_GIA);
          const counts = chartData.map((item) => item.so_luong_nghien_cuu);

          setTacgiaChartData({
            labels: labels,
            datasets: [
              {
                label: "Số lượng nghiên cứu",
                data: counts,
                backgroundColor: "rgba(75, 192, 192, 0.2)",
                borderColor: "rgba(75, 192, 192, 1)",
                borderWidth: 1,
              },
            ],
          });
        }
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, []);

  useEffect(() => {
    // Fetch data from the API using axios
    const fetchData = async () => {
      try {
        const response = await axios.get(
          "http://localhost:8081/api/v1/truongkhoa/laydanhsachtheothoigian"
        ); // Replace with your actual API URL
        const data = response.data;
        if (data.EC === 200) {
          const chartData = data.DT;

          // Format the data for the Bar chart (histogram)
          const labels = chartData.map((item) => item.GIO_QUY_DOI_KHOANG); // These are the ranges, like '0-100 giờ'
          const counts = chartData.map((item) => item.so_luong_nghien_cuu); // The counts in each range

          setTimeChartData({
            labels: labels,
            datasets: [
              {
                label: "Số lượng nghiên cứu theo giờ quy đổi",
                data: counts,
                backgroundColor: "rgba(75, 192, 192, 0.5)", // Color for the bars
                borderColor: "rgba(75, 192, 192, 1)", // Border color for the bars
                borderWidth: 1,
              },
            ],
          });
        }
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, []);

  const TimechartOptions = {
    responsive: true,
    scales: {
      x: {
        beginAtZero: true, // Ensure the x-axis starts at zero
      },
      y: {
        beginAtZero: true, // Ensure the y-axis starts at zero
      },
    },
    plugins: {
      title: {
        display: true, // Hiển thị title
        text: "Số lượng nghiên cứu theo giờ quy đổi", // Tiêu đề của biểu đồ
      },
    },
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
            marginBottom: "30px",
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
                  display: "flex",
                  flexDirection: "column",
                  alignItems: "center", // Căn giữa theo chiều ngang
                  justifyContent: "center", // Căn giữa theo chiều dọc
                }}
              >
                <div className="d-flex align-items-center justify-content-between">
                  <img src={card.icon} alt="" style={iconStyle} />
                </div>

                <div
                  className="ms-3"
                  style={{
                    padding: "15px", // Khoảng cách bên trong để tạo không gian
                    textAlign: "center", // Căn giữa nội dung bên trong
                  }}
                >
                  <h5
                    className="mb-0"
                    style={{
                      fontWeight: "bold", // Làm cho tiêu đề đậm
                      color: "#007bff", // Màu chữ cho tiêu đề (màu xanh dương)
                    }}
                  >
                    {card.title}
                  </h5>
                  <p
                    className="mb-0"
                    style={{
                      fontSize: "16px", // Cỡ chữ cho phần thông tin
                      color: "#333", // Màu chữ cho phần nội dung
                    }}
                  >
                    {card.amount}
                  </p>
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
          {/* <div className="col-5" style={{ marginBottom: "20px" }}>
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
          </div> */}
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
              <Radar data={data2} options={options2} />
            </div>
          </div>
          <div className="col-5" style={{ marginBottom: "20px" }}>
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
          <div className="col-5" style={{ marginBottom: "20px" }}>
            <div
              style={{
                marginBottom: "20px",
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
              }}
            >
              {/* Dropdown chọn bộ môn */}
              <select
                value={bomon}
                onChange={(e) => setBomon(e.target.value)} // Cập nhật bộ môn khi thay đổi
                style={{
                  padding: "10px",
                  fontSize: "16px",
                  marginRight: "20px",
                  borderRadius: "4px",
                  border: "1px solid #ccc",
                }}
              >
                {bomonList &&
                  bomonList.length > 0 &&
                  bomonList.map((item) => (
                    <option key={item.MABOMON} value={item.TENBOMON}>
                      {item.TENBOMON}
                    </option>
                  ))}
              </select>
            </div>

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
              {/* Biểu đồ */}
              <Bar data={data} options={options} />
            </div>
          </div>
          <div className="col-5" style={{ marginBottom: "20px" }}>
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
              {tacgiachartData ? (
                <Bar data={tacgiachartData} options={options3} />
              ) : (
                <p>Đang tải dữ liệu...</p>
              )}
            </div>
          </div>
          <div className="col-5" style={{ marginBottom: "60px" }}>
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
              {timechartData ? (
                <Bar data={timechartData} options={TimechartOptions} />
              ) : (
                <p>Đang tải dữ liệu...</p>
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
