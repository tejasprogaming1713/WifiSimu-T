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
# PREMIUM WISIU INTRO
# -------------------------
banner() {
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
echo -e "${CYAN}To run auto-install next time use: ${GREEN}run wifi.sh${RESET}"
echo ""
}

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

# 5–10% random error simulation
random_error() {
    if (( RANDOM % 12 == 0 )); then
        echo -e "${RED}SYSTEM ERROR: Temporary WiFi conflict detected.${RESET}"
        echo -e "${YELLOW}Retrying setup...${RESET}"
        sleep 2
    fi
}

# -------------------------
# MENU 2 - Extra Tools
# -------------------------
menu2() {
while true; do
    echo -e "${CYAN}=============================="
    echo -e "        EXTRA TOOLS MENU"
    echo -e "==============================${RESET}"
    echo -e "${BLUE}1) Scan WiFi"
    echo "2) Connect WiFi"
    echo "3) Generate Password"
    echo "4) Return to Main Menu${RESET}"
    echo ""
    read -p "Choose option: " opt2
    echo ""
    case $opt2 in
        1)
            echo -e "${CYAN}[✓] Searching nearby WiFi networks...${RESET}"
            sleep 1
            echo -e "› Found: AirTel_5G"
            sleep 1
            echo -e "› Found: JioFiber_XT"
            sleep 1
            echo -e "› Found: TP-Link_1234"
            sleep 1
            echo -e "${GREEN}[✔] Scan Complete!${RESET}\n"
            ;;
        2)
            read -p "Enter WiFi Name to Connect: " WIFI
            echo -e "${YELLOW}Connecting to $WIFI ...${RESET}"
            sleep 2
            echo -e "${GREEN}[✔] Connected Successfully (Simulation)${RESET}\n"
            ;;
        3)
            PASS=$(echo $RANDOM | md5sum | head -c 12)
            echo -e "${CYAN}Generated Password: ${GREEN}$PASS${RESET}\n"
            ;;
        4)
            break
            ;;
        *)
            echo -e "${RED}Invalid Option!${RESET}\n"
            ;;
    esac
done
}

# -------------------------
# MAIN MENU
# -------------------------
main_menu() {
while true; do
    banner
    echo -e "${CYAN}=============================="
    echo -e "        CHOOSE WIFI"
    echo -e "==============================${RESET}"
    echo -e "${GREEN}0) Exit"
    echo "(1) TEMP IDX WIFI"
    echo "(2) TEMP GITHUB WIFI"
    echo "(3) TEST WIFI"
    echo "(4) PANEL WIFI"
    echo "(5) PREMIUM WIFI (PAID)"
    echo -e "(6) ADMIN WIFI"
    echo "(7) EXTRA TOOLS MENU${RESET}"
    echo ""
    read -p "TYPE A NUMBER HERE → " CH
    echo ""

    if [[ "$CH" == "0" ]]; then
        echo -e "${YELLOW}Exiting WISIU... Bye!${RESET}"
        exit 0
    fi

    premium_slow "Starting setup..."
    random_error & spinner

    case $CH in
        1|2|3|4|5|6)
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
            echo -e "${GREEN}key_id = ${KEY}${RESET}"
            echo ""
            echo -e "${YELLOW}Hay user, ur wifi has been temporarily made."
            echo "If your mobile data is off, the VPS will go offline and WiFi too."
            echo -e "यदि आपका मोबाइल डेटा बंद है तो वीपीएस बंद हो जाएगा और वाईफाई भी बंद हो जाएगा${RESET}"
            echo ""
            ;;
        7)
            menu2
            ;;
        *)
            echo -e "${RED}Invalid Option!${RESET}\n"
            ;;
    esac
done
}

# -------------------------
# RUN MAIN MENU
# -------------------------
main_menu
