# Running x86 Assembly Code on ARM: A Simple Guide

This guide is all about getting your i32 x86 assembly code up and running on ARM processors using the QEMU emulator. The focus here is on i32 assembly code, but you can tweak these steps for other types of assembly code too.

I made this repository to help me to run x86 assembly code on my Mac Silicon machine for a subject I'm taking at university. I hope it helps you too!

## What You Need Before Starting

Make sure your system is set up with:

- Docker
- QEMU (Usually, it comes with Docker)

## Getting Your Environment Ready

We'll create a Docker environment that has everything you need to work with assembly code. This includes:

- NASM (Netwide Assembler) to put your code together
- GNU Linker (ld) to bring all parts of your program to work together
- Some extras like Vim for editing and GCC for compiling C code

You can set things up quickly with our ready-to-go scripts or take a bit more control and do it manually.

## Quick Setup with Scripts

### Building Your Docker Image

First, let's make sure our build script can be run:

```bash
chmod +x docker_build.sh
```

Now, run it to build our Docker image:

```bash
./docker_build.sh
```

This creates the `assembly_x86_64_env` Docker image with everything you need.

### Starting Your Docker Container

Next, we need to make our run script executable too:

```bash
chmod +x run_docker.sh
```

Run this script to start your Docker container:

```bash
./run_docker.sh
```

This step opens up a workspace inside the Docker container where you can work with your assembly code.

## Doing It Manually

If you like to do things step-by-step on your own:

### Build the Docker Image Yourself

Just run:

```bash
docker build -t assembly_x86_64_env .
```

This command builds the same Docker image as before.

### Run the Docker Container by Hand

To get your workspace ready, use:

```bash
docker run --rm -it --platform linux/amd64 -v "$(pwd)":/workspace assembly_x86_64_env
```

This will start the Docker container and set up a workspace inside the directory it was run from. You can now work with your assembly code in this environment.

## Running Your Assembly Code

To see how to compile and run your x86 assembly code in this setup, check out the instructions in the [README.md](src/README.md) file inside the `src` directory.
