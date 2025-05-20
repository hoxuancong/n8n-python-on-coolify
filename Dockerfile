FROM n8nio/n8n:latest

# Chuyển sang người dùng root để cài đặt các thư viện Python
USER root

# Cài đặt Python và các gói phụ thuộc
RUN apk add --no-cache \
    python3-dev \
    py3-pip \
    py3-fire \
    build-base \
    musl-dev \
    linux-headers \
    libffi-dev \
    bash

# Cài đặt các thư viện Python từ requirements.txt
COPY ./python-scripts/ /home/node/python-scripts/
RUN pip3 install --upgrade pip setuptools wheel && pip3 install --no-cache-dir -r /home/node/python-scripts/requirements.txt

# Chuyển về người dùng node để đảm bảo quyền hạn thích hợp
USER node

# CMD để khởi động n8n
CMD ["n8n", "start"]
