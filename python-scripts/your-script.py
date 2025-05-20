from pytube import YouTube
import moviepy.editor as mp
from youtube_transcript_api import YouTubeTranscriptApi

print("Thư viện pytube, moviepy, youtube-transcript-api đã được cài thành công!")

# Test pytube: lấy tiêu đề video youtube
try:
    yt = YouTube('https://www.youtube.com/watch?v=dQw4w9WgXcQ')
    print("Tiêu đề video:", yt.title)
except Exception as e:
    print("Lỗi pytube:", e)

# Test moviepy: tạo clip trống 1s và in duration
try:
    clip = mp.ColorClip(size=(640, 480), color=(255, 0, 0), duration=1)
    print("Độ dài clip moviepy:", clip.duration)
except Exception as e:
    print("Lỗi moviepy:", e)

# Test youtube-transcript-api: lấy phụ đề video (nếu có)
try:
    transcript = YouTubeTranscriptApi.get_transcript('dQw4w9WgXcQ')
    print("Đoạn phụ đề đầu tiên:", transcript[0])
except Exception as e:
    print("Lỗi youtube-transcript-api:", e)
