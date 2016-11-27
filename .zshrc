ZSH_THEME='kutsan'

plugins=(
	tmux
	z
	zsh-syntax-highlighting
	vi-style
	zsh-autosuggestions
)

if [[ $(uname) = 'Darwin' ]]; then
	export ZSH=/Users/$(whoami)/.oh-my-zsh
	export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/'
	export GPG_TTY=$(tty) # For GPG

elif [[ $(uname -o) = 'Android' ]]; then
	export ZSH=/data/data/com.termux/files/home/.oh-my-zsh
	export PATH='/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets'

elif [[ $(uname) = 'Linux' ]]; then
	export ZSH=/home/$(whoami)/.oh-my-zsh
fi

# -- Plugins ---------------------------------------------------------------------------------------

# tmux
ZSH_TMUX_AUTOSTART=true
export TERM='xterm-256color' # For right colors

# vi-style
bindkey -M viins 'jj' vi-cmd-mode # jj to switch Normal mode

# -- Global Alias ----------------------------------------------------------------------------------

alias god='cd ~/Google\ Drive/'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias :q='exit'
alias h='history'
alias forgot='alias | grep $1'
alias ip='curl ipecho.net/plain;echo'

## Node
alias gulp='node_modules/.bin/gulp'

## Git
alias g='git'
alias gs='git status -sb'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(black)(%ar)%C(reset) %C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(black)%an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(yellow)%h%C(reset) %C(blue)%aD%C(reset) %C(bold black)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(black)%an%C(reset)' --all"

###

source $ZSH/oh-my-zsh.sh
