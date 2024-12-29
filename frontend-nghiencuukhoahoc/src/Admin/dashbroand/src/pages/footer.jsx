import React from "react";

const Footer = () => {
  return (
    <footer style={styles.footer}>
      <div style={styles.footerContainer}>
        <p>
          &copy; 2024 Nguyễn Tín Thành - 110121104 - DA21TTA. All rights
          reserved.
        </p>
      </div>
    </footer>
  );
};

const styles = {
  footer: {
    marginTop: "20%",
    backgroundColor: "#fff", // nền trắng
    color: "#333", // chữ màu xám đậm để dễ đọc trên nền trắng
    padding: "20px 0",
    textAlign: "center",
    boxShadow: "0 -1px 5px rgba(0, 0, 0, 0.1)", // thêm shadow nhẹ để footer nổi bật
    position: "fixed", // cố định footer
    bottom: "0", // dính dưới cùng của màn hình
    left: "0", // căn từ bên trái
    width: "100%", // chiếm toàn bộ chiều rộng
    zIndex: "100", // đảm bảo footer luôn nằm trên các phần tử khác
  },
  footerContainer: {
    maxWidth: "1200px",
    margin: "0 auto",
    padding: "0 10px",
    display: "flex",
    justifyContent: "center", // Căn giữa nội dung
    alignItems: "center", // Căn giữa theo trục dọc
  },
};

export default Footer;
