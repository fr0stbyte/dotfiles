
export GTAGSLABEL=pygments

export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

export EDITOR=/usr/local/bin/vim
#export JAVA_HOME="`/usr/libexec/java_home -v '1.8*'`"

[[ -e /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion

[[ -e ~/.bash_aliases ]] && source ~/.bash_aliases

[[ -e ~/dev/src/ops-config/bin/roller_functions.bash ]] && source ~/dev/src/ops-config/bin/roller_functions.bash

PS1="\u:\h \w>"


export WORKON_HOME=~/envs/
source /usr/local/bin/virtualenvwrapper.sh
#source $(brew --prefix nvm)/nvm.sh

#limits
ulimit -n 6144

#gpg
export GPG_TTY=$(tty)
GPG_AGENT=$(which gpg-agent)
if [ -f ${GPG_AGENT} ]; then
  . ~/.bash.gpg
fi
