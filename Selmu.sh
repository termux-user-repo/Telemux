#!/bin/sh
# archfetch.sh - Arch Linux themed system info banner for iSH (Alpine Linux)
# Usage:
#   sh archfetch.sh
# To run automatically on every new terminal, add this line to ~/.profile:
#   sh /path/to/archfetch.sh

USER_NAME=$(whoami)
HOST_NAME=$(hostname 2>/dev/null || cat /etc/hostname 2>/dev/null || echo "ish")
OS_NAME="Alpine Linux $(cat /etc/alpine-release 2>/dev/null)"
KERNEL=$(uname -r)
UPTIME=$(awk '{d=int($1/86400);h=int($1%86400/3600);m=int($1%3600/60);printf "%dd %dh %dm", d,h,m}' /proc/uptime 2>/dev/null)
SHELL_NAME=$(basename "${SHELL:-/bin/sh}")
ARCH=$(uname -m)
PKG_COUNT=$(apk info 2>/dev/null | wc -l | tr -d ' ')
TERM_NAME="${TERM:-iSH}"

CYAN="\033[1;36m"
BOLD="\033[1m"
RESET="\033[0m"

LOGO_FILE=$(mktemp)
INFO_FILE=$(mktemp)
trap 'rm -f "$LOGO_FILE" "$INFO_FILE"' EXIT

{
  printf "%b" "$CYAN"
  cat << 'EOF'
                   -`
                  .o+`
                 `ooo/
                `+oooo:
               `+oooooo:
               -+oooooo+:
             `/:-:++oooo+:
            `/++++/+++++++:
           `/++++++++++++++:
          `/+++ooooooooooooo/`
         ./ooosssso++osssssso+`
        .oossssso-````/ossssss+`
       -osssssso.      :ssssssso.
      :osssssss/        osssso+++.
     /ossssssss/        +ssssooo/-
   `/ossssso+/:-        -:/+osssso+-
  `+sso+:-`                 `.-/+oso:
 `++:.                           `-/+/
 .`                                 `
EOF
  printf "%b" "$RESET"
} > "$LOGO_FILE"

{
  printf "%b\n" "${BOLD}${USER_NAME}${RESET}@${BOLD}${HOST_NAME}${RESET}"
  echo "-------------------"
  printf "%b\n" "${CYAN}OS:${RESET} ${OS_NAME}"
  printf "%b\n" "${CYAN}Kernel:${RESET} ${KERNEL}"
  printf "%b\n" "${CYAN}Uptime:${RESET} ${UPTIME}"
  printf "%b\n" "${CYAN}Shell:${RESET} ${SHELL_NAME}"
  printf "%b\n" "${CYAN}Terminal:${RESET} ${TERM_NAME}"
  printf "%b\n" "${CYAN}Arch:${RESET} ${ARCH}"
  printf "%b\n" "${CYAN}Packages:${RESET} ${PKG_COUNT} (apk)"
} > "$INFO_FILE"

echo
paste "$LOGO_FILE" "$INFO_FILE"
echo
