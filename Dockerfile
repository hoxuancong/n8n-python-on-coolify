# Chọn image chính thức của n8n
FROM n8nio/n8n:latest

# Cài đặt Python và các thư viện cần thiết
USER root

# Cài đặt Python và các gói hỗ trợ
RUN apk add --no-cache \
    python3-dev \
    py3-pip \
    py3-fire \
    build-base \
    musl-dev \
    linux-headers \
    libffi-dev \
    bash \
    && python3 -m venv /home/node/venv \
    && /home/node/venv/bin/pip install --upgrade pip setuptools wheel

# Sao chép các tập tin Python scripts vào container
COPY --chown=node:node ./python-scripts/ /home/node/python-scripts/

# Cài đặt các thư viện Python từ requirements.txt
RUN /home/node/venv/bin/pip install --no-cache-dir -r /home/node/python-scripts/requirements.txt

# Thiết lập người dùng về node để tránh vấn đề quyền truy cập
USER node

# Đảm bảo rằng n8n có thể chạy đúng lệnh
ENTRYPOINT ["/home/node/.n8n/n8n"]
