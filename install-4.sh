#!/bin/bash

main() {
    clear
    echo -e "Solar Executor V1.0 [BETA RELEASE]"
    echo -e "Installation Script - V1.0"

    echo -ne "Checking License Key..."
    
    # Define your license keys
    local validKeys=(
        "AB12CD34EF56GH78IJ90KL12MN34OP56"
        "QR78ST90UV12WX34YZ56AB78CD90EF12"
        "vonmatthewmanalastas"
        "freekey"
        "GH34IJ56KL78MN90OP12QR34ST56UV78"
    )

    # Function to check if the key is valid
    check_license() {
        for key in "${validKeys[@]}"; do
            if [ "$input_key" == "$key" ]; then
                return 0
            fi
        done
        return 1
    }

    # Check if license is valid
    echo -ne "\rEnter License Key:       \b\b\b\b\b\b"
    read input_key
    
    check_license
    if [ $? -ne 0 ]; then
        echo -e "Invalid License Key. Exiting."
        exit 1
    fi

    echo -e "License Key Valid. Proceeding with installation..."

    echo -e "Downloading Solar Executor..."
    curl -L "https://github.com/bloxified/solar-executor/raw/main/Solar%20Executor.app.zip" -o "./SolarExecutor.zip"

    echo -n "Installing Solar Executor... "
    [ -d "/Applications/SolarExecutor.app" ] && rm -rf "/Applications/SolarExecutor.app"
    unzip -o -q "./SolarExecutor.zip"
    mv ./Solar\ Executor.app /Applications/SolarExecutor.app
    rm ./SolarExecutor.zip
    echo -e "Done."

    echo -e "Installation Complete! Enjoy Exploiting!"
}

main

