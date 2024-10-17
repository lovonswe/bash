#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 <child_script> <data_to_pass>"
    echo "Example: $0 child_script.sh 'Hello from Parent'"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    usage
fi

# Assign command-line arguments to variables
child_script="$1"
data_to_pass="$2"

# Call the child script with the data to pass
if ./"$child_script" "$data_to_pass"; then
    echo "Child script processed successfully."
else
    echo "Child script failed. Stopping the parent script."
    exit 1
fi
