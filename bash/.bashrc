#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
eval "$(thefuck --alias fuck)"
PS1='[\u@\h \W]\$ '