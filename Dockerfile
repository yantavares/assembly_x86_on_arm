# Specifies a base image x86_64. Ubuntu is a popular choice due to its extensive documentation and support.
FROM --platform=linux/amd64 ubuntu:latest

# Avoids interactive prompts during image build
ARG DEBIAN_FRONTEND=noninteractive

# Updates package repositories and installs necessary tools
RUN apt-get update && apt-get install -y \
    yasm \
    vim \
    nasm \
    gcc \
    g++ \
    gdb \
    && rm -rf /var/lib/apt/lists/*

# Sets the working directory inside the container
WORKDIR /workspace

# Default command when starting the container
CMD ["bash"]
