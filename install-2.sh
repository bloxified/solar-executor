#!/bin/bash

main() {
    clear
    echo -e "Welcome to Solar Executor Installation!"
    echo -e "Installation Script Version 2.6"

    # License Key Input
    echo -ne "Enter License Key: "
    read input_key

    # Simulate License Validation
    valid_license_keys=(
        "AB12CD34EF56GH78IJ90KL12MN34OP56"
        "QR78ST90UV12WX34YZ56AB78CD90EF12"
        "vonmatthewmanalastas"
        "freekey"
        "GH34IJ56KL78MN90OP12QR34ST56UV78"
    )

    if [[ ! " ${valid_license_keys[@]} " =~ " ${input_key} " ]]; then
        echo -e "Invalid License Key."
        while true; do
            echo -ne "Type 'exit' to quit or press Enter to retry: "
            read retry_input
            if [ "$retry_input" == "exit" ]; then
                exit
            elif [[ " ${valid_license_keys[@]} " =~ " ${input_key} " ]]; then
                break
            else
                echo -ne "Enter License Key: "
                read input_key
            fi
        done
    fi

    echo -e "License Key Accepted. Proceeding with Installation..."

    # Download Roblox
    echo -e "Downloading Latest Roblox..."
    curl -s "https://setup.rbxcdn.com/mac/latest-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
    
    if [ ! -f "./RobloxPlayer.zip" ]; then
        echo -e "Failed to download Roblox. Exiting."
        exit
    fi

    echo -n "Installing Latest Roblox... "
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip" -d "./"
    mv ./RobloxPlayer.app /Applications/Roblox.app
    rm ./RobloxPlayer.zip
    echo -e "Done."

    # Download Solar Executor
    echo -e "Downloading Solar Executor..."
    curl -s "https://github.com/bloxified/solar-executor/releases/latest/download/solar-executor.zip" -o "./solar-executor.zip"
    
    if [ ! -f "./solar-executor.zip" ]; then
        echo -e "Failed to download Solar Executor. Exiting."
        exit
    fi

    echo -n "Installing Solar Executor... "
    [ -d "/Applications/SolarExecutor.app" ] && rm -rf "/Applications/SolarExecutor.app"
    unzip -o -q "./solar-executor.zip" -d "./"
    mv ./SolarExecutor.app /Applications/SolarExecutor.app
    rm ./solar-executor.zip
    echo -e "Done."

    echo -e "Installation Complete! Developed by Solar Executions Development"
    exit
}

main

