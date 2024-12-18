import React from "react";

const Footer = () => {
  return (
    <footer style={styles.footer}>
      <div style={styles.footerContainer}>
        <div style={styles.footerLeft}>
          <p>
            &copy; 2024 Nguyễn Tín Thành - 110121104 - DA21TTA. All rights
            reserved.
          </p>
        </div>
        <div style={styles.footerCenter}>
          <ul>
            <li>
              <a href="/privacy-policy" style={styles.link}>
                Privacy Policy
              </a>
            </li>
            <li>
              <a href="/terms" style={styles.link}>
                Terms of Service
              </a>
            </li>
            <li>
              <a href="/contact" style={styles.link}>
                Contact
              </a>
            </li>
          </ul>
        </div>
        <div style={styles.footerRight}>
          <ul>
            <li>
              <a
                href="https://facebook.com"
                target="_blank"
                rel="noopener noreferrer"
                style={styles.link}
              >
                Facebook
              </a>
            </li>
            <li>
              <a
                href="https://twitter.com"
                target="_blank"
                rel="noopener noreferrer"
                style={styles.link}
              >
                Twitter
              </a>
            </li>
            <li>
              <a
                href="https://instagram.com"
                target="_blank"
                rel="noopener noreferrer"
                style={styles.link}
              >
                Instagram
              </a>
            </li>
          </ul>
        </div>
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
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    maxWidth: "1200px",
    margin: "0 auto",
    padding: "0 10px",
  },
  footerLeft: {
    textAlign: "left",
  },
  footerCenter: {
    listStyle: "none",
    padding: "0",
    margin: "0",
    display: "flex",
    gap: "20px",
  },
  footerRight: {
    listStyle: "none",
    padding: "0",
    margin: "0",
    display: "flex",
    gap: "20px",
  },
  link: {
    color: "#333", // thay vì trắng, dùng màu đen đậm cho các liên kết để dễ đọc
    textDecoration: "none",
    fontSize: "14px",
  },
};
export default Footer;
