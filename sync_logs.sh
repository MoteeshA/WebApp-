#!/bin/bash

# ✅ Updated path to match Dart ExportManager
DEVICE_DIR="/sdcard/Download/PhishSafe"
LOCAL_DIR="./session_logs"

mkdir -p "$LOCAL_DIR"

echo "📡 Syncing logs from $DEVICE_DIR to $LOCAL_DIR..."

while true; do
  # List and filter JSON log files
  adb shell ls "$DEVICE_DIR" | grep ".json" | while read file; do
    if [ ! -f "$LOCAL_DIR/$file" ]; then
      echo "📥 Pulling $file..."
      adb pull "$DEVICE_DIR/$file" "$LOCAL_DIR/$file" > /dev/null
    fi
  done
  sleep 5
done
