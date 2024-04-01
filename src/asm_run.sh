#!/bin/bash

# Check if an argument was provided.
if [ -z "$1" ]; then
    # No argument was provided, so default to "main".
    FILENAME="main"
else
    # Use the provided argument as the filename.
    FILENAME=$1
fi

# Create a directory for the file if it doesn't exist.
mkdir -p $FILENAME

# Assembling the code
echo "Assembling $FILENAME.asm..."
nasm -f elf32 "$FILENAME.asm" -o "$FILENAME/$FILENAME.o"
if [ $? -ne 0 ]; then
    echo "Assembling failed"
    exit 1
fi

# Linking the object file
echo "Linking $FILENAME.o..."
ld -m elf_i386 "$FILENAME/$FILENAME.o" -o "$FILENAME/$FILENAME"
if [ $? -ne 0 ]; then
    echo "Linking failed"
    exit 1
fi

# Running the program
echo "Running $FILENAME..."
./"$FILENAME/$FILENAME"
if [ $? -ne 0 ]; then
    echo "Running failed"
    exit 1
fi

