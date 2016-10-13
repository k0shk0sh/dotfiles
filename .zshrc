# -- Setup -----------------------------------------------------------------------------------------

if [[ $(uname) = "Darwin" ]]; then
	plugins=(git tmux osx z zsh-syntax-highlighting history git-extras)
	ZSH_THEME="kutsan"

	export ZSH=/Users/Kutsan/.oh-my-zsh
	export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/"

	# Alias
	alias god="cd ~/Google\ Drive/Digital"

	# Tmux
	ZSH_TMUX_AUTOSTART=true

elif [[ $(uname -o) = "Android" ]]; then
   	plugins=(git zsh-syntax-highlighting history)
	ZSH_THEME="kutsan-mobile"
	
	export ZSH=/data/data/com.termux/files/home/.oh-my-zsh
	export PATH="/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets"

	# Tmux
	if [[ -z "$TMUX" ]]
	then
	    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`"
	    if [[ -z "$ID" ]]
	    then
	        tmux new-session
	    else
	        tmux attach-session -t "$ID"
	    fi
	fi

elif [[ $(uname) = "Linux" ]]; then
   	plugins=(git tmux osx z zsh-syntax-highlighting history git-extras)
	ZSH_THEME="kutsan"
fi

source $ZSH/oh-my-zsh.sh

# -- Global Alias ----------------------------------------------------------------------------------

alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias :q="exit"
