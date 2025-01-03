from flask import Flask, jsonify, request
from flask_cors import CORS
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder
import traceback
import plotly.express as px
import plotly.io as pio
import numpy as np
import json
import plotly.graph_objects as go
import pymysql
app = Flask(__name__)
CORS(app)  # Kích hoạt CORS cho tất cả các route


db_config = {
    'host': 'localhost',      # Địa chỉ máy chủ MySQL
    'user': 'root',           # Tên người dùng
    'database': 'nghiencuukhoahoc', # Tên cơ sở dữ liệu
    'charset': 'utf8mb4'
}

def get_db_connection():
    connection = pymysql.connect(
        host=db_config['host'],
        user=db_config['user'],
        database=db_config['database'],
        charset=db_config['charset']
    )
    return connection

# Định nghĩa một route đơn giản
@app.route('/', methods=['GET'])
def chao():
    return jsonify(message="Xin chào!")

@app.route('/api/hello', methods=['GET'])
def hello():
    return jsonify(message="Python đang sống tốt ...!")

@app.route('/api/randomforest', methods=['POST'])
def random_forest_predict():
    try:
        # Lấy dữ liệu từ request
        data = request.get_json()
        data_training = data.get('data_training', [])
        data_auto_phan_cong = data.get('data_auto_phan_cong', [])
        data_gv = data.get('data_gv', [])

        if not data_training or not data_auto_phan_cong or not data_gv:
            return jsonify({
                "EM": "Thiếu dữ liệu đầu vào",
                "EC": -1,
                "DT": []
            }), 400

        # Chuyển dữ liệu thành DataFrame
        df_train = pd.DataFrame(data_training)
        df_predict = pd.DataFrame(data_auto_phan_cong)
        df_gv = pd.DataFrame(data_gv)

        # Kiểm tra các cột cần thiết
        required_columns = ['MAGV', 'MAMONHOC']
        for col in required_columns:
            if col not in df_train.columns:
                return jsonify({
                    "EM": f"Thiếu cột {col} trong data_training",
                    "EC": -1,
                    "DT": []
                }), 400

        # Xử lý dữ liệu huấn luyện
        X_train = df_train[['MAMONHOC']]
        y_train = df_train['MAGV']

        # Xử lý dữ liệu dự đoán
        X_predict = df_predict[['MAMONHOC']]

        # Encode các biến phân loại
        le_MAMONHOC = LabelEncoder()
        le_MAGV = LabelEncoder()

        # Fit và transform trên dữ liệu huấn luyện
        X_train.loc[:, 'MAMONHOC'] = le_MAMONHOC.fit_transform(X_train['MAMONHOC'])
        y_train_encoded = le_MAGV.fit_transform(y_train)

        # Kiểm tra các giá trị chưa thấy trong X_predict
        unseen_mamonhoc = set(X_predict['MAMONHOC']) - set(le_MAMONHOC.classes_)
        if unseen_mamonhoc:
            print("Có giá trị MAMONHOC chưa thấy:", unseen_mamonhoc)
            # Có thể quyết định xử lý tại đây

        # Transform dữ liệu dự đoán
        X_predict.loc[:, 'MAMONHOC'] = le_MAMONHOC.transform(X_predict['MAMONHOC'])

        # Xây dựng mô hình Random Forest
        clf = RandomForestClassifier(n_estimators=100, random_state=42)
        clf.fit(X_train, y_train_encoded)

        # Dự đoán
        y_pred_encoded = clf.predict(X_predict)
        y_pred = le_MAGV.inverse_transform(y_pred_encoded)

        # Lấy danh sách MAGV hợp lệ từ data_gv
        valid_magv = set(df_gv['MAGV'].unique())
        y_pred_filtered = [magv if magv in valid_magv else None for magv in y_pred]

        # Gán MAGV vào DataFrame dự đoán
        df_predict['MAGV'] = y_pred_filtered

        # Xử lý các trường hợp không hợp lệ (MAGV không trong data_gv)
        for index, row in df_predict.iterrows():
            if row['MAGV'] is None:
                df_predict.at[index, 'MAGV'] = df_gv.sample(1)['MAGV'].values[0]

        # Chuyển DataFrame dự đoán thành danh sách dict
        result = df_predict.to_dict(orient='records')

        return jsonify({
            "EM": "Success",
            "EC": 0,
            "DT": result
        })

    except Exception as e:
        print("Lỗi trong /api/randomforest:", e)
        traceback.print_exc()
        return jsonify({
            "EM": "Lỗi xử lý Random Forest",
            "EC": -1,
            "DT": []
        }), 500




@app.route('/api/helloworld', methods=['GET'])
def hello_world():
    return jsonify(message="Hello World!")




@app.route('/api/plotly', methods=['POST'])
def plotly_chart():
    try:
        # Lấy TENNAMHOC từ dữ liệu request
        request_data = request.get_json()  # Lấy dữ liệu JSON từ body request
        TENNAMHOC = request_data.get('TENNAMHOC')  # Lấy giá trị TENNAMHOC

        # Kết nối đến cơ sở dữ liệu
        connection = get_db_connection()
        cursor = connection.cursor(pymysql.cursors.DictCursor)

        # Truy vấn cơ sở dữ liệu với TENNAMHOC
        cursor.execute("""
            SELECT bomon.TENBOMON, COUNT(dang_ky_thuc_hien_quy_doi.MAGV) AS SoLuongDeTai
            FROM bomon
            INNER JOIN giangvien ON bomon.MABOMON = giangvien.MABOMON
            INNER JOIN khoa ON khoa.MAKHOA = bomon.MAKHOA
            INNER JOIN dang_ky_thuc_hien_quy_doi ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
            INNER JOIN namhoc ON namhoc.MANAMHOC = dang_ky_thuc_hien_quy_doi.MANAMHOC
            WHERE khoa.TENKHOA = N'Khoa Kỹ Thuật Công Nghệ'
            AND namhoc.TENNAMHOC = %s
            GROUP BY bomon.TENBOMON;
        """, (TENNAMHOC,))  # Truyền TENNAMHOC vào query
        result = cursor.fetchall()

        # Đóng kết nối
        cursor.close()
        connection.close()

        # Chuyển kết quả thành DataFrame
        df = pd.DataFrame(result)

        # Tạo biểu đồ cột sử dụng Plotly
        fig = px.bar(
            df, 
            x='TENBOMON', 
            y='SoLuongDeTai', 
            labels={'TENBOMON': 'Bộ Môn', 'SoLuongDeTai': 'Số Lượng Đề Tài'},
            title='Số Lượng Đề Tài Theo Bộ Môn Trong Khoa Kỹ Thuật Công Nghệ'  # Thêm tiêu đề tại đây
        )

        # Chuyển đổi biểu đồ thành dict
        chart_data = fig.to_dict()

        # Hàm đệ quy để chuyển ndarray thành list
        def convert_ndarray(obj):
            if isinstance(obj, np.ndarray):
                return obj.tolist()
            elif isinstance(obj, dict):
                return {key: convert_ndarray(value) for key, value in obj.items()}
            elif isinstance(obj, list):
                return [convert_ndarray(item) for item in obj]
            else:
                return obj

        # Chuyển đổi chart_data
        chart_data_serializable = convert_ndarray(chart_data)

        # Trả về biểu đồ dưới dạng JSON
        return jsonify({
            "EM": "Success",
            "EC": 0,
            "DT": chart_data_serializable
        })

    except Exception as e:
        print(f"Error: {e}")
        return jsonify({
            "EM": "Lỗi xử lý biểu đồ",
            "EC": -1,
            "DT": str(e)
        }), 500


@app.route('/api/chart', methods=['GET'])
def chart():
    try:
        # Dữ liệu mẫu
        x = ['Winter', 'Spring', 'Summer', 'Fall']
        y1 = [40, 60, 40, 10]
        y2 = [20, 10, 10, 60]
        y3 = [40, 30, 50, 30]

        fig = go.Figure()
        fig.add_trace(go.Scatter(
            x=x, y=y1,
            hoverinfo='x+y',
            mode='lines',
            line=dict(width=0.5, color='rgb(131, 90, 241)'),
            stackgroup='one'
        ))
        fig.add_trace(go.Scatter(
            x=x, y=y2,
            hoverinfo='x+y',
            mode='lines',
            line=dict(width=0.5, color='rgb(111, 231, 219)'),
            stackgroup='one'
        ))
        fig.add_trace(go.Scatter(
            x=x, y=y3,
            hoverinfo='x+y',
            mode='lines',
            line=dict(width=0.5, color='rgb(184, 247, 212)'),
            stackgroup='one'
        ))

        fig.update_layout(yaxis_range=(0, 100))
        chart_data = fig.to_dict()

        # Hàm đệ quy để chuyển ndarray thành list
        def convert_ndarray(obj):
            if isinstance(obj, np.ndarray):
                return obj.tolist()
            elif isinstance(obj, dict):
                return {key: convert_ndarray(value) for key, value in obj.items()}
            elif isinstance(obj, list):
                return [convert_ndarray(item) for item in obj]
            else:
                return obj

        chart_data_serializable = convert_ndarray(chart_data)

        return jsonify({
            "EM": "Success",
            "EC": 0,
            "DT": chart_data_serializable
        })

    except Exception as e:
        print(f"Error: {e}")
        return jsonify({
            "EM": "Lỗi xử lý biểu đồ",
            "EC": -1,
            "DT": str(e)
        }), 500



@app.route('/api/piechart', methods=['POST'])
def pie_chart():
    try:
        # Lấy TENNAMHOC từ body của request
        data = request.get_json()
        tennamhoc = data.get('TENNAMHOC')

        if not tennamhoc:
            return jsonify({
                "EM": "Thiếu TENNAMHOC trong request",
                "EC": -1,
                "DT": "TENNAMHOC không được truyền vào"
            }), 400

        # Kết nối đến cơ sở dữ liệu
        connection = get_db_connection()
        cursor = connection.cursor(pymysql.cursors.DictCursor)

        # Truy vấn tổng số lượng đề tài
        cursor.execute("""
            SELECT COUNT(dang_ky_thuc_hien_quy_doi.MAGV) AS TongSoLuongDeTai
            FROM bomon
            INNER JOIN giangvien ON bomon.MABOMON = giangvien.MABOMON
            INNER JOIN khoa ON khoa.MAKHOA = bomon.MAKHOA
            INNER JOIN dang_ky_thuc_hien_quy_doi ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
            INNER JOIN namhoc ON namhoc.MANAMHOC = dang_ky_thuc_hien_quy_doi.MANAMHOC
            WHERE khoa.TENKHOA = N'Khoa Kỹ Thuật Công Nghệ'
            and namhoc.TENNAMHOC = %s;
        """, (tennamhoc,))
        total_result = cursor.fetchone()
        total_projects = total_result['TongSoLuongDeTai']

        # Truy vấn 3 giảng viên có số lượng đề tài nhiều nhất
        cursor.execute("""
            SELECT 
                giangvien.TENGV AS TenGiangVien, 
                COUNT(dang_ky_thuc_hien_quy_doi.MAGV) AS SoLuongDeTai
            FROM bomon
            INNER JOIN giangvien ON bomon.MABOMON = giangvien.MABOMON
            INNER JOIN khoa ON khoa.MAKHOA = bomon.MAKHOA
            INNER JOIN dang_ky_thuc_hien_quy_doi ON giangvien.MAGV = dang_ky_thuc_hien_quy_doi.MAGV
            INNER JOIN namhoc ON namhoc.MANAMHOC = dang_ky_thuc_hien_quy_doi.MANAMHOC
            WHERE khoa.TENKHOA = N'Khoa Kỹ Thuật Công Nghệ'
             and namhoc.TENNAMHOC = %s
            GROUP BY giangvien.TENGV
            ORDER BY SoLuongDeTai DESC
            LIMIT 3;
        """, (tennamhoc,))
        top3_result = cursor.fetchall()

        # Tính số lượng đề tài còn lại
        top3_projects = sum(row['SoLuongDeTai'] for row in top3_result)
        others_projects = total_projects - top3_projects

        # Chuẩn bị dữ liệu cho biểu đồ
        labels = [row['TenGiangVien'] for row in top3_result] + ['Khác']
        values = [row['SoLuongDeTai'] for row in top3_result] + [others_projects]

        # Đóng kết nối
        cursor.close()
        connection.close()

        # Tạo biểu đồ hình tròn (pie chart) với Plotly
        fig = px.pie(
            names=labels, 
            values=values, 
            title='Tỷ lệ số lượng đề tài của giảng viên trong khoa'
        )

        # Chuyển đổi biểu đồ thành một dict
        chart_data = fig.to_dict()

        # Hàm đệ quy để chuyển ndarray thành list
        def convert_ndarray(obj):
            if isinstance(obj, np.ndarray):
                return obj.tolist()
            elif isinstance(obj, dict):
                return {key: convert_ndarray(value) for key, value in obj.items()}
            elif isinstance(obj, list):
                return [convert_ndarray(item) for item in obj]
            else:
                return obj

        # Chuyển đổi chart_data để có thể trả về dưới dạng JSON
        chart_data_serializable = convert_ndarray(chart_data)

        # Trả về biểu đồ dưới dạng JSON
        return jsonify({
            "EM": "Success",
            "EC": 0,
            "DT": chart_data_serializable
        })

    except Exception as e:
        print(f"Error: {e}")
        return jsonify({
            "EM": "Lỗi xử lý biểu đồ",
            "EC": -1,
            "DT": str(e)
        }), 500

# Chạy server
if __name__ == '__main__':
    app.run(debug=True)