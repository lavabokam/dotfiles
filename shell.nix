{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.git
    pkgs.lazygit
    pkgs.zsh

  ];
  shellHook = ''
    echo "Start Developing..."
  '';
}
