#Fix PipeWire crackling on VMs
sudo cp /usr/share/pipewire/pipewire.conf /etc/pipewire/
mkdir -p ~/.config/wireplumber/main.lua.d
cp /usr/share/wireplumber/main.lua.d/50-alsa-config.lua ~/.config/wireplumber/main.lua.d
sed -i "s/\[\"api.alsa.period-size\"\] = [[:digit:]]*/\[\"api.alsa.period-size\"\] = 1024/" ~/.config/wireplumber/main.lua.d/50-alsa-config.lua
sed -i "s/\[\"api.alsa.headroom\"\] = [[:digit:]]*/\[\"api.alsa.headroom\"\] = 8192/" ~/.config/wireplumber/main.lua.d/50-alsa-config.lua
#Fix PipeWire crackling with Fiefox (espacially in VMs)
sed -i "s/reader.parse-on-load.enabled\", true/reader.parse-on-load.enabled\", false/" $(find ~/.mozilla/firefox/ -name prefs.js)
sed -i "s/media.webspeech.synth.enabled\", true/media.webspeech.synth.enabled\", false/" $(find ~/.mozilla/firefox/ -name prefs.js)
systemctl --user restart wireplumber pipewire pipewire-pulse
