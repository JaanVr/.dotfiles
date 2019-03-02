#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export PATH=$PATH:~/.local/bin
export SUDO_ASKPASS=~/scripts/dpass.sh
alias dot="cd ~/.dotfiles/"
alias ls='ls --color=auto'
alias tmux='tmux -2'
eval "$(thefuck --alias fuck)"
PS1='[\u@\h \W]\$ '
#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi
