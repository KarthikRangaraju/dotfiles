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
source ~/dotfiles/zsh/key_bindings.sh

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

# Start tmux session for every new tab. 
tmux
