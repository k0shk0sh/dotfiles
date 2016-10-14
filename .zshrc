# -- Setup -----------------------------------------------------------------------------------------

if [[ $(uname) = "Darwin" ]]; then
	plugins=(git tmux osx z zsh-syntax-highlighting)
	ZSH_THEME="kutsan"

	export ZSH=/Users/Kutsan/.oh-my-zsh
	export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/"

	# Alias
	alias god="cd ~/Google\ Drive/Digital"

elif [[ $(uname -o) = "Android" ]]; then
   	plugins=(git tmux zsh-syntax-highlighting)
	ZSH_THEME="kutsan-mobile"
	
	export ZSH=/data/data/com.termux/files/home/.oh-my-zsh
	export PATH="/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets"

elif [[ $(uname) = "Linux" ]]; then
   	plugins=(git tmux osx z zsh-syntax-highlighting)
	ZSH_THEME="kutsan"
fi

# Tmux
ZSH_TMUX_AUTOSTART=true
export TERM="xterm-256color"

source $ZSH/oh-my-zsh.sh

# -- Global Alias ----------------------------------------------------------------------------------

alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias :q="exit"
alias h="history"
