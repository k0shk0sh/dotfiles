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
	export PATH='$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/'

elif [[ $(uname -o) = 'Android' ]]; then
	export ZSH=/data/data/com.termux/files/home/.oh-my-zsh
	export PATH='$HOME/bin:/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets'

elif [[ $(uname) = 'Linux' ]]; then
	export ZSH=/home/$(whoami)/.oh-my-zsh
	export PATH='$HOME/bin:/usr/local/bin'
fi

export GPG_TTY=$(tty) # For GPG

# -- Plugins ---------------------------------------------------------------------------------------

# tmux
ZSH_TMUX_AUTOSTART=true
export TERM='xterm-256color' # For right colors

# vi-style
bindkey -M viins 'jj' vi-cmd-mode # jj to switch Normal mode

# -- Global Alias & Functions ----------------------------------------------------------------------

alias god='cd ~/Google\ Drive/'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias :q='exit'
alias h='history'
alias forgot='alias | grep $1'
alias ip='curl ipecho.net/plain;echo'
alias r='ranger'

## Git

alias g='git'
alias gs='git status -sb'
alias gf='git fetch'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(blue)%ad%C(reset) %C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(bold black)%an%C(reset)%C(bold yellow)%d%C(reset) %C(black)(%ar)%C(reset)' --date=format:'%H:%M %d.%m.%Y' --all"

###

source $ZSH/oh-my-zsh.sh
