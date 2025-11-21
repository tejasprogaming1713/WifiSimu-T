#!/bin/bash

echo -e "WISIU Auto-Installer\n"

# Check for any possible script name
if [ ! -f "wifi.sh" ] && [ ! -f "wisiu.sh" ] && [ ! -f "T-WIFSIU.sh" ]; then
    echo "No WiFi script found."
    echo "Downloading fresh copy..."
    git clone https://github.com/tejasprogaming1713/WifiSimu-T tempfolder
    cp tempfolder/*.sh .
    rm -rf tempfolder
fi

# Detect correct file
if [ -f "wisiu.sh" ]; then
    FILE="wisiu.sh"
elif [ -f "wifi.sh" ]; then
    FILE="wifi.sh"
elif [ -f "T-WIFSIU.sh" ]; then
    FILE="T-WIFSIU.sh"
else
    echo "Error: No script found even after download."
    exit 1
fi

chmod +x "$FILE"

echo ""
echo "=============================================="
echo "  Auto-Setup Complete!"
echo "  To run WISIU next time, simply type:"
echo ""
echo "      bash wifi.sh"
echo "=============================================="
echo ""

./"$FILE"
