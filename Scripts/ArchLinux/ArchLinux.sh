# Actualización del sistema y paquetes básicos
cd ~/
sudo pacman -Syu
sudo pacman -S --needed git networkmanager network-manager-applet wget xarchiver gparted htop neofetch fish links man-db ntfs-3g exfatprogs vim plocate ufw gvfs

# Instalación de yay-bin
echo ---INSTALACIÓN DE yay-bin PARA USAR EL AUR---
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..

yay -S --needed blueman
# i3, polybar, etc.
sudo pacman -S --needed ly i3 btop polybar keepassxc dunst firefox xfce4-terminal galculator lxappearance maim xcolor xclip mate-polkit mousepad pcmanfm obs-studio pavucontrol libreoffice-fresh picom qbittorrent syncthing xfce4-screensaver nitrogen rofi unrar unzip feh mpv xdotool

# ly display manager
sudo systemctl enable ly

sudo pacman -S --needed steam

# Creación de varias carpetas
mkdir Artema/ Saves/ Pictures/ Downloads/ Videos/ Music/ Documents/ Torrents/

# TLP
yay -S tlp tlp-rdw

# Dependencias (polybar)
# yay -S yad playerctl pacman-contrib

# Fuentes
yay -S --needed noto-fonts-cjk ttf-noto-emoji-monochrome ttf-dejavu-nerd otf-hermit-nerd ttf-ms-fonts

yay -S redshifter
sudo pacman -S --needed iwd
yay -S --needed autotiling-rs-git
# yay -S --needed automounter

# VirtualBox
# echo ---INSTALACIÓN DE virtualbox, dkms Y linux-lts-headers NECESARIO PARA MÁQUINAS VIRTUALES---
# sudo pacman -S --needed virtualbox dkms linux-lts-headers
# sudo modprober vboxdrv

# Crackling en Pipewire (solución)
# sudo echo 2048 > /sys/class/rtc/rtc0/max_user_freq
# sudo echo 2048 > /proc/sys/dev/hpet/max-user-freq

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
