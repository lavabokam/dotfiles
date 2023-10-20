#source <(/Users/lava/.nix-profile/bin/starship init zsh --print-full-init)
#alias work='cd /Volumes/work/'
#alias tmux='tmux -S /tmp/lava.tmux'
export EDITOR=nvim
alias vim=nvim
alias hexword="hexdump -v -e '\"%08_ax: \"' -e ' 1/1 \"%08x \" \" \n\"'"
alias phttps="python3 -m http.server"
#
# alias ssh="kitty +kitten ssh"
alias lg=lazygit

source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
source <(/Users/lava/.nix-profile/bin/starship init zsh --print-full-init)
source '/Users/lava/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
