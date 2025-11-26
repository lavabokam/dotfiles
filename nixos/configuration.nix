{ modulesPath, config, pkgs, lib, ... }: {
  imports = [ "${modulesPath}/virtualisation/amazon-image.nix" ];
  ec2.efi = true;
  networking.hostName = "lava01";
  time.timeZone = "Asia/Kolkata";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.extra-sandbox-paths = ["/nix/var/cache/sccache"];

  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    coreutils
    wget
    curl
    gnutar
    gzip
    vim
    git
    htop
    tmux
    unzip
    rust-analyzer
    gcc
    python3
    openssl
    pkg-config
  ];
  users.users.lava = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" ];
    packages = with pkgs; [
      lazygit
      ripgrep
      fd
    ];
  };
  

  services.code-server = {
    enable = true;
    user = "lava";
    port =  7890;
    host = "127.0.01";
    hashedPassword = "$argon2i$v=19$m=4096,t=3,p=1$NFVnV0xaSzlkTGo0aWVuY3FKN1c0WWZFWHFNPQ$3fOChtFo6Npc+FpaT2dKFC5qA9Hbz1zlamg3/WyN5IY";
    extraPackages = with pkgs; [ cargo rust-analyzer python3 ripgrep fd git ];
  };
  services.caddy = {
    enable = true;
    email = "lava@dheyo.ai";
    virtualHosts."lava01.dheyo.ai".extraConfig = ''
	reverse_proxy  127.0.0.1:7890
    '';
  };

  services.postgresql = {
     enable = true;
     ensureDatabases = ["dwardb"];
     authentication = pkgs.lib.mkOverride 10 ''
          local all all trust
          host all all 127.0.0.1/32 trust
          host all all ::1/128 trust
        '';
   };
  services.redis.servers.dwar = {
  enable = true;
  port = 6379;
#  user = "lava";
#  group = "lava";
};

  networking.firewall.allowedTCPPorts = [ 443 8080 ]; 
  security.sudo.wheelNeedsPassword = false;
  systemd.tmpfiles.rules = [
    "d /nix/var/cache/sccache 0770 lava  nixbld -"
  ];
  
  system.stateVersion = "25.05";
}
