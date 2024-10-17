#!/bin/bash
# Divide two numbers
if [ "$2" -eq 0 ]; then
    echo "Error: Division by zero!"
    exit 1
fi
echo $(($1 / $2))
