#!/bin/bash
set -euo pipefail

# -------------------------
# COLORS
# -------------------------
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
CYAN='\e[36m'
PURPLE='\e[35m'
RESET='\e[0m'

# -------------------------
# PREMIUM EFFECTS
# -------------------------
spinner() {
  local delay=0.1
  local spin=('/' '-' '\' '|')
  while :; do
    for s in "${spin[@]}"; do
      printf "\r${PURPLE}Loading %s...${RESET}" "$s"
      sleep $delay
    done
    break
  done
  printf "\r${GREEN}Loaded ✔${RESET}\n"
}

typewriter() {
  text="$1"
  speed=${2:-0.02}
  for (( i=0; i<${#text}; i++ )); do
    printf "${CYAN}%c${RESET}" "${text:$i:1}"
    sleep $speed
  done
  echo ""
}

progress_bar() {
  echo ""
  for i in {1..50}; do
    sleep 0.05
    printf "\r${GREEN}["
    for ((j=1;j<=i;j++)); do printf "#"; done
    for ((j=i+1;j<=50;j++)); do printf "."; done
    printf "] ${i*2}%"
  done
  echo -e "\n${GREEN}Completed ✔${RESET}"
}

# -------------------------
# HEADER
# -------------------------
header() {
  clear
  echo -e "${YELLOW}✦━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━✦${RESET}"
  echo -e "${PURPLE}██╗    ██╗██╗███████╗██╗"
  echo -e "██║    ██║██║██╔════╝██║"
  echo -e "██║ █╗ ██║██║█████╗  ██║"
  echo -e "██║███╗██║██║██╔══╝  ██║"
  echo -e "╚███╔███╔╝██║██║     ██║"
  echo -e " ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝${RESET}"
  echo -e "${CYAN}           W I S I U ⚡${RESET}"
  echo -e "${GREEN}        WiFi Utility Pro v1.0${RESET}"
  echo -e "${YELLOW}✦━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━✦${RESET}"
}

# -------------------------
# RANDOM DEVICE GENERATOR
# -------------------------
show_devices() {
  count=$((RANDOM % 16 + 5))
  for ((i=1;i<=count;i++)); do
    echo -e "${GREEN}• Device-$((RANDOM%9999))${RESET}"
    sleep 0.05
  done
}

# -------------------------
# MENU FUNCTIONS
# -------------------------
menu1() {
  header
  echo -e "${CYAN}Main Menu:${RESET}"
  echo "1) Scan Nearby WiFi"
  echo "2) Connect to WiFi"
  echo "3) Generate Password"
  echo "4) Device Monitor"
  echo "5) Advanced Pro Panel"
  echo "0) Exit to Home"
  read -p "Choose option: " opt
  case $opt in
    1) menu2 ;;
    2) menu3 ;;
    3) menu4 ;;
    4) menu2 ;;  # Device Monitor shows scan
    5) menu5 ;;
    0) cd ~; exit ;;
    *) echo "Invalid"; sleep 2; menu1 ;;
  esac
}

menu2() {
  header
  echo -e "${CYAN}Scanning Nearby WiFi...${RESET}"
  spinner &
  show_devices
  echo ""
  echo "0) Back"
  read -p "Option: " b
  case $b in
    0) sleep 30; menu1 ;;
    *) sleep 30; menu1 ;;
  esac
}

menu3() {
  header
  echo -e "${CYAN}Connect to WiFi:${RESET}"
  spinner &
  show_devices
  read -p "Enter network number to connect: " net
  read -sp "Enter password: " pass
  echo ""
  progress_bar
  echo -e "${GREEN}Connected to Network-$net${RESET}"
  echo "0) Back"
  read -p "Option: " b
  case $b in
    0) sleep 30; menu2 ;;
    *) sleep 30; menu2 ;;
  esac
}

menu4() {
  header
  echo -e "${CYAN}Generate WiFi Password:${RESET}"
  key=$(tr -dc A-Za-z0-9 </dev/urandom | head -c16)
  typewriter "Generated Key: $key"
  echo "0) Back"
  read -p "Option: " b
  case $b in
    0) sleep 30; menu3 ;;
    *) sleep 30; menu3 ;;
  esac
}

menu5() {
  header
  echo -e "${CYAN}Admin Login Required${RESET}"
  read -p "Username: " user
  read -sp "Password: " pass
  echo ""
  if [[ "$user" != "admin" || "$pass" != "admin123" ]]; then
    echo -e "${RED}Invalid login${RESET}"
    sleep 2
    menu1
  fi
  advanced_panel
}

advanced_panel() {
  while true; do
    header
    echo "--- WiFi Tools ---"
    echo "(1) Boost WiFi"
    echo "(2) Optimize Device"
    echo "(3) Auto Boost Mode"
    echo "(4) Speed Analyzer"
    echo "(5) Signal Map"
    echo "(6) Band Selection"
    echo ""
    echo "--- Device Control ---"
    echo "(7) Block Device"
    echo "(8) Unblock Device"
    echo "(9) Limit Speed"
    echo "(10) Device Logs"
    echo ""
    echo "--- Network Tools ---"
    echo "(11) Ping Tool"
    echo "(12) Trace Route"
    echo "(13) DNS Lookup"
    echo "(14) Port Scan"
    echo "(15) Network Map"
    echo ""
    echo "--- Premium Profiles ---"
    echo "(16) Saved Profiles"
    echo "(17) Auto Connect"
    echo "(18) Export QR"
    echo "(19) Password Vault"
    echo "(20) Profile Backup"
    echo ""
    echo "--- System Control ---"
    echo "(21) Restart Tool"
    echo "(22) Clear Cache"
    echo "(23) Reset Network"
    echo "(24) Full Network Rebuild"
    echo "(25-50) More Advanced Tools..."
    echo "0) Back"
    read -p "Choose option: " adv
    case $adv in
      0) sleep 30; menu4 ;;
      *) typewriter "Executing command $adv..."; sleep 2 ;;
    esac
  done
}

# -------------------------
# START SCRIPT
# -------------------------
menu1
