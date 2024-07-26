#!/bin/bash

main() {
    clear
    echo -e "Welcome to the Solar Experience!"
    echo -e "Install Script Version 1.0"

    local valid_keys=("AB12CD34EF56GH78IJ90KL12MN34OP56" "QR78ST90UV12WX34YZ56AB78CD90EF12" "vonmatthewmanalastas" "freekey" "GH34IJ56KL78MN90OP12QR34ST56UV78")

    while true; do
        # Prompt for License Key
        echo -ne "Enter License Key: "
        read input_key

        # Check if the entered key is valid
        if [[ " ${valid_keys[@]} " =~ " ${input_key} " ]]; then
            echo -ne "Checking License..."
            sleep 2
            echo -e " Done."
            break
        else
            echo -e "Invalid License Key. Please try again or type 'exit' to quit."

            # Allow user to quit or retry
            echo -ne "Type 'exit' to quit or press Enter to retry: "
            read retry_option
            if [[ "$retry_option" == "exit" ]]; then
                echo -e "Exiting."
                exit 1
            fi
        fi
    done

    # Download and Install Roblox
    echo -e "Downloading Latest Roblox..."
    curl -L -o "RobloxPlayer.zip" "https://setup.rbxcdn.com/mac/latest-RobloxPlayer.zip"

    echo -n "Installing Roblox... "
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "RobloxPlayer.zip" -d "/Applications"
    rm "RobloxPlayer.zip"
    echo -e "Done."

    # Download and Install Solar Executor
    echo -e "Downloading Solar Executor..."
    curl -L -o "solar-executor.zip" "https://github.com/bloxified/solar-executor/releases/download/latest/Solar-Executor.zip"

    echo -n "Installing Solar Executor... "
    [ -d "/Applications/Solar Executor.app" ] && rm -rf "/Applications/Solar Executor.app"
    unzip -o -q "solar-executor.zip" -d "/Applications"
    rm "solar-executor.zip"
    echo -e "Done."

    echo -e "Installation Complete!"
    exit
}

main

