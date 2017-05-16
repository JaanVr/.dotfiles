#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias dot="cd ~/.dotfiles/"
alias ls='ls --color=auto'
eval "$(thefuck --alias fuck)"
PS1='[\u@\h \W]\$ '
