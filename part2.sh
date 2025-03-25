#!/bin/bash

# Function to extract calibration value from a line
extract_calibration_value() {
    line="$1"
    digits=$(echo "$line" | tr -cd '0-9')  # Remove everything except digits
    if [[ ${#digits} -ge 2 ]]; then
        echo "$((10 * ${digits:0:1} + ${digits: -1}))"  # Combine first and last digit
    else
        echo 0
    fi
}

# Function to process every 3rd line
process_file() {
    input_file="$1"
    sum=0
    line_number=0
    while IFS= read -r line; do
        ((line_number++))
        if ((line_number % 3 == 0)); then
            value=$(extract_calibration_value "$line")
            sum=$((sum + value))
        fi
    done < "$input_file"
    echo "Total Sum for Part 2: $sum"
}

# Main execution
if [[ $# -lt 1 ]]; then
    echo "Usage: ./part2.sh <input_file>"
else
    input_file="$1"
    process_file "$input_file"
fi
