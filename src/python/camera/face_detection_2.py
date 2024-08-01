#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import cv2
import argparse
import dlib
from imutils import face_utils
import numpy as np

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

# Dlibの顔検出器と特徴点検出器の初期化
detector = dlib.get_frontal_face_detector()
dlib_model = 'shape_predictor_5_face_landmarks.dat'
# dlib_model = 'shape_predictor_68_face_landmarks.dat'
predictor = dlib.shape_predictor("./data/" + dlib_model)

# トラッカーの初期化
tracker = cv2.TrackerKCF_create()

# 顔領域の初期化フラグ
initialized = False

if not cap.isOpened():
  print("Error: Could not open video stream")

else:
  while True:
    ret, frame = cap.read()
    if not ret:
      continue
      
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    gray = cv2.equalizeHist(gray)

    if not initialized:
      # OpenCVのカスケード分類器で顔を検出
      faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

      if len(faces) == 0:
        # OpenCVで顔が検出されなかった場合、Dlibで顔を検出
        dlib_faces = detector(gray)
        for face in dlib_faces:
          (x, y, w, h) = (face.left(), face.top(), face.width(), face.height())
          tracker.init(frame, (x, y, w, h))
          initialized = True

          # Dlibでランドマークを取得
          shape = predictor(gray, face)
          shape = face_utils.shape_to_np(shape)

          # ランドマークを描画
          for (x, y) in shape:
            cv2.circle(frame, (x, y), 2, (0, 255, 0), -1)

      else:
        # OpenCVで顔が検出された場合
        (x, y, w, h) = faces[0]
        tracker.init(frame, (x, y, w, h))
        initialized = True

        # Dlibでランドマークを取得
        face_rect = dlib.rectangle(x, y, x + w, y + h)
        shape = predictor(gray, face_rect)
        shape = face_utils.shape_to_np(shape)

        # ランドマークを描画
        for (x, y) in shape:
          cv2.circle(frame, (x, y), 2, (0, 255, 0), -1)

    else:
      # トラッカーで顔を追跡
      success, bbox = tracker.update(frame)

      if success:
        (x, y, w, h) = tuple(map(int, bbox))
        cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 2)

        # Dlibでランドマークを取得
        face_rect = dlib.rectangle(x, y, x + w, y + h)
        shape = predictor(gray, face_rect)
        shape = face_utils.shape_to_np(shape)

        # ランドマークを描画
        for (x, y) in shape:
          cv2.circle(frame, (x, y), 2, (0, 255, 0), -1)

      else:
        initialized = False
        tracker = cv2.TrackerKCF_create()

    # 結果の表示
    cv2.imshow('Face Detection and Tracking', frame)

    # 'q'キーで終了
    if cv2.waitKey(1) & 0xFF == ord('q'):
      break
      

cap.release()
cv2.destroyAllWindows()

