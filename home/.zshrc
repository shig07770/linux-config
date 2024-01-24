plugins=(git)
ZSH_THEME="agnoster"

# Add timestamps to history entries
HIST_STAMPS="%d/%m/%Y"

# Load Oh My zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# get access to variables like $XDG_PROGRAMMING_DIR
source ~/.config/user-dirs.dirs

# pipx: add to $PATH
export PATH="$PATH:$HOME/.local/bin"

# Flutter: add to $PATH
export PATH="$PATH:$XDG_PROGRAMMING_DIR/.flutter/bin"

# Flutter: define $CHROME_EXECUTABLE
export CHROME_EXECUTABLE="/usr/bin/chromium"

# nvm: define $NVM_DIR
export NVM_DIR="$XDG_PROGRAMMING_DIR/.nvm"

# nvm: load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# nvm: load nvm bash completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias l='ls -l'
alias ll='ls -la'
