#!/bin/bash

# Check for --help flag and display usage
if [[ "$1" == "--help" ]]; then
    echo "Usage: $0 [-n] [-v] pattern filename"
    echo "  -n: Show line numbers for each match"
    echo "  -v: Invert the match (print lines that do not match)"
    echo "  --help: Display this usage information"
    exit 0
fi

# Check for minimum arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 [options] pattern file"
    echo "Options:"
    echo "  -n    Show line numbers"
    echo "  -v    Invert match (show non-matching lines)"
    exit 1
fi

# Initialize options
show_line_numbers=0
invert_match=0
pattern=""
file=""

# Parse options (-v, -n, or combined like -vn / -nv)
while getopts ":vn" opt; do
    case $opt in
        v) invert_match=1 ;;
        n) show_line_numbers=1 ;;
        \?) echo "Unknown option: -$OPTARG" >&2; exit 1 ;;
    esac
done
shift $((OPTIND-1))

# Get pattern and file
pattern="$1"
file="$2"

# Check if pattern and file are provided
if [ -z "$pattern" ] || [ -z "$file" ]; then
    echo "Error: Missing search pattern or filename" >&2
    echo "Usage: $0 [options] pattern file" >&2
    exit 1
fi

# Check if file exists and is readable
if [ ! -f "$file" ] || [ ! -r "$file" ]; then
    echo "Error: File '$file' not found or not readable" >&2
    exit 1
fi

# grep options
grep_options="-i"  # case-insensitive search

if [ $invert_match -eq 1 ]; then
    grep_options="$grep_options -v"
fi

if [ $show_line_numbers -eq 1 ]; then
    grep_options="$grep_options -n"
fi

# Run grep with options
grep $grep_options -- "$pattern" "$file"
