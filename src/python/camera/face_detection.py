#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import cv2
import argparse

# コマンドラインから引数を取得
parser = argparse.ArgumentParser()
parser.add_argument('url', type=str)
args = parser.parse_args()
video_url = args.url
print("URL: " + video_url)

# ビデオキャプチャオブジェクトを作成
cap = cv2.VideoCapture(video_url)

# 顔検出器の初期化
xml = 'haarcascade_frontalface_default.xml'
# xml = 'haarcascade_eye_tree_eyeglasses.xml'
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + xml)

# トラッカーの初期化
tracker = cv2.TrackerKCF_create()

# 顔領域の初期化フラグ
initialized = False

if not cap.isOpened():
    print("Error: Could not open video stream")

else:
  while True:
      ret, frame = cap.read()

      # フレームが正常に取得できたか確認
      if not ret:
          print("Error: Could not read frame")
          continue

      gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

      if not initialized:
          # 顔検出
          faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

          if len(faces) > 0:
              print('Face detected')
              # 最初の顔をトラッカーにセット
              (x, y, w, h) = faces[0]
              tracker.init(frame, (x, y, w, h))
              initialized = True
      else:
          # トラッカーで顔を追跡
          success, bbox = tracker.update(frame)

          if success:
              (x, y, w, h) = tuple(map(int, bbox))
              cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 2)

      # 結果の表示
      cv2.imshow('Face Tracking', frame)

      # 'q'キーで終了
      if cv2.waitKey(1) & 0xFF == ord('q'):
          break

cap.release()
cv2.destroyAllWindows()

