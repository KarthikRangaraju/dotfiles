# up
	function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
	bindkey "^u" up_widget

# git
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

# home
	function goto_home() { 
		BUFFER="cd ~/"$BUFFER
		zle end-of-line
		zle accept-line
	}
	zle -N goto_home
	bindkey "^h" goto_home

# Enable Ctrl-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

