# This file defines the user-level configuration for 'yourusername'

# Arguments are passed from the specialArgs in flake.nix (or implicitly by HM)
{ config, pkgs, nixvimLib, ... }: 
{
  # 1. Basic Home Manager settings
  home.username = "lava";
  home.homeDirectory = "/home/lava";
  home.stateVersion = "25.05"; # Use your current NixOS version
home.packages = with pkgs; [
    # Rust toolchain
    rust-analyzer
    # TypeScript/JavaScript tools
    typescript-language-server # Or use nodePackages.typescript-language-server
    nodejs
    nil # Nix Language Server
    code-cursor-fhs
  ];

home.sessionVariables = {
  EDITOR = "nvim";
};

programs.neovim = {
  enable = true;
  vimAlias = true;
  withNodeJs = true;
  defaultEditor = true;
  plugins = with pkgs.vimPlugins; [
    lazy-nvim
  ];  
  };
}
