FROM ubuntu:latest AS base

WORKDIR /enu

RUN apt-get update -y \
  && apt-get install -y wget openssl libtinfo5

RUN wget https://github.com/mingfunwong/enu-node/releases/download/enu-linux/enunode

RUN chmod o+x enunode

COPY config ./config
COPY start.sh .

ENTRYPOINT ["bash", "/enu/start.sh"]
