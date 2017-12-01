#!/usr/bin/env bash

###############################################################
# Bash Interface for Soldat Lobby HTTP API
# Authored by: Nonemoticoner
# Soldat Lobby API docs: https://wiki.soldat.pl/index.php/Lobby_HTTP_API
# Guide to this Bash script: https://github.com/Nonemoticoner/soldat-lobby
# Required libs: jq (https://stedolan.github.io/jq/)
###############################################################

## GUIDE
guide=''
guide+="usage: soldat-lobby [action] [options]\n"
guide+="\n"
guide+="Bash command-line interface for Soldat Lobby HTTP API \n"
guide+="\n"
guide+="actions:\n"
guide+="    help           Print a guide to this CLI\n"
guide+="    version        Version of Soldat\n"
guide+="    maxplayers     Maximum number of players\n"
guide+="    numbots        Number of bots\n"
guide+="    bonusfreq      Bonus frequency\n"
guide+="    respawn        Respawn time\n"
guide+="    connectiontype ID of connection type\n"
guide+="    numplayers     Number of players on server\n"
guide+="    dedicated      Is dedicated server?\n"
guide+="    realistic      Is Realistic game mode on?\n"
guide+="    private        Is private server?\n"
guide+="    survival       Is Survival game mode on?\n"
guide+="    advanced       Is Advanced game mode on?\n"
guide+="    wm             Is Weapon Mode applied?\n"
guide+="    ac             Is Anti Cheat on?\n"
guide+="    name           Name of a server\n"
guide+="    country        Country where server is located\n"
guide+="    info           Information about server\n"
guide+="    currentmap     Currently played map\n"
guide+="    os             Server's Operating System\n"
guide+="    gamestyle      Game Style played on server\n"
guide+="    ip             IP of a server\n"
guide+="    port           Port of a server\n"
guide+="    players        List of players currently playing\n"
guide+="\n"
guide+="options:\n"
guide+="    --ip <IP>      Provides an IP of a server\n"
guide+="    --port <port>  Provides a port of a server\n"
guide+="\n"
guide+="example usage:\n"
guide+="    soldat-lobby version --ip 127.0.0.1 --port 27073\n"
guide+="    \"1.7.1\"\n"
guide+="\n"

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
elif [ $command = "guide" ] || [ $command = "help" ]
then
    echo -e "$guide"
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
