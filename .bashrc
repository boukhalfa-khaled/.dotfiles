#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

## pacman
alias i='doas pacman -S' 
alias r='doas pacman -R'
alias q='doas pacman -Ss'
alias u='doas pacman -Syu'

## AUR
alias yi='yay -S'
alias yr='yay -R'
alias yq='yay -Ss'
alias yu='yay -Syu'

## General
alias vim='nvim'
alias vi='nvim'
alias ll='ls -Al'

## Postgresql 
alias postgres='doas su - postgres'

# php sail 
alias sail='./vendor/bin/sail'

## enable vim mode in terminal
set -o vi
## ranger stay in current directory bad bractis i guess but do the job
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rnager='ranger'
alias clock='tty-clock -ct'
alias countdown='ttytimer '

alias graph='git log --all --decorate --oneline --graph'
echo -ne "\e[2 q"

PS1="\[\e[36m\]\W \[\e[31m\]|\[\e[m\] "

# node version manager
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
