# build base 

  FROM ubuntu:latest AS base

  RUN apt-get update -y \
    && apt-get install -y openssl libtinfo5

# build enu

  FROM base

  WORKDIR /enu

  COPY enunode ./
