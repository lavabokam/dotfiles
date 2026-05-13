# Mac Dotfiles with Nix-Darwin and Home Manager

This repository contains my declarative macOS configuration.

## Requirements

1. macOS on Apple Silicon (aarch64-darwin)
2. Nix installed with flakes enabled

If you don't have Nix installed:
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## Installation & Activation

Since this is the first time setting up `nix-darwin` on this machine, you can bootstrap it directly from the flake:

```bash
# Inside the dotfiles directory
nix run nix-darwin -- switch --flake .

# Note: The system activation requires root privileges.
# If prompted, provide your password or run:
# sudo nix run nix-darwin -- switch --flake .
```

If it complains about the hostname, ensure the hostname in `flake.nix` matches the output of `scutil --get LocalHostName`.

If it complains about experimental features being disabled when running with `sudo`, use this expanded command:

```bash
nix run --extra-experimental-features "nix-command flakes" nix-darwin -- switch --flake .

# If it says it requires root:
sudo nix run --extra-experimental-features "nix-command flakes" nix-darwin -- switch --flake .
```

## Subsequent Updates

Once installed, the `darwin-rebuild` command will be available in your PATH. To apply new changes:

```bash
darwin-rebuild switch --flake .
```

## What this manages

- **System Options**: Basic macOS defaults and Nix daemon settings (`darwin/default.nix`)
- **Zsh**: Aliases, environment variables, and Nix sourcing (`home/zsh.nix`)
- **Tmux**: Keybindings, Vi mode, splits, and pane navigation (`home/tmux.nix`)
- **Git**: Aliases, settings, and a global pre-commit hook (`home/git.nix`)
- **Starship**: Shell prompt formatting (`home/starship.nix`)
- **Packages**: `coreutils`, `lazygit`, `ripgrep`, `fd`, `vim`

## Previous NixOS Config

The `nixos/` directory remains untouched and continues to function for the Linux machines.
