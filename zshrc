
export ZSH="/Users/lava/.oh-my-zsh"
ZSH_THEME="af-magic"
plugins=(git colorize pip python brew osx )
source $ZSH/oh-my-zsh.sh

alias gs="git status" 
alias p4s="p4 status"
alias cdt="cd /Volumes/workspace/t1/sw" 
alias cde="cd /Volumes/workspace/t1/sw/convergence/src/dv/estimator/bld" 

alias bld="mkdir -p bld && cd bld && cmake  .. && bld "

export PATH=$PATH:/usr/local/bin:/opt/bin:~/.local/bin:/Volumes/workspace/t1/sw/convergence/src/dv/estimator/build

export P4PORT=10.10.20.10:1666
export P4USER=lava
export P4EDITOR=vim
export P4CONFIG=.p4config
export P4DIFF=p4merge

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# alias tmux="tmux -CC"
alias ec="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c --socket-name ~/.email.d/server/server"
alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
# if [ -e ~/.emacs.d/server/server ]
# then
# else
#     /Applications/Emacs.app/Contents/MacOS/Emacs --daemon
# fi
