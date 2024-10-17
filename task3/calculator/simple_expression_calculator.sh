#!/bin/bash

# Function to perform calculations based on the operator
calculate() {
    local num1="$1"
    local num2="$3"
    local operator="$2"
    
    case "$operator" in
        +)
            ./add.sh "$num1" "$num2"
            ;;
        -)
            ./subtract.sh "$num1" "$num2"
            ;;
        \*)
            ./multiply.sh "$num1" "$num2"
            ;;
        /)
            ./divide.sh "$num1" "$num2"
            ;;
        *)
            echo "Error: Invalid operator. Use +, -, *, or /."
            exit 1
            ;;
    esac
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 '<number1> <operator> <number2>'"
    echo "Example: $0 '5 + 3'"
    exit 1
fi

# Parse the input expression
expression="$1"
num1=$(echo "$expression" | awk '{print $1}')
operator=$(echo "$expression" | awk '{print $2}')
num2=$(echo "$expression" | awk '{print $3}')

# Call the calculate function
calculate "$num1" "$operator" "$num2"
