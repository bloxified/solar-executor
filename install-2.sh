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

    # Simulated steps
    echo -e "Downloading Latest Roblox..."
    sleep 2
    echo -e "Simulated download complete."

    echo -n "Installing Latest Roblox... "
    sleep 2
    echo -e "Simulated installation complete."

    echo -e "Downloading Solar Executor..."
    sleep 2
    echo -e "Simulated download complete."

    echo -n "Installing Solar Executor... "
    sleep 2
    echo -e "Simulated installation complete."

    echo -e "Installation Complete! Developed by Solar Executions Development"
    exit
}

main
