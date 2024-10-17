#!/bin/bash

# Check if the data was passed
if [ "$#" -ne 1 ]; then
    echo "No data passed from the parent script."
    exit 1
fi

# Assign the data passed from the parent script to a variable
data_from_parent="$1"

# Process the data (just an example of doing something with the data)
echo "Received from parent: $data_from_parent"

# Simulate processing with a success condition (change this for different outcomes)
if [ "$data_from_parent" == "Hello from Parent" ]; then
    echo "Processing successful!"
    exit 0  # Success
else
    echo "Processing failed!"
    exit 1  # Failure
fi
