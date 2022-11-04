FROM ubuntu:latest AS small-ubuntu-talk

# Install tools required for project
# Run `docker build --no-cache .` to update dependencies
RUN apt-get update && apt-get install -y \
  gnu-smalltalk

# Copy the entire project (build not necessary)
# This layer is rebuilt when a file changes in the project directory
COPY . .

# Run a smalltalk script as follows
# e.g. -
#    docker run advent_smalltalk_2021 gst src/1/1.st