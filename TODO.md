Compile all plugins instead of using install.zip

```
mkdir ~/.build/ ; cd ~/.build/

git clone git@github.com:Fortress-Faceoffs/Fortress-Faceoffs-Weapon-Whitelist.git --config core.sshCommand='ssh -o "StrictHostKeyChecking no" -i ~/.ssh/id_ed25519'
git clone git@github.com:Fortress-Faceoffs/Fortress-Faceoffs-Server-Manager.git --config core.sshCommand='ssh -o "StrictHostKeyChecking no" -i ~/.ssh/id_ed25519'
git clone git@github.com:Fortress-Faceoffs/ffupdater.git --config core.sshCommand='ssh -o "StrictHostKeyChecking no" -i ~/.ssh/id_ed25519'
git clone https://github.com/FlaminSarge/tf2attributes.git
git clone https://github.com/nosoop/stocksoup.git
git clone https://github.com/nosoop/SM-TFUtils.git
git clone https://github.com/nosoop/SM-TFEconData.git
git clone https://github.com/sapphonie/sourcemod-nativevotes-updated.git

mkdir ~/.build/sourcemod-curl-extension/ ; cd ~/.build/sourcemod-curl-extension/
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/sourcemod-curl-extension/curl_1.3.0.0_linux.zip
unzip curl_1.3.0.0_linux.zip

cd ~/.build/Fortress-Faceoffs-Weapon-Whitelist/
cp -vr ./scripting/ ~/Steam/tf2/tf/addons/sourcemod/
cd ~/Steam/tf2/tf/addons/sourcemod/scripting/
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/ffweplist.smx" ffweplist.sp

cd ~/.build/Fortress-Faceoffs-Server-Manager/
cp -vr ./configs/ ~/Steam/tf2/tf/addons/sourcemod/
cp -vr ./data/ ~/Steam/tf2/tf/addons/sourcemod/
cp -vr ./gamedata/ ~/Steam/tf2/tf/addons/sourcemod/
cp -vr ./scripting/ ~/Steam/tf2/tf/addons/sourcemod/
cd ~/Steam/tf2/tf/addons/sourcemod/scripting/
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/ffsm.smx" ffsm.sp
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/ffsm_dotd.smx" ffsm_dotd.sp
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/ffsm_mlm.smx" ffsm_mlm.sp

cd ~/.build/ffupdater/
cp -vr ./scripting/ ~/Steam/tf2/tf/addons/sourcemod/
cd ~/Steam/tf2/tf/addons/sourcemod/scripting/
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/ffupdater.smx" ffupdater.sp

cd ~/.build/tf2attributes/
cp -vr ./gamedata/ ~/Steam/tf2/tf/addons/sourcemod/
cp -vr ./scripting/ ~/Steam/tf2/tf/addons/sourcemod/
cd ~/Steam/tf2/tf/addons/sourcemod/scripting/
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/tf2attributes.smx" tf2attributes.sp

mkdir -v ~/Steam/tf2/tf/addons/sourcemod/scripting/include/stocksoup/
cd ~/.build/stocksoup/
cp -vr * ~/Steam/tf2/tf/addons/sourcemod/scripting/include/stocksoup/
rm -v ~/Steam/tf2/tf/addons/sourcemod/scripting/include/stocksoup/{LICENSE,README.md}

cd ~/.build/SM-TFUtils
cp -vr ./gamedata/ ~/Steam/tf2/tf/addons/sourcemod/
cp -vr ./scripting/ ~/Steam/tf2/tf/addons/sourcemod/
cd ~/Steam/tf2/tf/addons/sourcemod/scripting/
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/tf2utils.smx" tf2utils.sp

cd ~/.build/SM-TFEconData/
cp -vr ./gamedata/ ~/Steam/tf2/tf/addons/sourcemod/
cp -vr ./scripting/ ~/Steam/tf2/tf/addons/sourcemod/
cd ~/Steam/tf2/tf/addons/sourcemod/scripting/
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/tf_econ_data.smx" tf_econ_data.sp

cd ~/.build/sourcemod-nativevotes-updated/addons/sourcemod/
cp -vr ./scripting/ ~/Steam/tf2/tf/addons/sourcemod/
cp -vr ./translations/ ~/Steam/tf2/tf/addons/sourcemod/
cd ~/Steam/tf2/tf/addons/sourcemod/scripting/
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/nativevotes.smx" nativevotes.sp
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/nativevotes_mapchooser.smx" nativevotes_mapchooser.sp
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/nativevotes_nominations.smx" nativevotes_nominations.sp
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/nativevotes_rockthevote.smx" nativevotes_rockthevote.sp
./spcomp -w234 -O2 -v2 -i"include" -o"../plugins/nativevotes-basecommands.smx" nativevotes-basecommands.sp

cd ~/.build/sourcemod-curl-extension/
cp -vr ./scripting/ ~/Steam/tf2/tf/addons/sourcemod/
cp -vr ./extensions/ ~/Steam/tf2/tf/addons/sourcemod/
cd ~/Steam/tf2/tf/addons/sourcemod/scripting/
```
