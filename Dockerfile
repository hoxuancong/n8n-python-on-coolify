# Base image chính thức của n8n
FROM n8nio/n8n:latest

# Chuyển sang root để cài gói hệ thống
USER root

# Cài các gói cần thiết cho build và python
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-virtualenv \
    build-base \
    musl-dev \
    linux-headers \
    libffi-dev \
    bash \
    ffmpeg

# Tạo virtual environment cho user node để cài python package riêng
RUN python3 -m venv /home/node/venv

# Thêm virtualenv vào PATH môi trường, để user node dùng luôn
ENV PATH="/home/node/venv/bin:$PATH"

# Chuyển lại user node để chạy n8n và python scripts
USER node

# Copy thư mục chứa python scripts và requirements.txt vào container
COPY --chown=node:node ./python-scripts/ /home/node/python-scripts/

# Cài các python package trong requirements.txt vào virtualenv
RUN pip install --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r /home/node/python-scripts/requirements.txt

# Set working dir mặc định (tuỳ chọn)
WORKDIR /home/node

# Mặc định chạy n8n
CMD ["n8n"]
