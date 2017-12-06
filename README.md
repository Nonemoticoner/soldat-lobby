# soldat-lobby
Bash command-line interface for Soldat Lobby HTTP API

## Usage
```
usage: soldat-lobby [action] [options]

Bash command-line interface for Soldat Lobby HTTP API

actions:
    help           Print a guide to this CLI
    version        Version of Soldat
    maxplayers     Maximum number of players
    numbots        Number of bots
    bonusfreq      Bonus frequency
    respawn        Respawn time
    connectiontype ID of connection type
    numplayers     Number of players on server
    dedicated      Is dedicated server?
    realistic      Is Realistic game mode on?
    private        Is private server?
    survival       Is Survival game mode on?
    advanced       Is Advanced game mode on?
    wm             Is Weapon Mode applied?
    ac             Is Anti Cheat on?
    name           Name of a server
    country        Country where server is located
    info           Information about server
    currentmap     Currently played map
    os             Server's Operating System
    gamestyle      Game Style played on server
    ip             IP of a server
    port           Port of a server
    players        List of players currently playing

options:
    --ip <IP>      Provides an IP of a server
    --port <port>  Provides a port of a server

example usage:
    soldat-lobby version --ip 127.0.0.1 --port 27073
    "1.7.1"

```

## Prerequisited
The following libraries should be available in the `$PATH`:
* [curl](https://github.com/curl/curl)
* [jq](https://github.com/stedolan/jq)

## License
[MIT](https://github.com/Nonemoticoner/soldat-lobby/blob/master/LICENSE)
