#source <($HOME/.nix-profile/bin/starship init zsh --print-full-init)
eval "$($HOME/.nix-profile/bin/starship init zsh)"
#alias work='cd /Volumes/work/'
alias tmux='tmux -S /tmp/lava.tmux'
alias hexword="hexdump -v -e '\"%08_ax: \"' -e ' 1/1 \"%08x \" \" \n\"'"
alias phttps="python3 -m http.server"
# alias nxs="nix-shell --verbose --pure --command zsh"

#nix-shell --pure /Volumes/work/dotfiles/default.nix --run zsh
#export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix
