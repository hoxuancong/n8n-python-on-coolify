FROM n8nio/n8n:latest

# Cài đặt Python3 và tạo liên kết "python" trỏ đến "python3"
USER root
RUN apk add --update python3 py3-pip py3-fire \
    && ln -s /usr/bin/python3 /usr/bin/python

# Chuyển lại sang người dùng node
USER node

# Sao chép các tệp Python scripts vào container
COPY ./python-scripts/ /home/node/python-scripts/

# Cài đặt các thư viện cần thiết
RUN pip3 install -r /home/node/python-scripts/requirements.txt --break-system-packages
