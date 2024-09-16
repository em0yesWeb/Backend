from flask import Flask, request, jsonify
import pandas as pd
from zone_classifier import process_real_time_data  # 모델 예측 함수 가져오기

app = Flask(__name__)

# 모델 파일 및 레이블 인코더 파일 경로
model_file = './0910_aver_model.pkl'  # 학습된 모델 파일 경로
encoder_file = './0910_label_encoder.pkl'  # 레이블 인코더 파일 경로

@app.route('/predict', methods=['POST'])
def predict():
    # 클라이언트(Node.js)로부터 데이터를 받음
    data = request.json.get('features', [])

    # 데이터가 비어있다면 오류 반환
    if not data:
        return jsonify({'error': 'No data provided'}), 400

    # 비콘 데이터를 pandas DataFrame으로 변환
    beacon_data = pd.DataFrame(data)

    # 모델을 사용해 예측 수행
    predicted_zones = process_real_time_data(beacon_data, model_file, encoder_file)

    # 예측 결과를 반환
    return jsonify({'predicted_zone': predicted_zones[0] if predicted_zones else 'No prediction'})

if __name__ == '__main__':
    app.run(port=5000)
