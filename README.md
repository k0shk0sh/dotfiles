# Kutsan's dotfiles

![Terminal Screenshot][screenshot]

## Installation

```bash
$ curl -fsSL https://raw.githubusercontent.com/kutsan/dotfiles/master/.tools/install.sh | bash
```

## Overview

- CLI
	- [Zsh](http://www.zsh.org) - Unix shell
		- [pure](https://github.com/sindresorhus/pure) - Pretty, minimal and fast ZSH prompt
		- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Command highlighting
		- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like autosuggestions for Zsh
	- [Vim](http://www.vim.org) - The ubiquitous text editor
		- [Minimalist](https://github.com/dikiaap/minimalist) - Color scheme
		- [VimPlug](https://github.com/junegunn/vim-plug) - Plugin manager
			- [Airline](https://github.com/vim-airline/vim-airline) - Statusline bar & tabline
				- [Kutsan](https://github.com/Kutsan/dotfiles/blob/master/.vim/autoload/airline/themes/kutsan.vim) - Theme
			- [Auto Pairs](https://github.com/jiangmiao/auto-pairs) - Insert or delete brackets, parens, quotes in pair
			- [vim-javascript](https://github.com/pangloss/vim-javascript) - Vastly improved JavaScript indentation and syntax support
	- [Git](https://git-scm.com) - The Stupid Content Tracker
	- [NodeJS](https://nodejs.org) - JavaScript runtime environment for developing a diverse variety of tools and applications
		- [npm](https://www.npmjs.com) - Node Package Manager
			- [ngrok](https://www.npmjs.com/package/ngrok) - Secure tunnels to localhost
			- [eslint](https://www.npmjs.com/package/eslint) - An AST-based pattern checker for JavaScript
	- [JDK](http://www.oracle.com) - Java Development Kit
	- [android-sdk](https://developer.android.com/studio/index.html) - Development tools for Android
	- [GnuPG](https://www.gnupg.org) - Replacement for Symantec's PGP cryptographic software suite
	- [tmux](https://tmux.github.io) - Terminal multiplexer
		- [tpm](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager
			- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) - Use system clipboard
			- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - Save tmux environment
			- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - Persists tmux environment across system restarts
	- trash-cli<sup>[[1](https://github.com/andreafrancia/trash-cli)][[2](http://hasseg.org/trash)]</sup> - Move files and folders to the trash
	- [z](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z) - Tracks your most used directories, based on frecency
	- [nmap](https://nmap.org) - Network security scanner
	- [htop](https://github.com/hishamhm/htop) - Interactive process viewer
	- [ranger](https://github.com/ranger/ranger) - A Vim-inspired filemanager for the console
	- [fzf](https://github.com/junegunn/fzf) - Command-line fuzzy finder
	- [weechat](https://github.com/weechat/weechat) - The extensible IRC client
	- [mutt](http://www.mutt.org) - Mail User Agent
	- [taskwarrior](https://github.com/taskwarrior/task) - A CLI task, todo list manager
	- [ncdu](https://dev.yorhel.nl/ncdu) - Disk usage analyzer with ncurses interface
	- [SSHFS](https://github.com/libfuse/sshfs) - A network filesystem client to connect to SSH servers

- GUI
	- [GIMP](https://www.gimp.org) - GNU Image Manipulation Program
	- [IntelliJ IDEA](https://www.jetbrains.com/idea) - Integrated Development Environment
		- [IdeaVim](https://github.com/JetBrains/ideavim) - Vim emulation plugin for IntelliJ IDEA

- Arch Linux
	- [i3](https://github.com/i3/i3) - A better tiling and dynamic window manager

- Android
	- [Termux](https://play.google.com/store/apps/details?id=com.termux) - Terminal emulator for Android
		- [Styling](https://play.google.com/store/apps/details?id=com.termux.styling) - Color schemes and powerline-ready font support
			- [Atom Material](https://github.com/Kutsan/dotfiles/blob/master/.termux/colors.properties) - Color scheme
			- Roboto Mono - Font
	- [Mycelium](https://play.google.com/store/apps/details?id=com.mycelium.wallet) - Bitcoin wallet

- macOS
	- [iTerm](https://www.iterm2.com) - Terminal emulator for macOS
		- [Roboto Mono](https://github.com/powerline/fonts) - Font
		- [Atom Material](https://github.com/Kutsan/dotfiles/blob/master/.config/iterm/AtomMaterial.itermcolors) - Color scheme
	- [Tunnelblick](https://tunnelblick.net) - OpenVPN client
	- [BetterTouchTool](https://www.boastr.net) - Configurable touchpad gestures
	- [kwm](https://github.com/koekeishiya/kwm) - Tiling window manager
	- [khd](https://github.com/koekeishiya/khd) - Hotkey daemon

[screenshot]: https://i.imgur.com/C4uj1c9.png
