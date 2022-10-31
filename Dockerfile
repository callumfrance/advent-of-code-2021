FROM ubuntu:latest
# WORKDIR /src
# SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y \
  gnu-smalltalk

COPY . .

# Run a smalltalk script as follows
# e.g. -
#    docker run advent_smalltalk_2021 gst src/1/1.st