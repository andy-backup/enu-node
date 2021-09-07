# build base 

  FROM ubuntu:18.04 AS base

  RUN apt-get update -y \
    && apt-get install -y openssl

# build enu

  FROM base

  WORKDIR /enu

  COPY enunode ./
