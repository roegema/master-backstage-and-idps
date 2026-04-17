#!/bin/bash

# Colors
readonly COLOR_NC="\e[0m"
readonly COLOR_RED="\e[1;31m"
readonly COLOR_GREEN="\e[0;32m"
readonly COLOR_YELLOW="\e[1;33m"
readonly COLOR_BLUE="\e[1;34m"
readonly COLOR_MAGENTA="\e[1;35m"
readonly COLOR_CYAN="\e[1;36m"

#-----------------------------------------------------------------
# FUNCTIONS
#-----------------------------------------------------------------
function SetTopHeading() {
  printf $COLOR_MAGENTA
  echo -e ""
  echo -e "========================================================================================="
  echo -e "${1^^}"
  echo -e "========================================================================================="
  printf $COLOR_NC
}
function SetHeading() {
  printf $COLOR_YELLOW
  echo -e ""
  echo -e "----------------------------------------------------------------------------------------"
  echo -e "${1}"
  echo -e "----------------------------------------------------------------------------------------"
  printf $COLOR_NC
}
function SetComment() {
  printf $COLOR_GREEN
  echo -e "* ${1}"
  printf $COLOR_NC
}
function SetComment2() {
  echo -e "  - ${1}"
}
function SetComment3() {
  echo -e "    -> ${1}"
}
function SetDebug() {
  if [ "${DEBUG_ON}" == "yes" ]; then
    printf $COLOR_BLUE
    echo -e "[DEBUG] ${1}"
    printf $COLOR_NC
  fi
}
function SetError() {
  printf $COLOR_RED
  echo -e "[ERROR] ${1}"
  printf $COLOR_NC
}
function SetWarning() {
  printf $COLOR_YELLOW
  echo -e "[WARNING] ${1}"
  printf $COLOR_NC
}
function SetInfo() {
  echo -e "[INFO] ${1}"
}
