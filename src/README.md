# Running x86 Assembly Code: Easy Steps

After setting up your Docker environment by building the Docker image and starting the container, you've got two simple ways to work with your x86 assembly code. You can either use a ready-made script that does everything for you, or you can go through the steps manually for more control.

**Observation**: The following steps assume you've already set up your Docker environment. If you haven't done that yet, please refer to the [tutorial](../README.md) in the main README file.

## Quick Start with a Ready-Made Script

We've included a script called `asm_run.sh` in the repository to help you easily assemble, link, and run your `.asm` files.

### Making the Script Ready to Use

First, make sure the script can be run by making it executable:

```bash
chmod +x asm_run.sh
```

### Running Your Assembly Code

To compile and run the default file named `main.asm` located in the `src` directory:

```bash
./asm_run.sh
```

If you want to compile and run a different assembly file, just tell the script which file to use:

```bash
./asm_run.sh yourfilename.asm
```

This tells the script to work on `yourfilename.asm`, putting together all the necessary files in a special folder within `src`. It uses `nasm` to assemble the code and `ld` to link it, finishing off by running your code right in the Docker environment.

You can test if the setup works by running the script with the default `main.asm` file or any other assembly file present in the `src` directory. Many examples are provided for you to try out.

## Doing It Yourself Step by Step

Prefer to get your hands dirty and see how it all happens? Here's how to do it step by step:

### Step 1: Assemble Your Code

Turn your `.asm` file into an object file with:

```bash
nasm -f elf32 "yourfilename.asm" -o "yourfilename.o"
```

This command takes your assembly code in `yourfilename.asm` and turns it into `yourfilename.o`.

### Step 2: Link Your Code

Next, turn your object file into an executable program:

```bash
ld -m elf_i386 "yourfilename.o" -o "yourprogram"
```

This connects all the pieces in `yourfilename.o` into a program you can run, named `yourprogram`.

### Step 3: Run Your Program

Now, just run your program:

```bash
./yourprogram
```
