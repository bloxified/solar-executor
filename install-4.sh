#!/bin/bash

main() {
    clear
    echo -e "Welcome to the Solar Executor Installation Script!"
    echo -e "Install Script Version 1.0"

    # Define a list of valid license keys
    local valid_license_keys=(
        "AB12CD34EF56GH78IJ90KL12MN34OP56"
        "QR78ST90UV12WX34YZ56AB78CD90EF12"
        "vonmatthewmanalastas"
        "freekey"
        "GH34IJ56KL78MN90OP12QR34ST56UV78"
    )

    echo -ne "Enter License Key: "
    read -r input_key

    echo "Debug: Entered Key = '$input_key'"

    # Check if the license key is valid
    local valid=false
    for key in "${valid_license_keys[@]}"; do
        if [ "$input_key" == "$key" ]; then
            valid=true
            break
        fi
    done

    if [ "$valid" == "true" ]; then
        echo -e "License Key Valid!"
    else
        echo -e "Invalid License Key. Exiting."
        exit 1
    fi

    # Wait for 3 seconds before proceeding
    echo -e "Waiting for 3 seconds before continuing..."
    sleep 3

    echo -e "Downloading Solar Executor..."
    curl -L -o SolarExecutor.zip "https://github.com/bloxified/solar-executor/raw/main/Solar%20Executor.app.zip"

    echo -n "Unzipping Solar Executor... "
    unzip -o -q SolarExecutor.zip
    echo -e "Done."

    echo -n "Moving Solar Executor to Applications... "
    mv "Solar Executor.app" /Applications/
    echo -e "Done."

    echo -n "Cleaning up... "
    rm SolarExecutor.zip
    echo -e "Done."

    # Delay before starting Roblox download
    echo -e "Waiting for 3 seconds before downloading Roblox..."
    sleep 3

    echo -e "Downloading Latest Roblox..."
    local roblox_version_info=$(curl -s "https://clientsettingscdn.roblox.com/v2/client-version/MacPlayer")
    local version=$(echo "$roblox_version_info" | jq -r ".clientVersionUpload")
    local roblox_download_url="http://setup.rbxcdn.com/mac/$version-RobloxPlayer.zip"

    curl -L -o RobloxPlayer.zip "$roblox_download_url"

    echo -n "Installing Latest Roblox... "
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q RobloxPlayer.zip
    mv RobloxPlayer.app /Applications/Roblox.app
    rm RobloxPlayer.zip
    echo -e "Done."

    echo -e "Installation Complete! Solar Executor and Roblox have been installed."
}

main
