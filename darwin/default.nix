{ pkgs, username, ... }:

{
  # System settings
  system.stateVersion = 4; # Don't change this
  
  # Declare the primary user for user-specific settings managed by nix-darwin
  system.primaryUser = username;

  # Fix for Nix build user group ID mismatch
  ids.gids.nixbld = 350;

  # Nix settings
  nix = {
    enable = true;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      # allow unfree packages
      # accept-flake-config = true;
    };
    # Garbage collection
    gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 0; Minute = 0; };
      options = "--delete-older-than 30d";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Shell configuration
  # Add zsh to allowed shells
  environment.shells = [ pkgs.bashInteractive pkgs.zsh ];

  # Zsh is the default shell
  programs.zsh.enable = true;
  
  # System packages
  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  # User setup
  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
    shell = pkgs.zsh;
  };

  # Custom Launchd service for Qdrant
  launchd.user.agents.qdrant = {
    serviceConfig = {
      ProgramArguments = [ "${pkgs.qdrant}/bin/qdrant" ];
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/tmp/qdrant.out.log";
      StandardErrorPath = "/tmp/qdrant.err.log";
      EnvironmentVariables = {
        QDRANT__STORAGE__STORAGE_PATH = "/Users/${username}/.qdrant-data";
        # Without this, qdrant resolves ./snapshots relative to its working
        # directory, which may be the read-only Nix store
        QDRANT__STORAGE__SNAPSHOTS_PATH = "/Users/${username}/.qdrant-data/snapshots";
      };
    };
  };

  # Custom Launchd service for PostgreSQL
  launchd.user.agents.postgresql = {
    serviceConfig = {
      ProgramArguments = [
        "${pkgs.writeShellScript "postgres-start" ''
          set -e
          DATADIR="/Users/${username}/.postgres-data"
          if [ ! -s "$DATADIR/PG_VERSION" ]; then
            ${pkgs.postgresql}/bin/initdb -D "$DATADIR"
          fi
          exec ${pkgs.postgresql}/bin/postgres -D "$DATADIR"
        ''}"
      ];
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/tmp/postgresql.out.log";
      StandardErrorPath = "/tmp/postgresql.err.log";
    };
  };
}
