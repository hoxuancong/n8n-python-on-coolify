# Sử dụng phiên bản mới nhất của n8n từ Docker Hub
FROM n8nio/n8n:latest

# Cài đặt các gói cần thiết (Python, pip và các thư viện hỗ trợ)
USER root
RUN apk add --update python3 py3-pip py3-fire

# Quay lại user node để tiếp tục cài đặt các phần mềm liên quan đến n8n
USER node

# Sao chép thư mục python-scripts từ máy chủ vào container
COPY ./python-scripts/ /home/node/python-scripts/

# Cài đặt các thư viện Python cần thiết từ file requirements.txt
RUN pip3 install -r /home/node/python-scripts/requirements.txt --break-system-packages
