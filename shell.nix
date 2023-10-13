with (import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-23.05.tar.gz") {} );
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
