# tf2-server

## Fetch sources

```Bash
mkdir ~/.build/ ; cd ~/.build/
git clone https://github.com/IBleedButter/tf2-server.git
cd ./tf2-server/
```

## Change stuff

**TF2 server hostname**: is set after Docker image is built, just modify the file `/home/steam/Steam/tf2/tf/cfg/FF_BASE.cfg` with the command `sudo docker run -u steam -i -t tf2-server nano /home/steam/Steam/tf2/tf/cfg/FF_HOSTNAME.cfg`. Don't forget to commit your changes afterwards with `sudo docker ps -a && sudo docker commit ${CONTAINER_ID} tf2-server`!

**RCON password**: is set after Docker image is built, just modify the file `/home/steam/Steam/tf2/tf/cfg/FF_BASE.cfg` with the command `sudo docker run -u steam -i -t tf2-server nano /home/steam/Steam/tf2/tf/cfg/FF_BASE.cfg`. Don't forget to commit your changes afterwards with `sudo docker ps -a && sudo docker commit ${CONTAINER_ID} tf2-server`!

**SM Admins** modify `configs/admins.cfg` before Docker image is built:

```
Admins
        "YourUsername"
        {
                "auth"                  "steam"
                "identity"              "steamID" // https://www.steamidfinder.com/
                "flags"                 "xyz"     // https://wiki.alliedmods.net/Adding_Admins_(SourceMod)#Levels
        }

        "FriendsUsername"
        {
                "auth"                  "steam"
                "identity"              "steamID" // https://www.steamidfinder.com/
                "flags"                 "xyz"     // https://wiki.alliedmods.net/Adding_Admins_(SourceMod)#Levels
        }
}
```

## Build Docker image

```Bash
sudo docker build -t tf2-server .
```

## Run Docker image

*Get your steamtoken [here](https://steamcommunity.com/dev/managegameservers)*

```Bash
sudo docker run -p 27015:27015/tcp -p 27015:27015/udp -p 27020:27020/udp -e STEAMTOKEN=something -i -t tf2-server
```
