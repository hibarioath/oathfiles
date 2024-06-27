{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-75bdd38f-2129-4d45-ac46-68edfc15f2ec".device = "/dev/disk/by-uuid/75bdd38f-2129-4d45-ac46-68edfc15f2ec";
  networking.hostName = "nixoath"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;
networking.wireless.iwd.enable = false;
  networking.wireless.iwd.settings = {
    IPv6 = {
      Enabled = true;
    };
    Settings = {
      AutoConnect = true;
    };
  };
#networking.networkmanager.wifi.backend = "iwd";

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_ES.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  #Hyprland 
  programs.hyprland.enable = false;
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

services.xserver.displayManager.lightdm.enable = false;

#Paquetes que no quiero de GNOME
environment.gnome.excludePackages = (with pkgs; [
gnome-photos
snapshot
gedit 
gnome-connections 
gnome-tour
gnome-text-editor
]) ++ (with pkgs.gnome; [
gnome-keyring
yelp
gnome-software
gnome-contacts
gnome-font-viewer
gnome-maps
vinagre
gnome-maps
gnome-logs
simple-scan
gnome-system-monitor 
cheese # webcam tool
  gnome-music
  gnome-terminal
  epiphany # web browser
  totem # video player
  tali # poker game
  iagno # go game
  hitori # sudoku game
  atomix # puzzle game
]);

  # Enable KDE Plasma (6)
services.displayManager.sddm.enable = false;
services.desktopManager.plasma6.enable = false;
#Paquetes que no quiero en Plasma
environment.plasma6.excludePackages = with pkgs.kdePackages; [
kwalletmanager
kwallet
oxygen 
];

  # Enable i3wm
 services.xserver.windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
alacritty
arandr
autotiling
cinnamon.nemo
cinnamon.nemo-fileroller
dunst
feh
i3lock
lxappearance
mate.mate-polkit
picom
polybar        
redshift
rofi
unclutter
xclip
maim
xdotool
     ];
    };

# AutoLogin en i3
#services.xserver.windowManager.default = "none+i3";

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "es";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "es";

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hibari = {
    isNormalUser = true;
    description = "hibari";
    extraGroups = [ "networkmanager" "wheel" "vboxusers" "libvirtd" ];
packages = with pkgs; [
#android-tools
#ani-cli
#audacity
#base16-schemes
btop
#bunnyfetch
fastfetch
#flatpak
fish
freetube
#geany
gimp
git
#gnome-extension-manager
#gnome.gnome-tweaks
#gparted
#gradience
htop
kdePackages.kdenlive
keepassxc
#kiwix
#libreoffice-fresh
librewolf
#lutris
mediawriter
ncdu
#nodejs_22
obs-studio
#owofetch
pavucontrol
#pcsx2
pfetch
#pridefetch
pywal
qbittorrent
#gnome.quadrapassel
#sassc
screenkey
spotdl
syncthing
#universal-android-debloater
rhythmbox
tldr
#tor-browser
#trash-cli
#uwufetch
vim
vlc
#vscodium
wget
#wofi
#xarchiver
#unzip
#unrar
#xorg.xinit
#xorg.xev
yt-dlg
    ];
  };

fonts.packages = with pkgs; [ nerdfonts noto-fonts-cjk-serif ];

# Virt-manager
virtualisation.libvirtd.enable = true;
programs.virt-manager.enable = false;
virtualisation.virtualbox.host.enable = true;
virtualisation.virtualbox.host.enableExtensionPack = false;

# Activar el servicio de flatpak.
services.flatpak.enable = true;

# flatpak pero en i3?? COMENTAR SI SE VA A UTILIZAR GNOME
#xdg.portal = {
#enable = true;
#extraPortals= [
#pkgs.xdg-desktop-portal-gtk ];
#};

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "hibari";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  programs.firefox.enable = false;

# Steam // Como necesitan acceso al sistema, lo hacemos así en vez de simplemente
# añadirlos a la lista de programas
programs.steam.enable = true;
programs.steam.gamescopeSession.enable = true;
programs.gamemode.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
	environment.systemPackages = with pkgs; [
];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

  # Firewall
networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 80 443 ];
  allowedUDPPortRanges = [
    { from = 4000; to = 4007; }
    { from = 8000; to = 8010; }
  ];
};

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

# Enable OpenGL
  hardware.graphics = {
    enable = true;
    #driSupport = true;
    enable32Bit = true;
  };

services.tlp = {
      enable = false;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

       #Optional helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      };
};

powerManagement.powertop.enable = false;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

}
