{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Your Name";       # <-- CHANGE
    userEmail = "you@example.com"; # <-- CHANGE
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      core.editor = "nvim";
    };
  };
}
