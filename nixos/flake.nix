{
  description = "A reproducible NixOS system configuration";

  inputs = {
    # 1. Core package set (NixOS)
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Use 'nixos-23.11' for stable

    # 2. Home Manager (for user configurations)
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    
    # Optional: Add any other custom inputs here (e.g., nixvim)
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
  let
    # --- Define variables for easy maintenance ---
    # 💥 CHANGE HERE: Specify the ARM64 Linux architecture
    system = "aarch64-linux"; 
    
    username = "lava"; 
    hostname = "lava01"; 
    pkgs = import nixpkgs {
       inherit system;
       config.allowUnfree = true;

    };
  in
  {
    # Define the main NixOS configuration for this host
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system; # Now specifies "aarch64-linux"
      
      # specialArgs are optional arguments passed to all modules
      specialArgs = {
        inherit inputs;
        inherit username hostname;
      };

      # The list of configuration modules to combine
      modules = [
        # 1. The path to your EXISTING configuration.nix
        ./configuration.nix 
        
        # 2. Home Manager NixOS Module
        home-manager.nixosModules.home-manager
        {
          home-manager.users.${username} = {
            imports = [
               nixvim.homeManagerModules.nixvim
              ./home-lava.nix 
            ];
            home.stateVersion = "25.05"; 
          };
        }
      ];
    };
  };
}
