# flutterflow_project_runner
This script searches for the latest version of a zip file in a specified download directory based on a naming pattern, extracts it, and then runs specific Flutter commands within the extracted directory. It uses version numbers extracted from the zip file names to determine the latest version.


## Overview
This Bash script automates the process of finding, extracting, and setting up the latest version of a Flutter application from zip files located in a specified download directory. It identifies the zip files by a naming pattern, extracts the most recent version based on version numbers, and runs Flutter commands to prepare the application for use.

## Requirements
- Bash shell
- Flutter installed on your system
- `unzip` command available in your environment

## Setup
Before running the script, ensure that the `DOWNLOAD_DIR` variable in the script is set to the path where your zip files are located. For example:
DOWNLOAD_DIR="/path/to/your/downloads"

## Usage
To use the script, follow these steps:

Make the script executable:
chmod +x flutter_version_manager.sh

Run the script:
./flutter_version_manager.sh

## The script will automatically:
- Change to the specified download directory.
- Search for zip files following the naming pattern prime*.zip.
- Identify the latest version by comparing version numbers extracted from file names.
- Extract the latest version into a new directory named after the version number.
- Navigate into the extracted directory, and if a prime subdirectory exists, it will navigate into it.
- Run the following Flutter commands to set up the application:
  - flutter pub add collection:^1.18.0
  - flutter pub get
  - flutter pub upgrade
  - flutter run
  - 
## Troubleshooting
If you encounter errors related to extracting version numbers or navigating directories, ensure the zip files follow the expected naming pattern and contain the necessary directories as described in the script comments.

## Notes
This script assumes the naming pattern and directory structure are consistent with the examples provided in the script comments.
Adjust the DOWNLOAD_DIR and other parameters as necessary to match your environment and Flutter application structure.
