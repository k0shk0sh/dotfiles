# -- Setup {{{1
# --------------------------------------------------------------------------------------------------

# Zsh autoload
fpath+=("$HOME/.zsh/functions")

# Prompt
autoload -U promptinit && promptinit
prompt pure

# Tmux auto-attach or start at login
if [[ $TMUX == "" ]] && [[ $SSH_CONNECTION == "" ]] && [[ $(uname -o) != "Android" ]] 2>/dev/null; then
	# VSCode integrated terminal
	if [[ $VSCODE_PID != "" ]]; then
		session_name='vscode'

	# Terminal emulator
	else
		session_name='main'
	fi

	tmux attach-session -t $session_name \
		|| tmux new -s $session_name && exit 0

	unset session_name
fi

# MOTD
task limit:5 next 2>/dev/null

# History
HISTFILE=$HOME/.zsh_history # Where history logs are stored.
HIST_STAMPS='dd.mm.yyyy' # History time stamp format.
HISTSIZE=10000000 # The maximum number of events stored in the internal history list.
SAVEHIST=10000000 # The maximum number of history events to save in the history file.
setopt APPEND_HISTORY # Append history to the history file, rather than replace it.
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
setopt BANG_HIST # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY # Write the history file in the `: <beginning time>:<elapsed seconds>;<command>' format.
setopt SHARE_HISTORY # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS # Do not display a line previously found.
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY # Don't execute immediately upon history expansion.
setopt HIST_BEEP # Beep when accessing nonexistent history.
setopt NO_CLOBBER # Do not allows `>` redirection to override existing files. If you want to, use `>|` instead.

# Autocomplete
autoload -U compinit && compinit # Enable autocompletion
zstyle ':completion:*' menu select; # To activate the menu, press tab twice
zstyle ':completion:*' list-colors '' # Show colors on menu completion
zstyle ':completion:*' rehash true # When new programs is installed, auto update autocomplete without reloading shell
setopt COMPLETE_ALIASES # Autocompletion CLI switches for aliases
setopt COMPLETE_IN_WORD # Tab completion from both ends
setopt GLOB_COMPLETE # wildcard completion eg. *-tar

# Globbing
setopt EXTENDED_GLOB # Treat the `#', `~' and `^' characters as part of patterns for filename generation, etc.  (An initial unquoted `~' always produces named directory expansion.)
unsetopt caseglob

# -- Exports {{{1
# --------------------------------------------------------------------------------------------------

# Path
export PATH="$HOME/.bin:$PATH"

# Term
export TERM='screen-256color'

# Default editors
export EDITOR='vim'
hash code 2>/dev/null && export GUI_EDITOR='code'

# GitHub Username
export GITHUB_USERNAME='kutsan'

# Locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# less
export LESS="--ignore-case --tilde --chop-long-lines --status-column --LONG-PROMPT --jump-target=10 --RAW-CONTROL-CHARS"
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
	# `man 5 terminfo|termcap`

# Platform Specific Variables
if [[ $(uname) == 'Darwin' ]]; then
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	export ANDROID_HOME='/usr/local/opt/android-sdk'
	export JAVA_HOME=$(/usr/libexec/java_home)
fi

# GnuPG
export GPG_TTY=$(tty)

# fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# -- Aliases {{{1
# --------------------------------------------------------------------------------------------------

# System Shortcuts
alias _='sudo'
alias rm='trash'
alias mv='mv -iv' # -i: Warn when overwriting an existing file, -v: Verbose
alias cp='cp -iv' # -i: Warn when overwriting an existing file, -v: Verbose
alias v='vim'
alias grep='grep --color=auto --exclude-dir .git'
alias du='du -d 1 -h' # Display disk usage statistics. -d 1: One deepness level, -h: Human-readable output
alias df='df -h' # Display free disk space. -h: Human-readable output
alias c='clear'
alias h='history -25 | less' # Show last 25 entered commands from history
alias :q='exit'
alias ls='ls -F --color=auto --group-directories-first' # -G|--color=auto: Colorized output, -F: Display file type symbols after name
alias lsa='ls -lAh' # -l: Detailed output, -A: List all, -h: Use file size unit suffixes
alias lsd='ls -d .*/ */ | sed "s/.$//"' # -d: Do not search recursively, .*/ *: Show only directories
alias lsf='ls -A1 | grep --invert-match "/$"' # Show only files
alias ..='cd ..'
alias ...='cd ../..'
alias psg='ps aux | grep --ignore-case' # Search process

# Custom Shortcuts
alias r='ranger'
alias we='weechat'
alias t='task'
alias tn='tmux new-session -s'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t'

# Bookmarks
alias god='cd ~/Drive/Digital'
alias dow='cd ~/Downloads'
alias doc='cd ~/Documents'
alias des='cd ~/Desktop'

# Global Aliases
alias -g ND='*(/om[1])' # Newest directory
alias -g NF='*(.om[1])' # Newest file
alias -g L='| less'
alias -g V='| vim -R -' # Read-only Vim as pager
alias -g G='| grep'
alias -g WC='| wc'
alias -g H='| head'
alias -g T='| tail'
alias -g NE='2>/dev/null' # No sterr
alias -g NO='&>/dev/null' # No stout and sterr (Shorthand for 1> /dev/null 2>&1)
alias -g AWK="| awk '{  }'"
alias -g SED="| sed ''"
alias -g R='| rg'
alias -g F='| fzf'

# Configs
alias c-zsh='$EDITOR ~/.zshrc'
alias c-readme='$EDITOR ~/README.md'
alias c-vim='$EDITOR ~/.vimrc'
alias c-tmux='$EDITOR ~/.tmux.conf'
alias c-git='$EDITOR ~/.gitconfig'
alias c-ranger='$EDITOR ~/.config/ranger/rc.conf'
alias c-ssh='$EDITOR ~/.ssh/config'
alias c-netrc='$EDITOR ~/.netrc'
alias c-task='$EDITOR ~/.taskrc'
alias c-htop='$EDITOR ~/.config/htop/htoprc'
alias c-mutt='$EDITOR ~/.mutt/muttrc'
alias r-zsh='source ~/.zshrc'

# File Explorer
alias f='xdg-open $PWD 2>/dev/null || open $PWD 2>/dev/null' # Open current directory onto GUI file browser

# Git
alias g='git'
alias gs='git status -sb'
ga() { git add "$@"; gs; }
alias gf='git fetch'
alias gc='git commit'
alias gb='git branch'
alias gsu='git submodule'
alias gd='git diff'
alias gds='git diff --staged'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(bold black)%an%C(reset)%C(bold yellow)%d%C(reset) %C(black)(%ar)%C(reset)' --date=format:'%H:%M %d.%m.%Y' --all"
alias glt="git log --graph --abbrev-commit --decorate --format=format:'%C(bold black)%ad%C(reset) %C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(bold black)%an%C(reset)%C(bold yellow)%d%C(reset) %C(black)(%ar)%C(reset)' --date=format:'%H:%M %d.%m.%Y' --all"

# Misc
alias myip='curl ipecho.net/plain; echo'

# -- Functions {{{1
# --------------------------------------------------------------------------------------------------

# ## General {{{2
# ------------------------------------------------

# Automatically do an `ls` after each `cd`
lc() { cd "$1"; ls; }

# Makes directory and `cd`s into it
take() { mkdir -p -v "$1"; cd "$1"; }

# List and grep with file permissions
lsg()
{
	lsa | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(" %0o ",k);print}' \
		| grep --ignore-case --extended-regexp "$1"
}

# Package Managers
apti() { sudo apt update && sudo apt install "$@"; }
aptr() { sudo apt remove "$@" && sudo apt autoremove && sudo apt autoclean; }
paci() { sudo pacman -Syu "$@"; }
pacr() { sudo pacman -Rs "$@"; }

# Quick MD5 check
md5c() {
	md5sum "$1" | grep "$2"
}

# Launch HTTP server in current directory with default port 8080
http-server()
{
	local PORT=${1:-8080}

	if hash python3 2>/dev/null; then
		python3 -m http.server "$PORT"

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
	dir=$(find ${1:-.} -type d 2>/dev/null | fzf +m --height 40% --reverse) && cd "$dir"
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

# ## Setup {{{2
# ------------------------------------------------

# Enable Vi emulation for ZLE
bindkey -v

# ## Functions {{{2
# ------------------------------------------------

autoload -U edit-command-line

expand_global_alias()
{
	if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
		zle _expand_alias
		zle expand-word
	fi

	zle self-insert
}

zle -N edit-command-line
zle -N expand_global_alias

# ## Bindings {{{2
# ------------------------------------------------

# General
bindkey '^K' up-history # ^K to previous command
bindkey '^J' down-history # ^J to next command
bindkey '^P' history-beginning-search-backward # ^P to previous relative command
bindkey '^N' history-beginning-search-forward # ^N to next relative command
bindkey ' ' expand_global_alias # Space key to expand global aliases

# Insert mode
bindkey -M viins 'jk' vi-cmd-mode # `jk` to switch Normal mode
bindkey -M viins 'kj' vi-cmd-mode # `kj` to switch Normal mode
bindkey -M viins '^H' vi-backward-char # ^H left arrow key
bindkey -M viins '^L' vi-forward-char # ^L right arrow key
bindkey -M viins '^?' backward-delete-char # Delete left char with backspace key
bindkey -M viins "^[[Z" magic-space # S-Tab to bypass completion

# Normal mode
bindkey -M vicmd 'v' edit-command-line # Edit long commands in Vim by pressing `v` in Normal mode

# -- Source {{{1
# --------------------------------------------------------------------------------------------------

# fzf
if [[ $(uname) == 'Darwin' ]]; then
	FZF_DIR="/usr/local/opt/fzf/shell"

elif [[ $(uname -o) == 'Android' ]]; then
	FZF_DIR="/data/data/com.termux/files/usr/share/fzf"

elif [[ $(uname) == 'Linux' ]]; then
	FZF_DIR="$HOME/.fzf/shell"
	export PATH="$PATH:$HOME/.fzf/bin"
fi

if [[ -d $FZF_DIR ]] 2>/dev/null; then
	source "$FZF_DIR/key-bindings.zsh"
	source "$FZF_DIR/completion.zsh"
fi

# z
source "$HOME/.zsh/plugins/z/z.sh"

# zsh-autosuggestions
source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting
source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# }}} vim: foldmethod=marker : foldlevel=0
