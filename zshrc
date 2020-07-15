export PATH=$HOME/bin:/usr/local/bin:$PATH:/auto/tools/installs/cadence/xtensa/8.0.8/XtDevTools/install/tools/RI-2018.0-linux/XtensaTools/bin/

export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8 
# export TOT=/auto/proj/lava/z/
# export PATH=$PATH:/$TOT/sw/convergence_dv1.1/bldr/
export PATH=$PATH:/users/lava/.local/bin/
export ZSH="/users/lava/.oh-my-zsh"
export DISPLAY=vnc01:5
export ZSH_DISABLE_COMPFIX=true
export DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_THEME="robbyrussel"

export P4DIFF=vimdiff
export P4MERGE=vimdiff
export P4IGNORE=.p4ignore
alias hexword="hexdump -v -e '\"%08_ax: \"' -e ' 1/1 \"%08x \" \" \n\"'"
alias cdt="cd /auto/proj/lava/z"
alias cdv="cd /auto/proj/lava/z/sw/convergence_dv1.1"
alias cde="cdv && cd src/dv/estimator/bld"
alias gs="git status"
alias phttps="python -m SimpleHTTPServer"
bindkey -v
plugins=(tmux git )
export SHELL=/usr/bin/zsh
source /auto/tools/setup/zshrc_4.2.1


module load tmux/2.8
module load nodejs/12.16.1
module load alias
module load generic
module load cscope/15.9 
source $ZSH/oh-my-zsh.sh
module load cmake/3.13.0 gcc/9.1.0 ctags ninja python/3.7.4
module load sw
module load git/2.26.0

eval $(ssh-agent)
ssh-add

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
