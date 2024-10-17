#!/bin/bash

# Task 1: Directory search and file creation
directory_search() {
    directory="$1"
    
    if [ -d "$directory" ]; then
        echo "Directory '$directory' exists."
        echo ""
        echo "Take a look at the content : "
        ls -lht
        echo ""
    else
        echo "Directory '$directory' does not exist. Creating folder..."
        mkdir -p "$directory"
    fi
    
    # Create my.txt file using touch
    file_path="$directory/my.txt"
    touch "$file_path"

    for i in {1..10}; do
        echo "This is the ${ordinal[$((i-1))]} line of task_1 file" >> "$file_path"
    done

    #now write some content in the file from user input
    # Ask user if they want to add content to the file
read -p "Do you want to put some content in the file? (yes/no): " answer

# Convert answer to lowercase
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

# Check user response
if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
    # Prompt for user input
    read -p "Please enter the content you want to add: " user_input

    # Append the user input to the file
    echo "$user_input" >> "$file_path"
    echo "Your content has been added to 'my.txt'."
else
    echo "No additional content will be added."
fi

    echo "File 'my.txt' has been created in '$directory'."
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
directory_search "path/to/directory"

# # Task 2 example usage
# combine_txt_files "/path/to/your/directory_with_txt_files" "/path/to/output_file.txt"

# # Task 3 example usage
# call_child_script "/path/to/child_script.sh"
