# Lines configured by zsh-newuser-install
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jaan/.zshrc'

# End of lines added by compinstall
#
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz promptinit
promptinit
prompt suse

export PATH=$PATH:~/.local/bin
export SUDO_ASKPASS=~/scripts/dpass.sh
alias dot="cd ~/.dotfiles/"
alias ls='ls --color=auto'
alias tmux='tmux -2'
alias mpvc='mpv -vo=drm'
#TODO add file preview. fzf already uses find in backend so reduntant?
alias se='vim -c "cd %:p:h" "$(find scripts .dotfiles repos/suckless repos/projects -type f | grep -v -F ".git/" | fzf --prompt="edit " --layout reverse --preview "head -n 50 {1}")"'
alias si='pacman -Slq | fzf --layout reverse --prompt="install " --multi --preview-window wrap --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
alias sr='pacman -Qqe | fzf --layout reverse --prompt="remove " --multi --preview-window wrap --preview "pacman -Qi {1}" | xargs -ro sudo pacman -Rns'


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#edit commands in vim
autoload -z edit-command-line 
zle -N edit-command-line
bindkey "^X^E" edit-command-line

#GIT integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{#9D0507}%b@%r%f'
zstyle ':vcs_info:*' enable git

#syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
