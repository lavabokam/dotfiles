ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(tmux git ag)

# vim: syntax=zsh
if [[ -o interactive ]]; then
  export HISTSIZE=2000
  export HISTFILE=~/.zsh_history
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8

  export UID=`id -u`

  source /local/tools/installs/setup/zshrc_4.8.0_simple
  # uncomment one of the tool bundles below
  # module load sw
  #  module load dv/l.dv1sw
  # module load hw
  #module load dv/l.dv1hw

  setopt ignore_eof
  setopt no_sharehistory
  setopt nullglob

  alias h='history'
  alias l='less'
  alias rm='rm -i'
  alias mv='mv -i'
  alias cp='cp -i'
  alias c='clear'
  alias ll='ls -l --color'
  alias lt='ls -ltr --color'
  alias ls='ls -sF --color'
  alias ssh='ssh -X'
  alias grep='egrep --colour -i'
  alias tmux='tmux -S /tmp/lava.tmux'
  alias worka='cd /auto/worka/${USER}'
  alias hexword="hexdump -v -e '\"%08_ax: \"' -e ' 1/1 \"%08x \" \" \n\"'"
  alias phttps="python3 -m http.server"
fi
source $ZSH/oh-my-zsh.sh
export PATH=$HOME/.cargo/bin:$PATH
