{ ... }:

{
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