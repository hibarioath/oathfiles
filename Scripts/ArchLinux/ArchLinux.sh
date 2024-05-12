# Actualización del sistema y paquetes básicos
cd ~/
sudo pacman -Syu
sudo pacman -S --needed git networkmanager network-manager-applet wget xarchiver gparted htop neofetch fish links man-db ntfs-3g exfatprogs vim plocate unclutter ufw

# Instalación de yay-bin
echo ---INSTALACIÓN DE yay-bin PARA USAR EL AUR---
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..

# i3, polybar, etc.
sudo pacman -S --needed i3 polybar keepassxc dunst firefox alacritty galculator lxappearance maim xcolor xclip mate-polkit pcmanfm pavucontrol libreoffice-fresh picom qbittorrent syncthing xss-lock unrar unzip feh mpv xdotool

# Creación de varias carpetas
mkdir Artema/ Saves/ Pictures/ Downloads/ Videos/ Music/ Documents/ Torrents/

# TLP
yay -S tlp tlp-rdw

# Fuentes
yay -S --needed noto-fonts-cjk ttf-noto-emoji-monochrome ttf-dejavu-nerd otf-hermit-nerd ttf-ms-fonts

yay -S redshifter
yay -S --needed autotiling-rs-git

# sudo pacman -S --needed virtualbox dkms linux-lts-headers
# sudo modprober vboxdrv

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
