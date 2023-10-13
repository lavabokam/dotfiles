{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell  {
  name = "lava-shell";
  src = ./.;
  packages = with pkgs; [
    git
    lazygit
    zsh
    bash
    vim
    locale
    coreutils
  ];
  env = {
    NIXIFIED = "TRUE";
  };
  shellHook = ''
    zsh -i 
    ech "Start Developing..." $SHELL
    export NIXIFIED=TRUE 
    alias work='cd /Volumes/work/'
    alias tmux='tmux -S /tmp/lava.tmux'
    alias hexword="hexdump -v -e '\"%08_ax: \"' -e ' 1/1 \"%08x \" \" \n\"'"
    alias phttps="python3 -m http.server"
    eval "$(starship init zsh)"
    source <(starship init zsh --print-full-init)
  '';
    #source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
}
