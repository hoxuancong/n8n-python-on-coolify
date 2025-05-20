FROM n8nio/n8n:latest

USER root

# Cài các gói cần thiết cho python, build, ffmpeg (moviepy cần ffmpeg)
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    libffi-dev \
    bash \
    ffmpeg

USER node

# Copy thư mục chứa requirements.txt và các script Python nếu có (đường dẫn tuỳ bạn)
COPY ./python-scripts/ /home/node/python-scripts/

# Cài thư viện Python cho user node (đảm bảo không gây lỗi quản lý môi trường)
RUN pip3 install --user --no-cache-dir -r /home/node/python-scripts/requirements.txt
