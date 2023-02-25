# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Set the nix path
   nix.nixPath = [ "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixpkgs" "nixos-config=/home/hk/.config/nix/configuration.nix" "/nix/var/nix/profiles/per-user/root/channels" ]; 
   
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the desktop environment.
  services.xserver.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.displayManager = { 
    defaultSession = "none+bspwm"; 
    setupCommands = ''
    my_laptop_external_monitor=$(${pkgs.xorg.xrandr}/bin/xrandr --query | grep 'DP-3 connected')
    if [[ $my_laptop_external_monitor = *connected* ]]; then
      ${pkgs.xorg.xrandr}/bin/xrandr --output DP-3 --primary --mode 3440x1440 --rate 100 --output eDP-1 --off
    else
      ${pkgs.xorg.xrandr}/bin/xrandr --output eDP-1 --mode 1920x1200 --rate 60
    fi
    '';
    lightdm = { 
      enable = true; 
      greeter.enable = true; 
    }; 
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Configure coneclole keymap
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  nixpkgs.config.pulseaudio = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput = { 
    enable = true;
    touchpad = {
      disableWhileTyping = true;
      sendEventsMode = "disabled-on-external-mouse";
    };
  };

  programs.fish.enable = true;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hk = {
    isNormalUser = true;
    description = "Tyler Gregg";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
       # App Dependencies
    cargo
    gcc
    ripgrep
    
    # Xorg
    xorg.xbacklight

    # Global Apps
    wget
    firefox
    google-chrome
    neovim
    sumneko-lua-language-server
    feh
    blueman
    geany
    git
    lazygit
    neofetch
    bat
    exa
    htop
    galculator
    vlc
    stow
    xfce.xfce4-power-manager
    arandr 
    gh


    # Desktop Environment
    polybar
    alacritty
    sxhkd
    picom
    pavucontrol
    xclip
    rofi
    dunst
    zathura
    portfolio
    flameshot
    nitrogen
    i3lock-color
    kitty
    fish

    # Theming
    qogir-theme
    papirus-icon-theme

    # Files
    unzip
    ranger
    ueberzug
    udiskie
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
  ];
  
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  nixpkgs.config.packagesOverrides = pkgs: {
    polybar = pkgs.polybar.override {
      jackSupport = true;
      alsaSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
      iwSupport = true;
      nlSupport = true;
    };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
  system.stateVersion = "22.11"; # Did you read the comment?

}
