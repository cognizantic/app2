import os
import cv2
import json
from ultralytics import YOLO
from collections import defaultdict

VIDEO_FOLDER = 'videos'
FRAME_INTERVAL_SECONDS = 1
OUTPUT_JSON = 'object_video_map.json'

# Load YOLOv8 model
model = YOLO('/dectectors/yolov8n.pt')  # or yolov8n.pt for faster, yolov8x.pt for more accuracy

# Dictionary to store {object_name: [videos]}
object_to_videos = defaultdict(set)

def extract_frames(video_path, interval_sec=1):
    frames = []
    cap = cv2.VideoCapture(video_path)
    fps = cap.get(cv2.CAP_PROP_FPS)
    interval = int(fps * interval_sec)
    frame_count = 0

    while True:
        ret, frame = cap.read()
        if not ret:
            break
        if int(cap.get(cv2.CAP_PROP_POS_FRAMES)) % interval == 0:
            frames.append(frame)
        frame_count += 1
    cap.release()
    return frames

def process_video(video_path):
    video_name = os.path.basename(video_path)
    print(f"Processing: {video_name}")
    frames = extract_frames(video_path, interval_sec=FRAME_INTERVAL_SECONDS)

    for frame in frames:
        results = model(frame)
        for result in results:
            if result.boxes:
                classes = result.names
                for cls_id in result.boxes.cls:
                    obj_name = classes[int(cls_id)]
                    object_to_videos[obj_name].add(video_name)

def save_to_json(data, path):
    # Convert set to list for JSON
    data = {k: list(v) for k, v in data.items()}
    with open(path, 'w') as f:
        json.dump(data, f, indent=4)
    print(f"JSON saved to {path}")

def main():
    for file in os.listdir(VIDEO_FOLDER):
        if file.lower().endswith(('.mp4', '.mov', '.avi', '.mkv')):
            video_path = os.path.join(VIDEO_FOLDER, file)
            process_video(video_path)

    save_to_json(object_to_videos, OUTPUT_JSON)

if __name__ == '__main__':
    main()
