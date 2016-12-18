# -- Setup {{{1
# --------------------------------------------------------------------------------------------------

ZSH_THEME='kutsan'

plugins=(
	tmux
	z
	zsh-syntax-highlighting
	vi-style
	zsh-autosuggestions
)

# tmux
ZSH_TMUX_AUTOSTART=true

# vi-style
bindkey -M viins 'jj' vi-cmd-mode # `jj` to switch Normal mode
bindkey -M vicmd 'v' edit-command-line # Edit long commands in Vim by pressing `v`

# -- Options {{{1
# --------------------------------------------------------------------------------------------------

if [[ $(uname) = 'Darwin' ]]; then
	export ZSH=/Users/$(whoami)/.oh-my-zsh
	export PATH='$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/'

elif [[ $(uname -o) = 'Android' ]]; then
	export ZSH=/data/data/com.termux/files/home/.oh-my-zsh
	export PATH='$HOME/bin:/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets'

elif [[ $(uname) = 'Linux' ]]; then
	export ZSH=/home/$(whoami)/.oh-my-zsh
	export PATH='$HOME/bin:/usr/sbin:/usr/bin:/sbin:/bin'
fi

export GPG_TTY=$(tty) # GnuPG
export TERM='screen-256color'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# -- Alias {{{1
# --------------------------------------------------------------------------------------------------

# Shortcuts
alias r='ranger'

# Directories
alias god='cd ~/Drive/'
alias dow='cd ~/Downloads'
alias doc='cd ~/Documents'

# Configs
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias tmuxrc='vim ~/.tmux.conf'

# Misc
alias :q='exit'
alias h='history | tail -n 25 | less'
alias forgot='alias | grep $1'
alias ip='curl ipecho.net/plain; echo'

# Git
alias g='git'
alias gs='git status -sb'
alias gf='git fetch'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold black)%ad%C(reset) %C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(bold black)%an%C(reset)%C(bold yellow)%d%C(reset) %C(black)(%ar)%C(reset)' --date=format:'%H:%M %d.%m.%Y' --all"

# -- Source {{{1
# --------------------------------------------------------------------------------------------------

source $ZSH/oh-my-zsh.sh

# }}} vim: foldmethod=marker : foldlevel=0
