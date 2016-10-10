# -- Setup -----------------------------------------------------------------------------------------

if [[ $(uname) = "Darwin" ]]; then
	plugins=(git osx z zsh-syntax-highlighting history git-extras)
	ZSH_THEME="kutsan"
	
	export ZSH=/Users/Kutsan/.oh-my-zsh
	export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/"

	# Alias
	alias god="cd ~/Google\ Drive/Digital"

elif [[ $(uname -o) = "Android" ]]; then
   	plugins=(git zsh-syntax-highlighting history)
	ZSH_THEME="kutsan-mobile"
	
	export ZSH=/data/data/com.termux/files/home/.oh-my-zsh
	export PATH="/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets"
fi

source $ZSH/oh-my-zsh.sh

# -- Global Alias ----------------------------------------------------------------------------------

alias zshrc="vim ~/.zshrc"
