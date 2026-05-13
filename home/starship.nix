{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    
    # Enables integration with Zsh
    enableZshIntegration = true;

    settings = {
      add_newline = false;
      
      format = ''
        $localip$time$directory$git_branch$git_status$status$character
      '';

      git_branch = {
        symbol = "🌱 ";
        truncation_symbol = "";
      };
    };
  };
}
