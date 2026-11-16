{ ... }:

{
  programs.waybar = {
    enable = true;

    systemd.enable = false;
  };

  xdg.configFile = {
    "waybar/config.jsonc".source = ./waybar/config.jsonc;
    "waybar/style.css".source = ./waybar/style.css;
  };
}