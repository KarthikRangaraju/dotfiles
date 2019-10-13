# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# See also https://github.com/Falkor/dotfiles/blob/master/oh-my-zsh/
export DEFAULT_USER="$USER"

plugins=(
git
tmuxinator
vi-mode
zsh-autosuggestions
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Tmuxinator configurations
export EDITOR='vim'
export DISABLE_AUTO_TITLE=true

# Custom keybindings
function git_prepare() {
if [ -n "$BUFFER" ];
then
BUFFER="git add -A; git commit -m \"$BUFFER\" && git push origin $(git rev-parse --abbrev-ref HEAD)"
fi

if [ -z "$BUFFER" ];
then
BUFFER="git add -A; git commit -v && git push origin $(git rev-parse --abbrev-ref HEAD)"
fi

zle accept-line
}
zle -N git_prepare
bindkey "^g" git_prepare

function goto_home() {
BUFFER="cd ~/"$BUFFER
zle end-of-line
zle accept-line
}
zle -N goto_home
bindkey "^h" goto_home

function left_arrow() {
BUFFER="back"$BUFFER
zle end-of-line
zle accept-line
}
        zle -N left_arrow
        bindkey "^H" left_arrow

function right_arrow() {
BUFFER="forward"$BUFFER
zle end-of-line
zle accept-line
}
zle -N right_arrow
bindkey "^L" right_arrow

# Aliases
alias ls="ls -AG"
alias mux="tmuxinator"

# Navigation like browser
export BACK_HISTORY=""
export FORWARD_HISTORY=""

function cd {
    BACK_HISTORY=$PWD:$BACK_HISTORY
    FORWARD_HISTORY=""
    builtin cd "$@"
    ls -A;
}

function back {
    DIR=${BACK_HISTORY%%:*}
    if [[ -d "$DIR" ]]
    then
        BACK_HISTORY=${BACK_HISTORY#*:}
        FORWARD_HISTORY=$PWD:$FORWARD_HISTORY
        builtin cd "$DIR"
    fi
}

function forward {
    DIR=${FORWARD_HISTORY%%:*}
    if [[ -d "$DIR" ]]
    then
        FORWARD_HISTORY=${FORWARD_HISTORY#*:}
        BACK_HISTORY=$PWD:$BACK_HISTORY
        builtin cd "$DIR"
    fi
}


# Fuzzy finder 
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g "" 2> /dev/null'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -l -g "" 2> /dev/null'

# Disable Ctrl+d from exiting the shell. It's typically used for going down while reading text.
setopt ignore_eof

# If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event). This helps with fzf history search not being cluttered too much
setopt HIST_IGNORE_ALL_DUPS

# Start tmux session for every new tab. 
tmux

