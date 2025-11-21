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
    echo "(6) ADMIN WIFI"
    echo "(7) EXTRA TOOLS MENU${RESET}"
    echo ""
    read -p "TYPE A NUMBER HERE → " CH
    echo ""

    if [[ "$CH" == "0" ]]; then
        echo -e "${YELLOW}Exiting WISIU... Bye!${RESET}"
        exit 0
    fi

    case $CH in
        1|2|3|4|5|6)
            # Run WiFi simulation
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
            sleep 150   # Wait 2.5 minutes before clearing
            clear
            ;;
        7)
            menu2
            ;;
        *)
            echo -e "${RED}Invalid Option!${RESET}\n"
            sleep 2
            clear
            ;;
    esac
  done
}
