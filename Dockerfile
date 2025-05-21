FROM n8nio/n8n:latest

# Cài đặt Python3 và pip
USER root
RUN apk add --no-cache python3 py3-pip py3-fire \
    && ln -sf /usr/bin/python3 /usr/bin/python

# Quay lại người dùng node
USER node

# Sao chép các Python script vào container
COPY ./python-scripts/ /home/node/python-scripts/

# Đảm bảo quyền sở hữu thư mục python-scripts cho root và node
USER root
RUN chown -R root:node /home/node/python-scripts \
    && chmod -R 775 /home/node/python-scripts

# Quay lại người dùng node
USER node

# Cài đặt các thư viện từ requirements.txt
RUN pip3 install -r /home/node/python-scripts/requirements.txt --break-system-packages
