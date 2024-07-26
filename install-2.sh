#!/bin/bash

main() {
    clear
    echo -e "Thank you for purchasing Solar Executor!"
    echo -e "Install Script Version 2.6"

    # License key validation (static for simplicity)
    echo -ne "Enter License Key: "
    read input_key

    valid_license_keys=(
        "AB12CD34EF56GH78IJ90KL12MN34OP56"
        "QR78ST90UV12WX34YZ56AB78CD90EF12"
        "freekey"
    )

    if [[ ! " ${valid_license_keys[@]} " =~ " ${input_key} " ]]; then
        echo -e "Invalid License Key."
        while true; do
            echo -ne "Type 'exit' to quit or press Enter to retry: "
            read retry_input
            if [ "$retry_input" == "exit" ]; then
                exit
            else
                echo -ne "Enter License Key: "
                read input_key
                if [[ " ${valid_license_keys[@]} " =~ " ${input_key} " ]]; then
                    break
                fi
            fi
        done
    fi

    echo -e "License Key Accepted. Proceeding with Installation..."

    # Download Roblox
    echo -e "Downloading Latest Roblox..."
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    local robloxVersionInfo=$(curl -s "https://clientsettingscdn.roblox.com/v2/client-version/MacPlayer")
    
    local robloxVersion=$(echo $robloxVersionInfo | jq -r ".clientVersionUpload")
    local version="version-35578f93b64f4c86" # Set a default version for comparison
    
    if [ "$version" != "$robloxVersion" ]; then
        curl "http://setup.rbxcdn.com/mac/$robloxVersion-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
    else
        curl "http://setup.rbxcdn.com/mac/$version-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
    fi
    
    echo -n "Installing Latest Roblox... "
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip" -d "./"
    mv ./RobloxPlayer.app /Applications/Roblox.app
    rm ./RobloxPlayer.zip
    echo -e "Done."

    # Download and install Solar Executor
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

    echo -e "Install Complete! Developed by Solar Executions Development"
    exit
}

main
