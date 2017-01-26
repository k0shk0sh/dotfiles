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
	zsh-autosuggestions
	shrink-path
)

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

# less
export LESS="--ignore-case --status-column --LINE-NUMBERS --jump-target=10 --RAW-CONTROL-CHARS"
export LESS_TERMCAP_md=$(tput bold; tput setaf 147) # Turn on bold (extra bright) mode
export LESS_TERMCAP_me=$(tput sgr0) # Turn off all attributes
export LESS_TERMCAP_so=$(tput bold; tput setaf 214) # Begin standout mode
export LESS_TERMCAP_se=$(tput rmso; tput sgr0) # Exit standout mode
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 250) # Begin underline mode
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0) # Exit underline mode
export LESS_TERMCAP_mr=$(tput rev) # Turn on reverse video mode
export LESS_TERMCAP_mh=$(tput dim) # turn on half-bright mode
export LESS_TERMCAP_ZN=$(tput ssubm) # Enter subscript mode
export LESS_TERMCAP_ZV=$(tput rsubm) # End subscript mode
export LESS_TERMCAP_ZO=$(tput ssupm) # Enter superscript mode
export LESS_TERMCAP_ZW=$(tput rsupm) # End superscript mode
	# Docs at `man 5 terminfo|termcap`

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

# Package Managers
if [[ $(uname -o) = 'Android' ]] &> /dev/null; then
	alias apti='apt update && apt install $1'
	alias aptr='apt remove $1 && apt autoremove && apt autoclean'

else
	alias apti='sudo apt update && sudo apt install $1'
	alias aptr='sudo apt remove $1 && sudo apt autoremove && sudo apt autoclean'

	alias paci='pacman -Syu $1'
	alias pacr='sudo pacman -Rs $1'
fi

# -- Functions {{{1
# --------------------------------------------------------------------------------------------------

##
# Automatically do an `ls` after each `cd`
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

##
# `z` with `fzf`
##
j()
{
	if [[ -z "$*" ]]; then
		cd "$(_z -l 2>&1 | fzf +s --tac --height 40% --reverse | sed 's/^[0-9,.]* *//')"
	else
		_last_z_args="$@"
		_z "$@"
	fi
}

##
# `cd` to selected directory with `fzf`
##
fd()
{
	local dir
	dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m --height 40% --reverse) && cd "$dir"
}

##
# Better `git log` with `fzf`
##
fgl()
{
	git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
	fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
		--bind "ctrl-m:execute:
				(grep -o '[a-f0-9]\{7\}' | head -1 |
				xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
				{}
FZF-EOF"
}

##
# Open files in ~/.viminfo with `fzf`
##
v()
{
	local files
	files=$(grep '^>' ~/.viminfo | cut -c3- |
	while read line; do
		[ -f "${line/\~/$HOME}" ] && echo "$line"
	done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
}

# -- Source {{{1
# --------------------------------------------------------------------------------------------------

# Oh My Zsh
source $ZSH/oh-my-zsh.sh
bindkey -v # Enable Vi emulation for ZLE (it's have to be here)

# fzf
if [[ $(uname) = 'Darwin' ]]; then
	FZF_DIR="/usr/local/opt/fzf/shell"

elif [[ $(uname -o) = 'Android' ]]; then
	FZF_DIR="/data/data/com.termux/files/usr/share/fzf"

elif [[ $(uname) = 'Linux' ]]; then
	FZF_DIR="$HOME/.fzf/shell"
	export PATH="$PATH:$HOME/.fzf/bin"

else
	FZF_DIR=""
fi

if [[ -d $FZF_DIR ]]; then
	source "$FZF_DIR/key-bindings.zsh"
	source "$FZF_DIR/completion.zsh"
fi

# -- Key Bindings {{{1
# --------------------------------------------------------------------------------------------------

# General
bindkey '^K' up-history # ^K to previous command
bindkey '^J' down-history # ^J to next command
bindkey '^P' history-beginning-search-backward # ^P to previous relative command
bindkey '^N' history-beginning-search-forward # ^N to next relative command

# Insert mode
bindkey -M viins 'jk' vi-cmd-mode # `jk` to switch Normal mode
bindkey -M viins 'kj' vi-cmd-mode # `kj` to switch Normal mode
bindkey -M viins "^H" vi-backward-char # ^H left arrow key
bindkey -M viins "^L" vi-forward-char # ^L right arrow key

# Normal mode
bindkey -M vicmd 'v' edit-command-line # Edit long commands in Vim by pressing `v` in Normal mode

# }}} vim: foldmethod=marker : foldlevel=0
