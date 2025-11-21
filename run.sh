#!/bin/bash
echo -e "WISIU Auto-Installer\n"

# Check if wifi.sh exists
if [ ! -f "wifi.sh" ]; then
    echo "wifi.sh not found. Downloading fresh copy..."
    git clone https://github.com/tejasprogaming1713/WifiSimu-T tempfolder
    cp tempfolder/wifi.sh .
    rm -rf tempfolder
fi

chmod +x wifi.sh

echo ""
echo "=============================================="
echo "  Auto-Setup Complete!"
echo "  To run WISIU next time, simply type:"
echo ""
echo "      ./wifi.sh"
echo "=============================================="
echo ""

# Run wifi.sh
./wifi.sh
