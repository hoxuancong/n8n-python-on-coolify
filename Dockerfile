FROM n8nio/n8n:latest

USER root
RUN apk add --update python3 py3-pip py3-fire

USER node
COPY ./python-scripts/ /home/node/python-scripts/
RUN pip3 install -r /home/node/python-scripts/requirements.txt --break-system-packages
