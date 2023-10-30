FROM ubuntu:latest

ARG STEAMCMD_URL="https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"
ARG MMSOURCE_URL="https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1153-linux.tar.gz"
ARG SOURCEMOD_URL="https://sm.alliedmods.net/smdrop/1.11/sourcemod-1.11.0-git6945-linux.tar.gz"

# Install dependencies
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get --yes upgrade
RUN apt-get --yes install curl wget git openssh-client nano unzip gcc-multilib lib32z1 libncurses5:i386 libbz2-1.0:i386 lib32gcc-s1 lib32stdc++6 libtinfo5:i386 libcurl4-gnutls-dev libcurl3-gnutls:i386 libsdl2-2.0-0:i386

# Create Steam user & group
RUN groupadd --system steam
RUN useradd --create-home --home-dir /home/steam/ --gid steam --shell /bin/bash --system steam

USER steam
WORKDIR /home/steam/Steam/

# Install SteamCMD
RUN curl "${STEAMCMD_URL}" | tar --verbose --gzip --extract --file=- --directory=/home/steam/Steam/

# Install TF2 server
RUN /home/steam/Steam/steamcmd.sh +force_install_dir /home/steam/Steam/tf2/ +login anonymous +app_update 232250 +quit

# Install MetaMod: Source
RUN curl --url "${MMSOURCE_URL}" | tar --verbose --gzip --extract --file=- --directory=/home/steam/Steam/tf2/tf/

# Install SourceMod
RUN curl --url "${SOURCEMOD_URL}" | tar --verbose --gzip --extract --file=- --directory=/home/steam/Steam/tf2/tf/

# Copy configuration files
COPY --chown=steam:steam ./configs/motd.txt /home/steam/Steam/tf2/tf/cfg/motd.txt
COPY --chown=steam:steam ./configs/maplist.txt /home/steam/Steam/tf2/tf/cfg/maplist.txt
COPY --chown=steam:steam ./configs/mapcycle.txt /home/steam/Steam/tf2/tf/cfg/mapcycle.txt
COPY --chown=steam:steam ./configs/admins.cfg /home/steam/Steam/tf2/tf/addons/sourcemod/configs/admins.cfg
COPY --chown=steam:steam --chmod=744 ./scripts/runserver.sh /home/steam/Steam/tf2/runserver.sh

# Download maps
COPY --chown=steam:steam ./maps/maplist.txt /home/steam/maplist.txt
RUN wget --input-file=/home/steam/maplist.txt --directory-prefix=/home/steam/Steam/tf2/tf/maps/

# Download FF plugins - skip this if you don't already know what this URL is 
RUN curl --url ${INSTALLER_URL} --output /home/steam/Steam/tf2/tf/install.zip
RUN unzip -o /home/steam/Steam/tf2/tf/install.zip -d /home/steam/Steam/tf2/tf/

# Expose TF2, RCON and STV ports
EXPOSE 27015/udp
EXPOSE 27015/tcp
EXPOSE 27020/udp

# Run TF2 server
CMD ["/home/steam/Steam/tf2/runserver.sh"]
