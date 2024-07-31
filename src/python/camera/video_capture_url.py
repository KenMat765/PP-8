#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import cv2
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('url', type=str)
args = parser.parse_args()
video_url = args.url
print("URL: " + video_url)

# ビデオキャプチャオブジェクトを作成
cap = cv2.VideoCapture(video_url)

if not cap.isOpened():
    print("Error: Could not open video stream")
else:
    while True:
        # フレームを1つ取得
        ret, frame = cap.read()

        # フレームが正常に取得できたか確認
        if not ret:
            print("Error: Could not read frame")
            # break

        # フレームを表示
        cv2.imshow('Video Stream', frame)

        # 'q'キーが押されたらループを抜ける
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # キャプチャオブジェクトとウィンドウを解放
    cap.release()
    cv2.destroyAllWindows()

