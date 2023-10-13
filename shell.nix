{ pkgs ? import <nixpkgs> {} }:
mkShell {
  buildInputs = [
    git
    lazygit
    zsh
  ];
  shellHook = ''
    echo "Start Developing..."
  '';
}
