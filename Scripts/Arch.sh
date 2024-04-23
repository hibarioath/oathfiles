# Actualización del sistema y paquetes básicos
cd ~/
sudo pacman -Syu
sudo pacman -S --needed git wget xarchiver cowsay gparted htop neofetch fish links ly man-db ntfs-3g exfatprogs vim plocate sl ufw android-tools iwd openssh

# Instalación de yay-bin
echo -INSTALACIÓN DE yay-bin-
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..

# i3, polybar, etc.
sudo pacman -S --needed i3 polybar capitaine-cursors baobab arandr keepassxc dunst firefox kitty links galculator kdenlive lxappearance maim xcolor xclip mate-polkit mousepad nemo nemo-fileroller obs-studio pavucontrol picom qbittorrent ristretto gimp syncthing torbrowser-launcher wine python-pywal xfce4-screensaver nitrogen rofi speech-dispatcher unrar unzip vlc xdotool xterm

# ly display manager
sudo systemctl enable ly

# Steam
echo INSTALACIÓN DE steam
sudo pacman -S --needed steam

# Creación de varias carpetas
mkdir Imágenes/ Descargas/ Vídeos/ Música/ Documentos/ ISOs\ SSD/ Wallpaper/ Scripts/ Torrents/

# Mis archivos en GitHub
git clone https://github.com/hibarioath/oathfiles
cd oathfiles/
cp -rfv .config/ .bashrc .vimrc Scripts/ Wallpaper/ ~/
sudo mkdir /usr/share/themes/ /usr/share/rofi/themes/
sudo cp -rfv Groove+/ /usr/share/themes/
sudo cp -rfv nord.rasi /usr/share/rofi/themes/
sudo cp -rfv Hermit/ /usr/share/fonts/
cd ..

# Fuentes
echo VARIAS FUENTES QUE UTILIZO
yay -S --needed ttf-linux-libertine ttf-inconsolata ttf-comic-sans ttf-ms-fonts

# Xfburn
echo INSTALACIÓN DE xfburn
sudo pacman -S --needed xfburn

# iwd
INSTALACIÓN DE iwd
sudo pacman -S --needed iwd

# MEGA Y ani-cli
yay -S --needed megasync-bin
yay -S --needed ani-cli
# flatpaks
echo INSTALACIÓN DE flatpak Y VARIOS QUE UTILIZO
sudo pacman -S --needed flatpak
flatpak install pcsx2 duckstation dolphinemu kcolorchooser mediawriter vencord hakuneko flatseal libreoffice gradience ungoogled-chromium vscodium

# VirtualBox
echo INSTALACIÓN DE virtualbox, dkms Y linux-lts-headers -necesario para máquinas virtuales-
sudo pacman -S --needed virtualbox dkms linux-lts-headers
sudo modprober vboxdrv

# Crackling en Pipewire (solución)
echo 2048 > /sys/class/rtc/rtc0/max_user_freq
echo 2048 > /proc/sys/dev/hpet/max-user-freq

# Mis archivos en GitHub
git clone https://github.com/hibarioath/oathfiles
cd oathfiles/
cp -rfv .config/ .bashrc .vimrc Scripts/ Wallpaper/ ~/
sudo mkdir /usr/share/themes/ /usr/share/rofi/ /usr/share/rofi/themes
sudo cp -rfv Groove+/ /usr/share/themes/
sudo cp -rfv nord.rasi /usr/share/rofi/themes/
cd ..

# ufw
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
