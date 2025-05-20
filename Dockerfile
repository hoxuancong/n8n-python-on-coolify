FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    python3 \
    python3-dev \
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

COPY ./python-scripts/ /home/node/python-scripts/

RUN pip3 install --break-system-packages -r /home/node/python-scripts/requirements.txt
