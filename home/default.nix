{ pkgs, username, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix
    ./git.nix
    ./starship.nix
  ];

  # Basic settings
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "24.05"; # Match current HM version or whatever is appropriate

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install in the user profile
  home.packages = with pkgs; [
    coreutils
    lazygit
    ripgrep
    fd
    locale
    bash
    wget
    qdrant
    vscode
  ];
}
