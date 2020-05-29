#!/usr/bin/env bash

set -e

BOLD='\033[1m'
DIM='\e[2m'
RED='\033[0;31m'
NC='\033[0m'

function print_error {
    printf "%s%s%s\n" "${RED}" "${1}" "${NC}"
}

# $1 = NAME
# $2 = DESCRIPTION
# $n = additional parameters
function print_banner {
    printf "\n\n"
    printf "%s[%sInstalling %s]%s" "${BOLD}" "${NC}${DIM}" "${NC}${BOLD}${1}" "${NC}"
    if [ $# -gt 1 ]; then
        for(( i=2; i<=$#; i++ )); do
            printf "\n- %s" "${!i}"
        done
    fi
}

function already_installed {
    printf "\n\n%sAlready installed:%s\n" "${BOLD}" "${NC}"
    cat "$MARKER_DIRECTORY/$1"
}

function finish_install {
    MARKER_FILE=$MARKER_DIRECTORY/$1
    date > "$MARKER_FILE"
    if [ $# -gt 1 ]; then
        for(( i=2; i<=$#; i++ )); do
            printf "%s\n" "${!i}" >> "$MARKER_FILE"
        done
    fi
    printf "\n%sInstallation finished - %s\n" "${BOLD}" "${1}${NC}"
}

function check_status {
    printf "\n\n"
    printf "  _    _ _                 _           __  ___   ___  _  _      _____      _               \n"
    printf " | |  | | |               | |         /_ |/ _ \ / _ \| || |    / ____|    | |              \n"
    printf " | |  | | |__  _   _ _ __ | |_ _   _   | | (_) | | | | || |_  | (___   ___| |_ _   _ _ __  \n"
    printf " | |  | | '_ \| | | | '_ \| __| | | |  | |> _ <| | | |__   _|  \___ \ / _ \ __| | | | '_ \ \n"
    printf " | |__| | |_) | |_| | | | | |_| |_| |  | | (_) | |_| |  | |    ____) |  __/ |_| |_| | |_) |\n"
    printf "  \____/|_.__/ \__,_|_| |_|\__|\__,_|  |_|\___(_)___/   |_|   |_____/ \___|\__|\__,_| .__/ \n"
    printf "                                                                                    | |    \n"
    printf "                                                                                    |_|    "

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
        printf "\n%sWill be installed:%s" "${BOLD}" "${NC}"
        for SCRIPT in "${NOT_INSTALLED[@]}"; do
            printf "\n-$SCRIPT"
        done

        printf "\n"
    fi

    if [[ ${#INSTALLED[@]} -gt 0 ]]; then
        printf "\n%sAlready installed:%s" "${BOLD}" "${NC}"
        for SCRIPT in "${INSTALLED[@]}"; do
            printf "\n-%s" "$SCRIPT"
        done
        printf "\n"
    fi

    printf "\n"

    if [[ ${#NOT_INSTALLED[@]} -eq 0 ]]; then
        printf "\nNothing to do here...\n"
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