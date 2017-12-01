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
elif [ $command = "maxplayers" ]
then
    maxplayers="$(curl -s "$url" | jq ".MaxPlayers")"
    echo $maxplayers
elif [ $command = "numbots" ]
then
    numbots="$(curl -s "$url" | jq ".NumBots")"
    echo $numbots
elif [ $command = "bonusfreq" ]
then
    bonusfreq="$(curl -s "$url" | jq ".BonusFreq")"
    echo $bonusfreq
elif [ $command = "respawn" ]
then
    respawn="$(curl -s "$url" | jq ".Respawn")"
    echo $respawn
elif [ $command = "connectiontype" ]
then
    connectiontype="$(curl -s "$url" | jq ".ConnectionType")"
    echo $connectiontype
elif [ $command = "numplayers" ]
then
    numplayers="$(curl -s "$url" | jq ".NumPlayers")"
    echo $numplayers
elif [ $command = "dedicated" ]
then
    dedicated="$(curl -s "$url" | jq ".Dedicated")"
    echo $dedicated
elif [ $command = "realistic" ]
then
    realistic="$(curl -s "$url" | jq ".Realistic")"
    echo $realistic
elif [ $command = "private" ]
then
    private="$(curl -s "$url" | jq ".Private")"
    echo $private
elif [ $command = "survival" ]
then
    survival="$(curl -s "$url" | jq ".Survival")"
    echo $survival
elif [ $command = "advanced" ]
then
    advanced="$(curl -s "$url" | jq ".Advanced")"
    echo $advanced
elif [ $command = "wm" ]
then
    wm="$(curl -s "$url" | jq ".WM")"
    echo $wm
elif [ $command = "ac" ]
then
    ac="$(curl -s "$url" | jq ".AC")"
    echo $ac
elif [ $command = "name" ]
then
    name="$(curl -s "$url" | jq ".Name")"
    echo $name
elif [ $command = "country" ]
then
    country="$(curl -s "$url" | jq ".Country")"
    echo $country
elif [ $command = "info" ]
then
    info="$(curl -s "$url" | jq ".Info")"
    echo $info
elif [ $command = "currentmap" ]
then
    currentmap="$(curl -s "$url" | jq ".CurrentMap")"
    echo $currentmap
elif [ $command = "os" ]
then
    os="$(curl -s "$url" | jq ".OS")"
    echo $os
elif [ $command = "gamestyle" ]
then
    gamestyle="$(curl -s "$url" | jq ".GameStyle")"
    echo $gamestyle
elif [ $command = "ip" ]
then
    ip="$(curl -s "$url" | jq ".IP")"
    echo $ip
elif [ $command = "port" ]
then
    port="$(curl -s "$url" | jq ".Port")"
    echo $port
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
