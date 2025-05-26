#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

. /usr/share/nvm/init-nvm.sh

export PATH="$PATH:/home/ridho/scripts:/home/ridho/.local/bin"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init -)"
eval "$(oh-my-posh init bash --config /home/ridho/.config/ohmyposh/EDM115-newline.omp.json)"
