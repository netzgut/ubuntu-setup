#!/usr/bin/env bash

set -e

BOLD='\033[1m'
DIM='\e[2m'
RED='\033[0;31m'
NC='\033[0m'

function print_error {
    echo -e "${RED}${BOLD}${1}${NC}"
}

# $1 = NAME
# $2 = DESCRIPTION
# $n = additional parameters
function print_banner {
    echo -e "\n"
    echo -e "${BOLD}[${NC}${DIM}Installing ${NC}${BOLD}${1}]${NC}"
    if [ $# -gt 1 ]; then
        for(( i=2; i<=$#; i++ )); do
            echo "- ${!i}"
        done
    fi
}

function already_installed {
    echo -e "\n\n${BOLD}Already installed:${NC}"
    cat "$MARKER_DIRECTORY/$1"
}

function finish_install {
    MARKER_FILE=$MARKER_DIRECTORY/$1
    date > "$MARKER_FILE"
    if [ $# -gt 1 ]; then
        for(( i=2; i<=$#; i++ )); do
            echo -ne "${!i}" >> "$MARKER_FILE"
        done
    fi
    echo -e "\n${BOLD}Installation finished - ${1}${NC}"
}

function check_status {
    echo -e "\n"
    echo "  _    _ _                 _           __  ___   ___  _  _      _____      _               "
    echo " | |  | | |               | |         /_ |/ _ \ / _ \| || |    / ____|    | |              "
    echo " | |  | | |__  _   _ _ __ | |_ _   _   | | (_) | | | | || |_  | (___   ___| |_ _   _ _ __  "
    echo " | |  | | '_ \| | | | '_ \| __| | | |  | |> _ <| | | |__   _|  \___ \ / _ \ __| | | | '_ \ "
    echo " | |__| | |_) | |_| | | | | |_| |_| |  | | (_) | |_| |  | |    ____) |  __/ |_| |_| | |_) |"
    echo "  \____/|_.__/ \__,_|_| |_|\__|\__,_|  |_|\___(_)___/   |_|   |_____/ \___|\__|\__,_| .__/ "
    echo "                                                                                    | |    "
    echo "                                                                                    |_|    "

    INSTALLED=()
    NOT_INSTALLED=()

    for SCRIPT in "$@"; do
        MARKER_FILE=$MARKER_DIRECTORY/$SCRIPT
        if [ -f "$MARKER_FILE" ]; then
            INSTALLED+=( "$SCRIPT" )
        else
            NOT_INSTALLED+=( "$SCRIPT" )
        fi
    done

    if [[ ${#NOT_INSTALLED[@]} -gt 0 ]]; then
        echo -e "\n${BOLD}Will be installed:${NC}"
        for SCRIPT in "${NOT_INSTALLED[@]}"; do
            echo -e "- $SCRIPT"
        done
        echo ""
    fi

    if [[ ${#INSTALLED[@]} -gt 0 ]]; then
        echo -e "\n${BOLD}Already installed:${NC}"
        for SCRIPT in "${INSTALLED[@]}"; do
            echo "- $SCRIPT"
        done
    fi

    if [[ ${#NOT_INSTALLED[@]} -eq 0 ]]; then
        echo -e "\nNothing to do here..."
        exit 0
    fi


    read -r -p "Do you want to proceed? [Y/n]" response
    response=${response,,} # tolower
    if [[ $response == "n" ]]; then
        exit 0
    fi
}

function run_scripts {
    for SCRIPT in "$@"; do
        SCRIPT_LOCATION="$PWD/scripts/${SCRIPT}.sh"
        [[ -f $SCRIPT_LOCATION ]] || (print_error "Script '${SCRIPT_LOCATION}' not found" && exit -1)
        . $SCRIPT_LOCATION
    done
}

function cleanup {
    sudo apt-get autoremove \
    && sudo apt-get autoclean
}