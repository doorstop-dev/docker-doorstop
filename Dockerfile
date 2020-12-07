#Download base image ubuntu latest
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/src/doorstop

COPY requirements.txt .

# Install required packages
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev git \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/* \
  && cd /usr/src/doorstop \
  && pip install --no-cache-dir -r requirements.txt

WORKDIR /usr/src/doorstop/data

ENTRYPOINT /bin/bash
