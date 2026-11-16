{ pkgs, ... }:

{
  home.username = "fabio";
  home.homeDirectory = "/home/fabio";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;

    settings = {
      user.name = "dvcdvb";
      user.email = "75753443+dvcdvb@users.noreply.github.com";

      init.defaultBranch = "main";
      pull.rebase = false;
      core.editor = "code --wait";
    };
  };
}