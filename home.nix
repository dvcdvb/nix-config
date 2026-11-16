{ config, pkgs, ... }:

{
  home.username = "fabio";
  home.homeDirectory = "/home/fabio";

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}