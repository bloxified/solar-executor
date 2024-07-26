#!/bin/bash

main() {
    # Clear the terminal
    clear

    # Print welcome message
    echo -e "Welcome to the Solar Executor Installation Script!"
    echo -e "Install Script Version 1.0"

    # Path to temporary license file
    local license_file="/tmp/solar_executor_license.txt"

    # Check license
    echo -ne "Checking License..."
    # Temporary license check simulation
    local valid_license_keys=("AB12CD34EF56GH78IJ90KL12MN34OP56" "QR78ST90UV12WX34YZ56AB78CD90EF12" "vonmatthewmanalastas" "freekey" "GH34IJ56KL78MN90OP12QR34ST56UV78")
    
    # Get license key from the user
    echo -ne "\rEnter License Key:       \b\b\b\b\b\b"
    read input_key

    # Check if the license key is valid
    if [[ " ${valid_license_keys[@]} " =~ " ${input_key} " ]]; then
        echo -e "License Key Valid!"
    else
        echo -e "Invalid License Key. Exiting."
        exit 1
    fi

    # Proceed with installation if license key is valid
    echo -e "Downloading Solar Executor..."
    curl -L -o SolarExecutor.zip https://github.com/bloxified/solar-executor/raw/main/Solar%20Executor.app.zip

    echo -n "Unzipping Solar Executor... "
    unzip -o -q SolarExecutor.zip
    echo -e "Done."

    echo -n "Moving Solar Executor to Applications... "
    mv Solar\ Executor.app /Applications/
    echo -e "Done."

    echo -n "Cleaning up... "
    rm SolarExecutor.zip
    echo -e "Done."

    echo -e "Installation Complete! Solar Executor is now in your Applications folder."

    # Clean up any temporary license file if it exists
    rm -f "$license_file"
}

# Execute the main function
main

