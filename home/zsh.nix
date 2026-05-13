{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Aliases ported from existing zshrc / shellHook
    shellAliases = {
      work = "cd /Volumes/work/";
      tmux = "tmux -S /tmp/lava.tmux";
      hexword = "hexdump -v -e '\"%08_ax: \"' -e ' 1/1 \"%08x \" \" \\n\"'";
      phttps = "python3 -m http.server";
    };

    # Environment variables
    sessionVariables = {
      EDITOR = "vim";
      NIXIFIED = "TRUE";
    };

    # Extra init code ported from zshrc
    initContent = ''
      # Nix initialization
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
    '';
  };
}
