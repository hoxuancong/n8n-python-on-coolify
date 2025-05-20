FROM n8nio/n8n:latest

USER root

# Cài đặt các phụ thuộc
RUN apk add --no-cache \
    ffmpeg \
    python3-dev \
    py3-pip \
    py3-fire \
    build-base \
    musl-dev \
    linux-headers \
    libffi-dev \
    bash

# Cài đặt môi trường ảo
RUN python3 -m venv /home/node/venv

USER node

# Copy mã nguồn Python vào container
COPY --chown=node:node ./python-scripts/ /home/node/python-scripts/

# Cài đặt các thư viện trong requirements.txt
RUN pip install --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r /home/node/python-scripts/requirements.txt

# Chạy n8n
CMD ["n8n"]
