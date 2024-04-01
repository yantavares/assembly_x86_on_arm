#!/bin/bash

# Run a Docker container with the current directory mounted to /workspace inside the container.
docker run --rm -it --platform linux/amd64 -v "$(pwd)":/workspace assembly_x86_64_env
