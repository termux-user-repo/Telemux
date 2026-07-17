apk update && apk add neofetch w3m nmap && cat > ~/kalifetch.sh << 'SCRIPT'
#!/bin/sh
RED="\033[1;31m"; GREEN="\033[1;32m"; CYAN="\033[1;36m"; BOLD="\033[1m"; RESET="\033[0m"
clear
printf "%b\n\n" "${RED}${BOLD}=====================================
        KALI LINUX (iSH build)
=====================================${RESET}"
attempts=0
while [ $attempts -lt 3 ]; do
  printf "%b" "${CYAN}kali login: ${RESET}"; read login_name
  printf "%b" "${CYAN}Password: ${RESET}"; stty -echo; read login_pass; stty echo; printf "\n"
  [ "$login_name" = "kali" ] && [ "$login_pass" = "kali" ] && break
  attempts=$((attempts+1)); printf "%b\n" "${RED}Login incorrect${RESET}"
done
[ $attempts -ge 3 ] && { printf "%b\n" "${RED}Too many failed attempts.${RESET}"; exit 1; }
clear
printf "%b\n\n" "${GREEN}${BOLD}Welcome to Kali Linux (iSH edition)${RESET}"
command -v neofetch >/dev/null 2>&1 && neofetch --ascii_distro kali
echo
printf "%b\n" "${BOLD}Tools menu (real, text-based — GUI apps can't run in iSH):${RESET}"
echo "  1) w3m   - text-based web browser (google.com etc.)"
echo "  2) nmap  - network scanner"
echo "  3) exit"
printf "%b" "${CYAN}Select: ${RESET}"; read choice
case "$choice" in
  1) w3m google.com ;;
  2) nmap -sV localhost ;;
  *) echo "Bye." ;;
esac
SCRIPT
chmod +x ~/kalifetch.sh && ~/kalifetch.sh
