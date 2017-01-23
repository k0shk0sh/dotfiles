# -- Setup {{{1
# --------------------------------------------------------------------------------------------------

# If ~/.config/isserver.kutsan file exists then prepare for server environment.
if [[ -f "$HOME/.config/isserver.kutsan" ]]; then
	ZSH_THEME='kutsan-server'
	ZSH_TMUX_AUTOSTART=false

else
	ZSH_THEME='kutsan'
	ZSH_TMUX_AUTOSTART=true
	export GUI_EDITOR='atom'
fi

# Change the command execution time stamp shown in the history command output
HIST_STAMPS='dd.mm.yyyy'

# -- Plugins {{{1
# --------------------------------------------------------------------------------------------------

plugins=(
	tmux
	z
	zsh-syntax-highlighting
	vi-style
	zsh-autosuggestions
	shrink-path
)

# vi-style
bindkey -M viins 'jk' vi-cmd-mode # `jk` to switch Normal mode
bindkey -M viins 'kj' vi-cmd-mode # `kj` to switch Normal mode

# -- Exports {{{1
# --------------------------------------------------------------------------------------------------

if [[ $(uname) = 'Darwin' ]]; then
	export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
	export ANDROID_HOME='/usr/local/opt/android-sdk'
	export JAVA_HOME='$(/usr/libexec/java_home)'

elif [[ $(uname -o) = 'Android' ]]; then
	export PATH="$HOME/.bin:/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets"

elif [[ $(uname) = 'Linux' ]]; then
	export PATH="$HOME/.bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi

# Make Vim the default editor
export EDITOR='vim'

# Term
export TERM='screen-256color'

# OhMyZsh
export ZSH=$HOME/.oh-my-zsh

# Locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# GnuPG
export GPG_TTY=$(tty)

# For Git relevant functions
export GITHUB_USERNAME='Kutsan'

# fzf
export FZF_CTRL_T_COMMAND='ag --hidden --skip-vcs-ignores --ignore node_modules --ignore .git --ignore-case -g ""'

# -- Aliases {{{1
# --------------------------------------------------------------------------------------------------

# Binaries
alias rm='trash'
alias mv='mv -i'
alias cp='cp -i'
alias r='ranger'

# Directories
alias god='cd ~/Drive/Digital'
alias dow='cd ~/Downloads'
alias doc='cd ~/Documents'
alias des='cd ~/Desktop'
alias web='cd ~/Drive/Digital/Web'

# Configs
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias tmuxconf='vim ~/.tmux.conf'

# Misc
alias :q='exit'
alias h='history | tail -n 25 | less'
alias forgot='alias | grep $1'
alias whatsmyip='curl ipecho.net/plain; echo'

# File Explorer
alias f='open_command $PWD'
[[ $(uname) = "Darwin" ]] && alias fcd="cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')""

# Git
alias g='git'
alias gs='git status -sb'
alias gf='git fetch'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gds='git diff --staged'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(bold black)%an%C(reset)%C(bold yellow)%d%C(reset) %C(black)(%ar)%C(reset)' --date=format:'%H:%M %d.%m.%Y' --all"
alias glt="git log --graph --abbrev-commit --decorate --format=format:'%C(bold black)%ad%C(reset) %C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(bold black)%an%C(reset)%C(bold yellow)%d%C(reset) %C(black)(%ar)%C(reset)' --date=format:'%H:%M %d.%m.%Y' --all"

# -- Functions {{{1
# --------------------------------------------------------------------------------------------------

##
# Automatically do an ls after each cd
##
lc()
{
	cd $1
	ls -GA
}

##
# Show weather and moon phase
#
# USAGE
#	$ wttr <city>
##
wttr()
{
	curl -s http://wttr.in/$1 http://wttr.in/moon | less
}

# -- Source {{{1
# --------------------------------------------------------------------------------------------------

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# fzf
if [[ $(uname) = 'Darwin' ]]; then
	FZF_DIR="/usr/local/opt/fzf/shell"

elif [[ $(uname -o) = 'Android' ]]; then
	FZF_DIR="/data/data/com.termux/files/usr/share/fzf"

elif [[ $(uname) = 'Linux' ]]; then
	FZF_DIR="$HOME/.fzf/shell"

else
	FZF_DIR=""
fi

[[ -d $FZF_DIR ]] && source "$FZF_DIR/key-bindings.zsh" "$FZF_DIR/completion.zsh"

# }}} vim: foldmethod=marker : foldlevel=0
