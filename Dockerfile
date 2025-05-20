FROM n8nio/n8n:latest

USER root

# Cài gói cần thiết
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

# Tạo virtualenv với quyền root
RUN python3 -m venv /home/node/venv

# Gán quyền thư mục venv cho user node (cả thư mục con)
RUN chown -R node:node /home/node/venv

# Chuyển user về node
USER node

# Thiết lập PATH để dùng virtualenv
ENV PATH="/home/node/venv/bin:$PATH"

# Copy script và requirements.txt, đảm bảo quyền node
COPY --chown=node:node ./python-scripts/ /home/node/python-scripts/

# Cài các python package trong requirements.txt bằng pip của venv (user node có quyền ghi)
RUN pip install --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r /home/node/python-scripts/requirements.txt

WORKDIR /home/node

CMD ["n8n"]
