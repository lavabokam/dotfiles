#source <(/Users/lava/.nix-profile/bin/starship init zsh --print-full-init)
#alias work='cd /Volumes/work/'
#alias tmux='tmux -S /tmp/lava.tmux'
#alias hexword="hexdump -v -e '\"%08_ax: \"' -e ' 1/1 \"%08x \" \" \n\"'"
#alias phttps="python3 -m http.server"

source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
nix shell -i -v 'github:lavajnv/dotfiles'
