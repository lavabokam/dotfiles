{
  description = "Lava's Nix-Darwin and Home Manager Flake";

  inputs = {
    # Core package set
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # nix-darwin for system configuration
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager for user environment and dotfiles
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, darwin, home-manager, ... }:
    let
      system = "aarch64-darwin";
      username = "lava";
      hostname = "Lavas-MacBook-Pro";
    in {
      # darwinConfigurations expects the machine hostname as the attribute name
      darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
        inherit system;
        
        # Pass inputs to modules if needed
        specialArgs = { inherit inputs username hostname; };

        modules = [
          # Main system configuration
          ./darwin/default.nix

          # Home Manager configuration as a nix-darwin module
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs username; };
            home-manager.users.${username} = import ./home/default.nix;
          }
        ];
      };

      # Keep the devShell output for backwards compatibility with shell.nix usage
      devShells.${system}.default = let pkgs = import nixpkgs { inherit system; }; in
        import ./shell.nix { inherit pkgs; };
    };
}
