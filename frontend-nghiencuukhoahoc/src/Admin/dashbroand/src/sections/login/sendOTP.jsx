import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
const OtpComponent = () => {
  const [email, setEmail] = useState("");
  const [otp, setOtp] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [message, setMessage] = useState("");
  const [isOtpSent, setIsOtpSent] = useState(false);
  const [isOtpVerified, setIsOtpVerified] = useState(false);
  const navigate = useNavigate();
  const handleSendOtp = async () => {
    try {
      const response_timkiem = await axios.post(
        "http://localhost:8081/api/v1/admin/taikhoan/timkiemtaikhoan",
        {
          tendangnhap: email,
        }
      );

      if (response_timkiem.data.EC === 1) {
        const generateOtp = () =>
          Math.floor(100000 + Math.random() * 900000).toString(); // Sinh OTP ngẫu nhiên

        const newOtp = generateOtp();

        const response = await axios.post(
          "http://localhost:8081/api/v1/admin/taikhoan/sendotpdoimatkhau",
          {
            action: "send",
            email: email,
            otp: newOtp,
          }
        );
        setMessage(response.data.message);
        setIsOtpSent(true);
        setOtp(""); // Reset OTP input khi gửi xong
      } else {
        alert("email không tồn tại");
      }
    } catch (error) {
      setMessage(error.response?.data?.message || "Error sending OTP");
    }
  };

  const handleVerifyOtp = async () => {
    try {
      const response = await axios.post(
        "http://localhost:8081/api/v1/admin/taikhoan/sendotpdoimatkhau",
        {
          action: "verify",
          email,
          otp,
        }
      );
      setMessage(response.data.message);
      if (response.data.EC === 1) {
        setIsOtpVerified(true); // OTP hợp lệ, cho phép nhập mật khẩu mới
      }
    } catch (error) {
      setMessage(error.response?.data?.message || "Error verifying OTP");
    }
  };

  const handleResetPassword = async () => {
    if (newPassword !== confirmPassword) {
      setMessage("Mật khẩu không khớp");
      return;
    }

    try {
      const response = await axios.put(
        `http://localhost:8081/api/v1/admin/taikhoan/doimatkhau/${email}`,
        {
          newPassword,
        }
      );
      setMessage(response.data.message);
      if (response.data.EC === 1) {
        alert("bạn đã đổi mật khẩu thành công");
        navigate("/login");
      }
    } catch (error) {
      setMessage(error.response?.data?.message || "Error resetting password");
    }
  };

  return (
    <div
      style={{
        maxWidth: "400px",
        margin: "0 auto",
        padding: "20px",
        border: "1px solid #ddd",
        borderRadius: "8px",
      }}
    >
      <h2 style={{ textAlign: "center" }}>OTP Verification</h2>

      {/* Input Email */}
      <div style={{ marginBottom: "15px" }}>
        <label style={{ display: "block", marginBottom: "5px" }}>
          Enter your email:
        </label>
        <input
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="Email"
          style={{
            width: "100%",
            padding: "8px",
            borderRadius: "4px",
            border: "1px solid #ccc",
          }}
        />
      </div>

      {/* Button Send OTP */}
      <button
        onClick={handleSendOtp}
        style={{
          width: "100%",
          padding: "10px",
          backgroundColor: "#007BFF",
          color: "#fff",
          border: "none",
          borderRadius: "4px",
          cursor: "pointer",
        }}
      >
        Send OTP
      </button>

      {/* OTP Input */}
      {isOtpSent && (
        <>
          <div style={{ marginTop: "15px", marginBottom: "15px" }}>
            <label style={{ display: "block", marginBottom: "5px" }}>
              Enter OTP:
            </label>
            <input
              type="text"
              value={otp}
              onChange={(e) => setOtp(e.target.value)}
              placeholder="OTP"
              style={{
                width: "100%",
                padding: "8px",
                borderRadius: "4px",
                border: "1px solid #ccc",
              }}
            />
          </div>

          {/* Button Verify OTP */}
          <button
            onClick={handleVerifyOtp}
            style={{
              width: "100%",
              padding: "10px",
              backgroundColor: "#28A745",
              color: "#fff",
              border: "none",
              borderRadius: "4px",
              cursor: "pointer",
            }}
          >
            Verify OTP
          </button>
        </>
      )}

      {/* Change Password Inputs */}
      {isOtpVerified && (
        <>
          <div style={{ marginTop: "15px", marginBottom: "15px" }}>
            <label style={{ display: "block", marginBottom: "5px" }}>
              New Password:
            </label>
            <input
              type="password"
              value={newPassword}
              onChange={(e) => setNewPassword(e.target.value)}
              placeholder="New Password"
              style={{
                width: "100%",
                padding: "8px",
                borderRadius: "4px",
                border: "1px solid #ccc",
              }}
            />
          </div>

          <div style={{ marginBottom: "15px" }}>
            <label style={{ display: "block", marginBottom: "5px" }}>
              Confirm New Password:
            </label>
            <input
              type="password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              placeholder="Confirm New Password"
              style={{
                width: "100%",
                padding: "8px",
                borderRadius: "4px",
                border: "1px solid #ccc",
              }}
            />
          </div>

          <button
            onClick={handleResetPassword}
            style={{
              width: "100%",
              padding: "10px",
              backgroundColor: "#28A745",
              color: "#fff",
              border: "none",
              borderRadius: "4px",
              cursor: "pointer",
            }}
          >
            Reset Password
          </button>
        </>
      )}

      {/* Message Display */}
      {message && (
        <p style={{ marginTop: "15px", color: isOtpSent ? "green" : "red" }}>
          {message}
        </p>
      )}
    </div>
  );
};

export default OtpComponent;
