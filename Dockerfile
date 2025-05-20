FROM n8nio/n8n:latest

USER root

# Cài gcc, g++, make, các thư viện dev cần thiết cho build scikit-learn
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-fire \
    build-base \
    musl-dev \
    linux-headers \
    gfortran \
    openblas-dev \
    lapack-dev \
    libffi-dev \
    bash

USER node

# Copy thư mục python-scripts vào container
COPY ./python-scripts/ /home/node/python-scripts/

# Nâng cấp pip, cài thư viện trong requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r /home/node/python-scripts/requirements.txt --break-system-packages
