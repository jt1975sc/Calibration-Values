import sys

# Function to extract calibration value
def extract_calibration_value(line):
    digits = ''.join([char for char in line if char.isdigit()])
    if len(digits) >= 2:
        return int(digits[0] + digits[-1])  # Combine first and last digit as a two-digit number
    return 0

# Main function
def main(input_file):
    total_sum = 0
    with open(input_file, 'r') as f:
        for line in f:
            line = line.strip()
            if line:
                total_sum += extract_calibration_value(line)
    print("Total Sum for Part 1:", total_sum)

# Execution entry point
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python part1.py <input_file>")
    else:
        input_file = sys.argv[1]
        main(input_file)
