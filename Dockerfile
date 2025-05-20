# Sử dụng image chính thức của n8n
FROM n8nio/n8n:latest

# Cài đặt thư viện Python và các phụ thuộc
USER root
RUN apk add --no-cache \
    python3-dev \
    py3-pip \
    py3-fire \
    build-base \
    musl-dev \
    linux-headers \
    libffi-dev \
    bash \
    ffmpeg

# Tạo một virtualenv và cài đặt pip, setuptools, wheel
RUN python3 -m venv /home/node/venv
RUN /home/node/venv/bin/pip install --upgrade pip setuptools wheel

# Copy thư mục python-scripts vào container
COPY --chown=node:node ./python-scripts/ /home/node/python-scripts/

# Cài đặt các thư viện Python từ requirements.txt
RUN /home/node/venv/bin/pip install --no-cache-dir -r /home/node/python-scripts/requirements.txt

# Sử dụng người dùng node
USER node

# Chạy n8n
CMD ["n8n"]
