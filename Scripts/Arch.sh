# Actualización del sistema y paquetes básicos
cd ~/
sudo pacman -Syu
sudo pacman -S --needed git network-manager-applet wget xarchiver gparted htop neofetch fish links man-db ntfs-3g exfatprogs vim plocate ufw android-tools openssh gvfs

# Instalación de yay-bin
echo ---INSTALACIÓN DE yay-bin PARA USAR EL AUR---
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..

yay -S --needed blueman
# i3, polybar, etc.
sudo pacman -S --needed i3 btop polybar arandr keepassxc dunst firefox xfce4-terminal galculator kdenlive lxappearance maim xcolor audacity ristretto xclip mate-polkit mousepad pcmanfm obs-studio pavucontrol libreoffice-fresh picom qbittorrent gimp syncthing torbrowser-launcher xfce4-screensaver nitrogen rofi speech-dispatcher unrar unzip vlc xdotool

# ly display manager
# sudo systemctl enable ly

sudo pacman -S --needed steam

# Creación de varias carpetas
mkdir Artema/ Saves/ Pictures/ Downloads/ Videos/ Music/ Documents/ Torrents/

# TLP
yay -S tlp tlp-rdw

# Mis archivos en GitHub
cd ~/
git clone https://github.com/hibarioath/oathfiles
cd ~/oathfiles/
cp -rfv .config/ .bashrc .vimrc ~/
sudo mkdir /usr/share/themes/ /usr/share/rofi/themes/
sudo cp -rfv nord.rasi /usr/share/rofi/themes/
cd ..


# Dependencias (polybar)
yay -S yad playerctl pacman-contrib

# Fuentes
yay -S --needed noto-fonts-cjk ttf-noto-emoji-monochrome otf-hermit-nerd ttf-ms-fonts

yay -S --needed cava
sudo pacman -S --needed xfburn
yay -S redshifter
sudo pacman -S --needed iwd
yay -S --needed ani-cli
yay -S --needed autotiling-rs-git
yay -S --needed spotdl
yay -S --needed gradience-git
yay -S --needed caffeine-ng
yay -S --needed automounter

# flatpaks
# echo INSTALACIÓN DE flatpak Y VARIOS QUE UTILIZO
# sudo pacman -S --needed flatpak
#flatpak install pcsx2 duckstation dolphinemu kcolorchooser mediawriter vencord hakuneko flatseal libreoffice gradience ungoogledchromium vscodium

# VirtualBox
echo ---INSTALACIÓN DE virtualbox, dkms Y linux-lts-headers NECESARIO PARA MÁQUINAS VIRTUALES---
sudo pacman -S --needed virtualbox dkms linux-lts-headers
# sudo modprober vboxdrv

# Crackling en Pipewire (solución)
sudo echo 2048 > /sys/class/rtc/rtc0/max_user_freq
sudo echo 2048 > /proc/sys/dev/hpet/max-user-freq

# Mis archivos en GitHub
cd ~/
git clone https://github.com/hibarioath/oathfiles
cd oathfiles/
cp -rfv .config/ .vimrc ~/
sudo mkdir /usr/share/themes/ /usr/share/rofi/ /usr/share/rofi/themes
# sudo cp -rfv Groove+/ /usr/share/themes/
sudo cp -rfv nord.rasi /usr/share/rofi/themes/
cd ..

# ufw
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Start TLP
sudo systemctl enable tlp
sudo systemctl start tlp
sudo tlp start
