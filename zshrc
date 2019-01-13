
export ZSH="/Users/lava/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git colored-man colorize pip python brew osx zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias gs="git status" 
alias p4s="p4 status"
alias cdt="cd /Volumes/workspace/t1/sw" 

export PATH=$PATH:/opt/bin:~/.local/bin:/Volumes/workspace/t1/sw/convergence/src/dv/estimator/build

export P4PORT=10.10.20.10:1666
export P4USER=lava
export P4EDITOR=vim
export P4CONFIG=.p4config
export P4DIFF=p4merge

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

