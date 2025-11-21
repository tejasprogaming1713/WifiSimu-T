#!/bin/bash
set -euo pipefail

# -----------------------------------------
# Colors
# -----------------------------------------
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
CYAN='\e[36m'
RESET='\e[0m'

# -----------------------------------------
# Banner
# -----------------------------------------
banner() {
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━✦"
echo -e "██╗    ██╗██╗███████╗██╗"
echo -e "██║    ██║██║██╔════╝██║"
echo -e "██║ █╗ ██║██║█████╗  ██║"
echo -e "██║███╗██║██║██╔══╝  ██║"
echo -e "╚███╔███╔╝██║██║     ██║"
echo -e " ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝"
echo -e "           W I S I U ⚡"
echo -e "    WiFi Simulation Utility Pro v1.0"
echo -e "✦━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━✦"
echo
}

# -----------------------------------------
# Fake Scan
# -----------------------------------------
scan_wifi() {
echo -e "${CYAN}[✓] Searching nearby WiFi networks...${RESET}"
sleep 1
echo -e "› Found: AirTel_5G"
sleep 1
echo -e "› Found: JioFiber_XT"
sleep 1
echo -e "› Found: TP-Link_1234"
sleep 1
echo -e "${GREEN}[✔] Scan Complete!${RESET}"
echo
}

# -----------------------------------------
# Fake Connect
# -----------------------------------------
connect_wifi() {
read -p "Enter WiFi Name: " WIFI
echo -e "${YELLOW}Connecting to $WIFI ...${RESET}"
sleep 2
echo -e "${GREEN}[✔] Connected Successfully (Simulation)${RESET}"
echo
}

# -----------------------------------------
# Fake Password Generator
# -----------------------------------------
gen_pass() {
echo -e "${CYAN}Generating secure password...${RESET}"
sleep 1
PASS=$(echo $RANDOM | md5sum | head -c 12)
echo -e "${GREEN}Generated: ${PASS}${RESET}"
echo
}

# -----------------------------------------
# Menu
# -----------------------------------------
menu() {
echo -e "${BLUE}1) Scan WiFi"
echo "2) Connect WiFi"
echo "3) Generate Password"
echo "4) Exit${RESET}"
echo
read -p "Choose option: " opt

case $opt in
  1) scan_wifi ;;
  2) connect_wifi ;;
  3) gen_pass ;;
  4) exit 0 ;;
  *) echo -e "${RED}Invalid Option!${RESET}" ;;
esac
}

# -----------------------------------------
# Main Loop
# -----------------------------------------
while true; do
  banner
  menu
done
