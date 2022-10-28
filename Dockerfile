FROM ubuntu:latest
WORKDIR /src
COPY . .
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -y gnu-smalltalk