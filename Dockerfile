FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    ffmpeg \
    python3-dev \
    build-base \
    musl-dev \
    linux-headers \
    libffi-dev \
    bash

USER node

COPY ./python-scripts/ /home/node/python-scripts/

RUN pip3 install --break-system-packages -r /home/node/python-scripts/requirements.txt
