#!/bin/bash

# Set the download directory
DOWNLOAD_DIR="/Users/davyraitt/Downloads"

# Change the current directory to the download directory
cd "$DOWNLOAD_DIR" || exit

# Initialize the latest version number and corresponding zip file variable
latest=0
latestZip=""

# Find the latest zip file based on the naming pattern
for file in prime*.zip; do
    # Extract the version number from the zip file name
    zipNumber=$(echo "$file" | sed -En 's/prime[[:space:]]*\(([0-9]+)\)\.zip/\1/p')
    
    # Check if zipNumber is a valid integer
    if ! [[ "$zipNumber" =~ ^[0-9]+$ ]]; then
        echo "Error: Failed to extract a valid version number from $file"
        continue
    fi
    
    # Determine if this zip file has the highest number
    if [ "$zipNumber" -gt "$latest" ]; then
        latest="$zipNumber"
        latestZip="$file"
    fi
done

# If a latest zip file is found, extract and run flutter
if [ -n "$latestZip" ]; then
    echo "Extracting $latestZip"
    unzip -q "$latestZip" -d "$latest"
    
    # Navigate to the extracted folder
    if [ -d "$latest" ]; then
        cd "$latest" || exit
        
        # Check if there is a subdirectory named "prime"
        if [ -d "prime" ]; then
            cd "prime" || exit
        fi
        
        # Now in the correct directory, run Flutter commands
        echo "Running Flutter in $(pwd)"
        flutter pub add collection:^1.18.0
        flutter pub get
        flutter pub upgrade
        flutter run
    else
        echo "Failed to find $latest. Make sure the extraction was successful."
    fi
else
    echo "No zip files found to extract."
fi
