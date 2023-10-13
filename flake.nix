{
  description = "teknots flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
  };
  outputs = { self, nixpkgs, flake-utils  }: 
    flake-utils.lib.eachDefaultSystem(system:
      let 
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = {
          default = pkgs.callPackage ./shell.nix { pkgs = pkgs; };
        };
      }
    );   
}
