# Kutsan's dotfiles

![Terminal Screenshot][screenshot]

## Installation

```bash
$ curl -fsSL https://raw.githubusercontent.com/kutsan/dotfiles/master/.tools/install.sh | bash
```

## Overview

- General
	- CLI
		- [Zsh](http://www.zsh.org) - Unix shell as interactive login shell
			- [pure](https://github.com/sindresorhus/pure) - Pretty, minimal and fast ZSH prompt
			- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Command highlighting
			- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like autosuggestions for Zsh
		- [Bash](https://www.gnu.org/software/bash) - Unix shell as command language
		- [Vim](https://github.com/vim/vim) - The ubiquitous text editor
			- [Minimalist](https://github.com/dikiaap/minimalist) - Color scheme
			- [VimPlug](https://github.com/junegunn/vim-plug) - Plugin manager
				- [Airline](https://github.com/vim-airline/vim-airline) - Statusline bar & tabline
					- [Kutsan](https://github.com/kutsan/dotfiles/blob/master/.vim/autoload/airline/themes/kutsan.vim) - Theme
				- [Auto Pairs](https://github.com/jiangmiao/auto-pairs) - Insert or delete brackets, parens, quotes in pair
				- [vim-javascript](https://github.com/pangloss/vim-javascript) - Vastly improved JavaScript indentation and syntax support
		- [Git](https://git-scm.com) - The Stupid Content Tracker
		- [NodeJS](https://nodejs.org) - JavaScript runtime environment for developing a diverse variety of tools and applications
			- [npm](https://www.npmjs.com) - Node Package Manager
				- [eslint](https://github.com/eslint/eslint) - AST-based pattern checker for JavaScript
				- [ngrok](https://github.com/bubenshchykov/ngrok) - Secure tunnels to localhost
		- [Python](https://www.python.org) - High-level programming language for general-purpose programming
			- [pip](https://pip.pypa.io) - Python Package Manager
		- [Java](https://www.oracle.com) - Java Development Kit
		- [Android SDK](https://developer.android.com) - Development tools for Android
		- [GnuPG](https://www.gnupg.org) - OpenPGP compatible encryption system
		- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer
			- [tpm](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager
				- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) - Use system clipboard
				- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - Save tmux environment
				- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - Persists tmux environment across system restarts
		- trash-cli<sup>[[1](https://github.com/andreafrancia/trash-cli)][[2](http://hasseg.org/trash)]</sup> - Move files and folders to the trash
		- [z](https://github.com/rupa/z) - Tracks your most used directories, based on frecency
		- [nmap](https://github.com/nmap/nmap) - Network security scanner
		- [htop](https://github.com/hishamhm/htop) - Interactive process viewer
		- [ranger](https://github.com/ranger/ranger) - Vim-inspired filemanager for the console
		- [fzf](https://github.com/junegunn/fzf) - Command-line fuzzy finder
		- [weechat](https://github.com/weechat/weechat) - The extensible IRC client
		- [mutt](http://www.mutt.org) - Mail User Agent
		- [taskwarrior](https://github.com/taskwarrior/task) - CLI task, todo list manager
		- [ncdu](https://dev.yorhel.nl/ncdu) - Disk usage analyzer with ncurses interface
		- [SSHFS](https://github.com/libfuse/sshfs) - Network filesystem client to connect to SSH servers
		- [ripgrep](https://github.com/BurntSushi/ripgrep) - Line oriented search tool
		- [shellcheck](https://github.com/koalaman/shellcheck) - Static analysis tool for shell scripts
		- [ffmpeg](https://github.com/FFmpeg/FFmpeg) - Cross-platform solution to record, convert and stream audio and video

	- GUI
		- [GIMP](https://www.gimp.org) - GNU Image Manipulation Program
		- [IntelliJ IDEA](https://www.jetbrains.com/idea) - Integrated Development Environment
			- [IdeaVim](https://github.com/JetBrains/ideavim) - Vim emulation plugin for IntelliJ IDEA

- Arch Linux
	- [i3](https://github.com/i3/i3) - Better tiling and dynamic window manager

- macOS
	- [iTerm](https://www.iterm2.com) - Terminal emulator for macOS
		- [Roboto Mono](https://github.com/powerline/fonts) - Font
		- [Atom Material](https://github.com/kutsan/dotfiles/blob/master/.config/iterm/AtomMaterial.itermcolors) - Color scheme
	- [Tunnelblick](https://tunnelblick.net) - OpenVPN client
	- [BetterTouchTool](https://www.boastr.net) - Configurable touchpad gestures

- Android
	- [Termux](https://github.com/termux/termux-app) - Terminal emulator for Android
		- [Styling](https://github.com/termux/termux-styling) - Color schemes and powerline-ready font support
			- [Atom Material](https://github.com/kutsan/dotfiles/blob/master/.termux/colors.properties) - Color scheme
			- Roboto Mono - Font
	- [Mycelium](https://play.google.com/store/apps/details?id=com.mycelium.wallet) - Bitcoin wallet

[screenshot]: https://i.imgur.com/C4uj1c9.png
