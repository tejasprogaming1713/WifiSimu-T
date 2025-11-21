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

clear

# -------------------------
# WISIU PREMIUM INTRO (Style E + C)
# -------------------------
echo -e "${YELLOW}✦━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━✦${RESET}"
echo -e "${PURPLE}██╗    ██╗██╗███████╗██╗"
echo -e "██║    ██║██║██╔════╝██║"
echo -e "██║ █╗ ██║██║█████╗  ██║"
echo -e "██║███╗██║██║██╔══╝  ██║"
echo -e "╚███╔███╔╝██║██║     ██║"
echo -e " ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝${RESET}"
echo -e "${CYAN}           W I S I U  ⚡${RESET}"
echo -e "${GREEN}    WiFi Simulation Utility Pro v1.0${RESET}"
echo -e "${YELLOW}✦━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━✦${RESET}"
echo ""


# -------------------------
# SPINNER ANIMATION
# -------------------------
spinner() {
    local pid=$!
    local delay=0.15
    local spin=('/' '-' '\' '|')
    while kill -0 $pid 2>/dev/null; do
        for s in "${spin[@]}"; do
            printf "\r${PURPLE}Loading... %s${RESET}" "$s"
            sleep $delay
        done
    done
    printf "\r${GREEN}Loading... DONE ✔${RESET}\n"
}

premium_slow() {
    text="$1"
    for (( i=0; i<${#text}; i++ )); do
        printf "${CYAN}%c${RESET}" "${text:$i:1}"
        sleep 0.02
    done
    echo ""
}


# -------------------------
# RANDOM GENERATORS
# -------------------------
rand_ip4() {
    echo "$((RANDOM % 255)).$((RANDOM % 255)).$((RANDOM % 255)).$((RANDOM % 255))"
}

rand_ip6() {
    printf "%x:%x:%x:%x:%x:%x:%x:%x\n" \
    $((RANDOM%65535)) $((RANDOM%65535)) $((RANDOM%65535)) $((RANDOM%65535)) \
    $((RANDOM%65535)) $((RANDOM%65535)) $((RANDOM%65535)) $((RANDOM%65535))
}

rand_key() {
    letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    random_letter=${letters[$RANDOM % ${#letters[@]}]}
    len=$((15 + RANDOM % 15))
    num=""
    for ((i=0;i<len;i++)); do num+=$((RANDOM%10)); done
    echo "${random_letter}:${num}"
}

# 5–10% random error
random_error() {
    if (( RANDOM % 12 == 0 )); then
        echo -e "${RED}SYSTEM ERROR: Temporary WiFi conflict detected.${RESET}"
        echo -e "${YELLOW}Retrying setup...${RESET}"
        sleep 2
    fi
}


# -------------------------
# MAIN WIFI MENU
# -------------------------
echo -e "${CYAN}=============================="
echo -e "         CHOOSE WIFI"
echo -e "==============================${RESET}"
echo ""
echo -e "${GREEN}(1) TEMP IDX WIFI"
echo "(2) TEMP GITHUB WIFI"
echo "(3) TEST WIFI"
echo "(4) PANEL WIFI"
echo "(5) PREMIUM WIFI (PAID)"
echo -e "${PURPLE}(6) ADMIN WIFI${RESET}"
echo ""

read -p "TYPE A NUMBER HERE → " CH
echo ""

premium_slow "Starting setup..."
random_error & spinner


# -------------------------
# SIMULATED DATA OUTPUT
# -------------------------
IPV4=$(rand_ip4)
IPV6=$(rand_ip6)
KEY=$(rand_key)

echo -e "${CYAN}PASSWORD:${RESET} ********"
echo -e "${CYAN}IPv4 IP:${RESET} $IPV4"
echo -e "${CYAN}IPv6 IP:${RESET} $IPV6"
echo -e "${CYAN}DEVICE REACHING:${RESET} ACTIVE"
echo -e "${CYAN}DATA:${RESET} Unlimited"
echo -e "${CYAN}CORDS:${RESET} Stable"
echo -e "${CYAN}BILL:${RESET} 0"
echo ""

premium_slow "Finalizing network..."
sleep 2

# -------------------------
# FINAL KEY + MESSAGE
# -------------------------
echo -e "${GREEN}key_id = ${KEY}${RESET}"
echo ""
echo -e "${YELLOW}Hay user, ur wifi has been temporarily made."
echo "If your mobile data is off, the VPS will go offline and WiFi too."
echo -e "यदि आपका मोबाइल डेटा बंद है तो वीपीएस बंद हो जाएगा और वाईफाई भी बंद हो जाएगा${RESET}"
echo ""

# -------------------------
# CREDITS
# -------------------------
echo -e "${CYAN}======================================="
echo -e "          © 2025 WISIU System"
echo -e "             All Rights Reserved."
echo -e "${GREEN}  Developed by: tejasprogaming & ayolookhelper${RESET}"
echo -e "${CYAN}=======================================${RESET}"
echo ""
