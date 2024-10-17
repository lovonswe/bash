#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 <directory> <file_type> <output_file>"
    echo "Example: $0 /path/to/directory txt output.txt"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    usage
fi

# Assign command-line arguments to variables
directory="$1"
file_type="$2"
output_file="$3"

# Check if the specified directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist."
    exit 1
fi

# Initialize or clear the output file
: > "$output_file"

# Initialize a flag to track if any files were found
files_found=false

# Read all files of the specified type in the directory
find "$directory" -type f -name "*.$file_type" | while read -r file; do
    files_found=true
    echo "Processing file: $file"
    
    # Append the filename and its content to the output file
    echo "===== Content of $file =====" >> "$output_file"
    cat "$file" >> "$output_file"
    echo -e "\n" >> "$output_file"  # Add a newline for separation
done

# Check if any files were found
if [ "$files_found" = false ]; then
    echo "No files of type '$file_type' found in '$directory'."
    exit 1
fi

echo "All files of type '$file_type' have been embedded into '$output_file'."
