FROM n8nio/n8n:latest

# Cài đặt Python và các gói hỗ trợ
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
    && python3 -m venv /home/node/venv \
    && /home/node/venv/bin/pip install --upgrade pip setuptools wheel

# Sao chép các tập tin Python scripts vào container
COPY --chown=node:node ./python-scripts/ /home/node/python-scripts/

# Cài đặt các thư viện Python từ requirements.txt trong môi trường ảo
RUN /home/node/venv/bin/pip install --no-cache-dir -r /home/node/python-scripts/requirements.txt

# Chuyển về người dùng node để đảm bảo quyền hạn thích hợp
USER node

# CMD để khởi động n8n
CMD ["n8n", "start"]
