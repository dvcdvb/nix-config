{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # ------------------------------------------------------------
  # Boot
  # ------------------------------------------------------------

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ------------------------------------------------------------
  # Netzwerk
  # ------------------------------------------------------------

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # ------------------------------------------------------------
  # Region und Sprache
  # ------------------------------------------------------------

  time.timeZone = "Europe/Zurich";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_CH.UTF-8";
    LC_IDENTIFICATION = "de_CH.UTF-8";
    LC_MEASUREMENT = "de_CH.UTF-8";
    LC_MONETARY = "de_CH.UTF-8";
    LC_NAME = "de_CH.UTF-8";
    LC_NUMERIC = "de_CH.UTF-8";
    LC_PAPER = "de_CH.UTF-8";
    LC_TELEPHONE = "de_CH.UTF-8";
    LC_TIME = "de_CH.UTF-8";
  };

  console.keyMap = "sg";

  # ------------------------------------------------------------
  # X11 und GDM
  # ------------------------------------------------------------

  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;

  # GNOME bleibt als alternative Session verfügbar
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "ch";
    variant = "de_nodeadkeys";
  };

  # ------------------------------------------------------------
  # Audio
  # ------------------------------------------------------------

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # ------------------------------------------------------------
  # Drucken
  # ------------------------------------------------------------

  services.printing.enable = true;

  # ------------------------------------------------------------
  # Benutzer
  # ------------------------------------------------------------

  users.users.fabio = {
    isNormalUser = true;
    description = "Fabio";

    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
    ];
  };

  # ------------------------------------------------------------
  # SwayFX
  # ------------------------------------------------------------

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
  };


  # ------------------------------------------------------------
  # Flakes
  # ------------------------------------------------------------

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # ------------------------------------------------------------
  # Programme
  # ------------------------------------------------------------


  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    # Terminal
    foot

    # Bar
    waybar

    # Launcher
    wofi
    
    # Tools
    vscode

    # Git
    git

    # Netzwerk
    networkmanagerapplet

    # Polkit
      (pkgs.symlinkJoin {
    name = "polkit-gnome-agent";
    paths = [ pkgs.polkit_gnome ];
    postBuild = ''
      mkdir -p $out/bin
      ln -s $out/libexec/polkit-gnome-authentication-agent-1 \
        $out/bin/polkit-gnome-authentication-agent-1
    '';
  })

    # Notifications
    mako
    libnotify

    # Wallpaper
    swaybg

    # Lock und Idle
    swayidle
    swaylock

    # Screenshots
    grim
    slurp

    # Clipboard
    wl-clipboard

    # Audio
    pavucontrol
    pamixer

    # Media
    playerctl

    # Helligkeit
    brightnessctl

    # Tools
    jq

    # Themes
    papirus-icon-theme
    adwaita-icon-theme
    catppuccin-gtk

    # Fonts
    nerd-fonts.jetbrains-mono
  ];

  # ------------------------------------------------------------
  # Fonts
  # ------------------------------------------------------------

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # ------------------------------------------------------------
  # GTK
  # ------------------------------------------------------------

  environment.sessionVariables = {
    GTK_THEME = "Catppuccin-Mocha-Standard-Blue-Dark";
    XCURSOR_SIZE = "24";
  };

  # ------------------------------------------------------------
  # Nixpkgs
  # ------------------------------------------------------------

  nixpkgs.config.allowUnfree = true;

  # ------------------------------------------------------------
  # NixOS Version
  # ------------------------------------------------------------

  system.stateVersion = "25.11";
}
