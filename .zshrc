# -- Setup {{{1
# --------------------------------------------------------------------------------------------------

plugins=(
	tmux
	z
	zsh-syntax-highlighting
	vi-style
	zsh-autosuggestions
)

# If ~/.config/isserver.kutsan file exists then prepare for server environment.
if [[ -f "$HOME/.config/isserver.kutsan" ]]; then
	ZSH_THEME='kutsan-server'
	ZSH_TMUX_AUTOSTART=false

else
	ZSH_THEME='kutsan'
	ZSH_TMUX_AUTOSTART=true
fi

# vi-style
bindkey -M viins 'jk' vi-cmd-mode # `jk` to switch Normal mode
bindkey -M viins 'kj' vi-cmd-mode # `kj` to switch Normal mode
bindkey -M vicmd 'v' edit-command-line # Edit long commands in Vim by pressing `v`

# -- Options {{{1
# --------------------------------------------------------------------------------------------------

if [[ $(uname) = 'Darwin' ]]; then
	export ZSH=/Users/$(whoami)/.oh-my-zsh
	export ANDROID_HOME='/usr/local/opt/android-sdk'
	export JAVA_HOME='$(/usr/libexec/java_home)'
	export PATH='$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/'

elif [[ $(uname -o) = 'Android' ]]; then
	export ZSH=/data/data/com.termux/files/home/.oh-my-zsh
	export PATH='$HOME/bin:/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets'

elif [[ $(uname) = 'Linux' ]]; then
	export ZSH=/home/$(whoami)/.oh-my-zsh
	export PATH='$HOME/bin:/usr/sbin:/usr/bin:/sbin:/bin'
fi

# GnuPG
export GPG_TTY=$(tty)

# Term
export TERM='screen-256color'

# Prefer US English and use UTF-8
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# -- Alias {{{1
# --------------------------------------------------------------------------------------------------

# Binaries
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias r='ranger'

# Directories
alias god='cd ~/Drive'
alias dow='cd ~/Downloads'
alias doc='cd ~/Documents'

# Configs
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias tmuxconf='vim ~/.tmux.conf'

# Misc
alias :q='exit'
alias h='history | tail -n 25 | less'
alias forgot='alias | grep $1'
alias ip='curl ipecho.net/plain; echo'
alias update='brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; upgrade_oh_my_zsh;'

# Desktop Environment
if [[ $(uname) = 'Darwin' ]]; then
	# Open Finder
	alias f='open -a Finder'

	# Open Finder with current directory
	alias fopen='open_command $PWD'

	# `cd` current Finder directory
	function fcd() { cd "$(pfd)" }

function pfd() {
  osascript 2>/dev/null <<EOF
	tell application "Finder"
	  return POSIX path of (target of window 1 as alias)
	end tell
EOF
}

elif [[ $(uname) = 'Linux' ]]; then
	# TODO
fi

# Git & GitHub
alias g='git'
alias gs='git status -sb'
alias gf='git fetch'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(bold black)%an%C(reset)%C(bold yellow)%d%C(reset) %C(black)(%ar)%C(reset)' --date=format:'%H:%M %d.%m.%Y' --all"
alias glt="git log --graph --abbrev-commit --decorate --format=format:'%C(bold black)%ad%C(reset) %C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(bold black)%an%C(reset)%C(bold yellow)%d%C(reset) %C(black)(%ar)%C(reset)' --date=format:'%H:%M %d.%m.%Y' --all"

if [[ $(uname) = 'Darwin' ]]; then
	alias github="open -a Google\ Chrome 'https://github.com/Kutsan'"

elif [[ $(uname) = 'Linux' ]]; then
	alias github="google-chrome 'http://github.com/Kutsan'"
fi

# -- Source {{{1
# --------------------------------------------------------------------------------------------------

source $ZSH/oh-my-zsh.sh

# }}} vim: foldmethod=marker : foldlevel=0
