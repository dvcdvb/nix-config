{ ... }:

{
  imports = [
    ./home/programs/git.nix
    ./home/programs/foot.nix
    ./home/programs/waybar.nix
    ./home/programs/sway.nix
  ];

  home.username = "fabio";
  home.homeDirectory = "/home/fabio";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}