{ ... }:

{
  imports = [
    ./home/programs/git.nix
    ./home/programs/foot.nix
  ];

  home.username = "fabio";
  home.homeDirectory = "/home/fabio";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}