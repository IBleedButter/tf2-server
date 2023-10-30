# tf2-server

## Fetch sources

```Bash
mkdir ~/.build/ ; cd ~/.build/
git clone https://github.com/IBleedButter/tf2-server.git
cd ./tf2-server/
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
