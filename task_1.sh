#!/bin/bash

# Default values
default_directory="default_directory"
default_filename="my.txt"
default_extension=".txt"

# Task 1: Directory search and file creation
directory_search() {
    # Prompt for directory name
    read -p "Enter directory name (press Enter for default '$default_directory'): " directory
    directory=${directory:-$default_directory}  # Use default if empty

    # Check if directory creation is successful
    if [ -d "$directory" ]; then
        echo "Directory '$directory' exists."
        echo ""
        echo "Take a look at the content: "
        ls -lht "$directory"
        echo ""
    else
        echo "Directory '$directory' does not exist. Creating folder..."
        mkdir -p "$directory" || { echo "Failed to create directory '$directory'. Try again."; exit 1; }
    fi

    # Prompt for file name
    read -p "Enter file name (press Enter for default '$default_filename'): " file_name
    file_name=${file_name:-$default_filename}  # Use default if empty

    # Check if the file name already has an extension
    if [[ "$file_name" != *.* ]]; then
        file_name="$file_name$default_extension"  # Append default extension if none is provided
    fi

    # Check if file creation is successful
    file_path="$directory/$file_name"
    touch "$file_path" || { echo "Failed to create file '$file_path'. Try again."; exit 1; }

    # Write initial lines to the file
    for i in {1..10}; do
        echo "This is line $i of $file_name" >> "$file_path"
    done

    # Ask user if they want to add content to the file
    read -p "Do you want to put some content in the file '$file_name'? (yes/no): " answer

    # Convert answer to lowercase
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

    # Check user response
    if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
        # Prompt for user input
        read -p "Please enter the content you want to add: " user_input

        # Append the user input to the file
        echo "$user_input" >> "$file_path"
        echo "Your content has been added to '$file_name'."
    else
        echo "No additional content will be added."
    fi

    echo "File '$file_name' has been created in '$directory'."
}

# Task 2: Combine all txt files into a single file
combine_txt_files() {
    input_directory="$1"
    output_file="$2"
    
    if [ -d "$input_directory" ]; then
        echo "Combining all .txt files from '$input_directory' into '$output_file'."
        cat "$input_directory"/*.txt > "$output_file"
        echo "All .txt files have been combined into '$output_file'."
    else
        echo "Directory '$input_directory' does not exist."
    fi
}

# Task 3: Call child script and process based on success/failure
call_child_script() {
    child_script="$1"
    
    if [ -x "$child_script" ]; then
        "$child_script"
        if [ $? -eq 0 ]; then
            echo "Child script processed successfully."
        else
            echo "Child script failed. Stopping the parent script."
            exit 1
        fi
    else
        echo "Child script '$child_script' is not executable or not found."
        exit 1
    fi
}

# Main execution

# Task 1 example usage
directory_search

# Uncomment and modify these for additional tasks
# combine_txt_files "/path/to/your/directory_with_txt_files" "/path/to/output_file.txt"
# call_child_script "/path/to/child_script.sh"
