# -- Setup {{{1
# --------------------------------------------------------------------------------------------------

fpath+=("$HOME/.zsh/functions")

# Prompt
autoload -U promptinit && promptinit
prompt pure

# Auto-attach or start `tmux` at login
if [[ $TMUX == "" ]] && [[ $SSH_CONNECTION == "" ]] && [[ `uname -o` != "Android" ]] 2>/dev/null; then
	local main_session='main'

	tmux attach-session -t $main_session \
	|| tmux new -s $main_session && exit 0;
fi

# Welcome message
task list

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS # Ignore duplication command history list
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt inc_append_history
setopt SHARE_HISTORY # Share command history data
HIST_STAMPS='dd.mm.yyyy' # Time stamp format

# Autocomplete
autoload -U compinit && compinit # Enable autocompletion
unsetopt menu_complete # Do not autoselect the first completion entry
setopt completealiases # Autocompletion CLI switches for aliases
zstyle ':completion:*' menu select; # To activate the menu, press tab twice
zstyle ':completion:*' list-colors '' # Show colors on menu completion
zstyle ':completion:*' rehash true # When new programs is installed, auto update autocomplete without reloading shell
setopt complete_in_word # tab completion from both ends
setopt glob_complete # wildcard completion eg. *-tar

# Globbing
setopt extendedglob
unsetopt caseglob

# -- Exports {{{1
# --------------------------------------------------------------------------------------------------

# Default editors
export EDITOR='vim'
hash atom 2>/dev/null && export GUI_EDITOR='atom'

# Term
export TERM='screen-256color'

if [[ $(uname) = 'Darwin' ]]; then
	export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
	export ANDROID_HOME='/usr/local/opt/android-sdk'
	export JAVA_HOME=$(/usr/libexec/java_home)

elif [[ $(uname -o) = 'Android' ]]; then
	export PATH="$HOME/.bin:/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets"
	export TERM='xterm-256color'

elif [[ $(uname) = 'Linux' ]]; then
	export PATH="$HOME/.bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi

# Locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# GnuPG
export GPG_TTY=$(tty)

# For Git relevant functions
export GITHUB_USERNAME='Kutsan'

# fzf
local FZF_DEFAULT_COMMAND='ag --hidden --skip-vcs-ignores --ignore node_modules --ignore .git --ignore .atom --ignore-case -g ""'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND=$FZF_DEFAULT_COMMAND

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

# Shortcuts
alias _='sudo'
alias rm='trash'
alias mv='mv -iv'
alias cp='cp -iv'
alias v='vim'
alias r='ranger'
alias du='du -d1 -h'
alias c='clear'
alias we='weechat'
alias ls='ls -AGF'
alias lsa='ls -lh'
alias grep='grep --color=auto --exclude-dir .git'

# Bookmarks
alias god='cd ~/Drive/Digital'
alias dow='cd ~/Downloads'
alias doc='cd ~/Documents'
alias des='cd ~/Desktop'

# Global Aliases
alias -g L='| less'
alias -g G='| grep'
alias -g V='| vim -R -'

# Configs
alias c-zsh='$EDITOR ~/.zshrc'
alias c-vim='$EDITOR ~/.vimrc'
alias c-tmux='$EDITOR ~/.tmux.conf'
alias c-git='$EDITOR ~/.gitconfig'
alias c-ranger='$EDITOR ~/.config/ranger/rc.conf'
alias c-ssh='$EDITOR ~/.ssh/config'
alias c-netrc='$EDITOR ~/.netrc'

# File Explorer
alias f='open_command $PWD'
[[ $(uname) = "Darwin" ]] && alias fcd="cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')""

# Git
alias g='git'
alias gs='git status -sb'
alias gf='git fetch'
alias gc='git commit'
ga() { git add $@; gs }
alias gd='git diff'
alias gds='git diff --staged'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(bold black)%an%C(reset)%C(bold yellow)%d%C(reset) %C(black)(%ar)%C(reset)' --date=format:'%H:%M %d.%m.%Y' --all"
alias glt="git log --graph --abbrev-commit --decorate --format=format:'%C(bold black)%ad%C(reset) %C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(bold black)%an%C(reset)%C(bold yellow)%d%C(reset) %C(black)(%ar)%C(reset)' --date=format:'%H:%M %d.%m.%Y' --all"

# -- Functions {{{1
# --------------------------------------------------------------------------------------------------

# ## General {{{2
# ------------------------------------------------

# Automatically do an `ls` after each `cd`
lc() { cd $1; ls -GA }

# Package Managers
apti() { sudo apt update && sudo apt install $@ }
aptr() { sudo apt remove $@ && sudo apt autoremove && sudo apt autoclean }
paci() { sudo pacman -Syu $@ }
pacr() { sudo pacman -Rs $@ }

# Launch HTTP server in current directory with port 8080
http()
{
	local PORT=${1:-8080}

	if hash python3 2>/dev/null; then
		python3 -m http.server $PORT

	elif hash python 2>/dev/null; then
		python -m SimpleHTTPServer $PORT

	else
		exit 1
	fi
}

# ## fzf {{{2
# ------------------------------------------------

# `z` with `fzf`
fz()
{
	if [[ -z "$*" ]]; then
		cd "$(_z -l 2>&1 | fzf +s --tac --height 40% --reverse | sed 's/^[0-9,.]* *//')"
	else
		_last_z_args="$@"
		_z "$@"
	fi
}

# `cd` to selected directory with `fzf`
fd()
{
	local dir
	dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m --height 40% --reverse) && cd "$dir"
}

# Better `git log` with `fzf`
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

# Open files in ~/.viminfo with `fzf`
fv()
{
	local files
	files=$(grep '^>' ~/.viminfo | cut -c3- |
	while read line; do
		[ -f "${line/\~/$HOME}" ] && echo "$line"
	done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
}

# -- Mappings {{{1
# --------------------------------------------------------------------------------------------------

# Enable Vi emulation for ZLE
bindkey -v

autoload -U edit-command-line
zle -N edit-command-line

# General
bindkey '^K' up-history # ^K to previous command
bindkey '^J' down-history # ^J to next command
bindkey '^P' history-beginning-search-backward # ^P to previous relative command
bindkey '^N' history-beginning-search-forward # ^N to next relative command

# Insert mode
bindkey -M viins 'jk' vi-cmd-mode # `jk` to switch Normal mode
bindkey -M viins 'kj' vi-cmd-mode # `kj` to switch Normal mode
bindkey -M viins '^H' vi-backward-char # ^H left arrow key
bindkey -M viins '^L' vi-forward-char # ^L right arrow key
bindkey -M viins '^?' backward-delete-char # Delete left char with backspace key

# Normal mode
bindkey -M vicmd 'v' edit-command-line # Edit long commands in Vim by pressing `v` in Normal mode

# -- Source {{{1
# --------------------------------------------------------------------------------------------------

# fzf
if [[ `uname` == 'Darwin' ]]; then
	FZF_DIR="/usr/local/opt/fzf/shell"

elif [[ `uname -o` == 'Android' ]]; then
	FZF_DIR="/data/data/com.termux/files/usr/share/fzf"

elif [[ `uname` == 'Linux' ]]; then
	FZF_DIR="$HOME/.fzf/shell"
	export PATH="$PATH:$HOME/.fzf/bin"
fi

if [[ -d $FZF_DIR ]] 2>/dev/null; then
	source $FZF_DIR/key-bindings.zsh
	source $FZF_DIR/completion.zsh
fi

# z
source $HOME/.zsh/plugins/z/z.sh

# zsh-autosuggestions
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# }}} vim: foldmethod=marker : foldlevel=0
