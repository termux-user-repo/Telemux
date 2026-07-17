#!/bin/bash

# ANSI Color Codes
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Loading sequence function
loading_animation() {
    local spinner=('|' '/' '-' '\')
    echo -ne "${GREEN}Loading... "
    for i in {1..12}; do
        printf "\b${spinner[$((i%4))]}"
        sleep 0.1
    done
    echo -e " [${GREEN}!LODED${NC}]"
    sleep 0.5
}

# Clear and display
clear
echo -e "${GREEN}"
echo "  SELMUX.SH BETA"
echo "  ██████  ███████ ██      ███    ███ ██    ██"
echo " ██      ██      ██      ████  ████ ██    ██"
echo "  █████  █████   ██      ██ ████ ██ ██    ██"
echo "      ██ ██      ██      ██  ██  ██ ██    ██"
echo " ██████  ███████ ███████ ██      ██  ██████"
echo -e "  SELMUX.SH BETA${NC}"
echo ""

# Execute loading animation
loading_animation

echo -e "${CYAN}Platform:${NC} iSH"
echo -e "${CYAN}Language:${NC} TR"
echo ""
echo -e "[1] 🌐 IP Locator"
echo -e "[2] 📍 GeoLocation"
echo -e "[3] 🌍 DNS Lookup"
echo -e "[4] 📡 Ping Test"
echo -e "[5] 🖥️ System Info"
echo ""
