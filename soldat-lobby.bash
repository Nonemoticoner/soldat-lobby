#!/usr/bin/env bash

###############################################################
# Bash Interface for Soldat Lobby HTTP API
# Authored by: Nonemoticoner
# Soldat Lobby API docs: https://wiki.soldat.pl/index.php/Lobby_HTTP_API
# Guide to this Bash script: https://github.com/Nonemoticoner/soldat-lobby
# Required libs: jq (https://stedolan.github.io/jq/)
###############################################################

BASE_API_URL="http://api.soldat.pl/v0"

# Error messages
PARSE_ERROR_MSG="Parse error! Check if arguments were written correctly!"
CMD_ERROR_MSG="Parse error! Check if command was written correctly!"

# Variables
command="-"
ip="-"
port="-"

# loop through arguments
while [ $# -gt 0 ]
do
    ## GET THE ARGUMENTS
    # get IP from arguments
    if [ $1 = "--ip" ]
    then
        # shift to next argument
        shift

        # check if next argument exists
        if [ -z $1 ]
        then
            echo $PARSE_ERROR_MSG
        else
            ip=$1
        fi

    # get port from arguments
    elif [ $1 = "--port" ]
    then
        # shift to next argument
        shift

        # check if next argument exists
        if [ -z $1 ]
        then
            echo $PARSE_ERROR_MSG
        else
            port=$1
        fi
    else
        command=$1
    fi

    shift
done

## PRINT OUT DESIRED DATA
url="${BASE_API_URL}/server/${ip}/${port}"

if [ $command = "version" ]
then
    version="$(curl -s "$url" | jq ".Version")"
    echo $version
elif [ $command = "numplayers" ]
then
    numplayers="$(curl -s "$url" | jq ".NumPlayers")"
    echo $numplayers
elif [ $command = "players" ]
then
    players="$(curl -s "$url/players" | jq ".Players" | jq ".[]")"

    for player in $players
    do
        echo $player
    done
else
    echo "Unknown action command!"
fi
