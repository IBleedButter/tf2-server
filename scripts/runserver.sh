#!/bin/sh

# Attempt to update SteamCMD/TF2
/home/steam/Steam/steamcmd.sh +force_install_dir ~/Steam/tf2/ +login anonymous +app_update 232250 +quit

# Run TF2 server
/home/steam/Steam/tf2/srcds_run -console -game tf +ip 0.0.0.0 -port 27015 +tv_port 27020 -strictportbind -secured -timeout 0 +servercgfile FF_AUTO.cfg +mapcyclefile mapcycle.txt +map arena_donkship_final2 +sv_setsteamaccount ${STEAMTOKEN}
