{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    
    settings = {
      user = {
        name = "Lava Kumar";
        email = "lavajnv@gmail.com"; # Update with your preferred email
      };
      core = {
        hooksPath = "~/.config/git/hooks";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
    };
  };

  # Set up global git hooks
  xdg.configFile."git/hooks/pre-commit" = {
    executable = true;
    text = ''
      #!/bin/sh
      branch="$(git rev-parse --abbrev-ref HEAD)"

      if [ "$branch" = "master" ]; then
        echo "F**K Offff, You can't commit directly to master branch"
        exit 1
      fi
    '';
  };
}
