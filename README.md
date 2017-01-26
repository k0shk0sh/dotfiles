<p align="center">
	<img alt="dotfiles" width="200" src="https://raw.githubusercontent.com/jglovier/dotfiles-logo/master/dotfiles-logo.png">
</p>

![Terminal Screenshot][screenshot]

## Installation

Read the source code first!

```bash
$ curl -fsSL https://raw.githubusercontent.com/Kutsan/dotfiles/master/.tools/install.sh | bash
```

## Overview

- macOS & Linux
	- CLI
		- [Zsh](http://www.zsh.org) - Unix shell
			- [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) - Framework for managing Zsh configuration
				- Theme
					- [kutsan](https://github.com/Kutsan/dotfiles/blob/master/.oh-my-zsh/themes/kutsan.zsh-theme) - (_forked from [wesbos/Cobalt2-iterm](https://github.com/wesbos/Cobalt2-iterm)_)
				- Plugins
					- [tmux](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#tmux) - Several options for effecting the startup behavior of tmux
					- [z](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z) - Tracks your most used directories, based on frecency
					- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Command highlighting
					- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like autosuggestions for Zsh
					- [shrink-path](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/shrink-path) - Shorten directory paths
		- [Vim](http://www.vim.org) - The ubiquitous text editor
			- [Minimalist](https://github.com/dikiaap/minimalist) - Color scheme
			- [VimPlug](https://github.com/junegunn/vim-plug) - Plugin manager
				- [Airline](https://github.com/vim-airline/vim-airline) - Statusline bar & tabline
					- [Kutsan](https://github.com/Kutsan/dotfiles/blob/master/.vim/autoload/airline/themes/kutsan.vim) - Theme
				- [Auto Pairs](https://github.com/jiangmiao/auto-pairs) - Insert or delete brackets, parens, quotes in pair
				- [vim-javascript](https://github.com/pangloss/vim-javascript) - Vastly improved JavaScript indentation and syntax support
		- [Git](https://git-scm.com) - The Stupid Content Tracker
		- [Tmux](https://tmux.github.io) - Terminal multiplexer
			- [tpm](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager
				- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - Persists tmux environment across system restarts
				- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) - Tmux plugin for copying to system clipboard
		- [NodeJS](https://nodejs.org) - JavaScript runtime environment for developing a diverse variety of tools and applications
		- [npm](https://www.npmjs.com) - Node Package Manager
			- [ngrok](https://www.npmjs.com/package/ngrok) - Secure tunnels to localhost
			- [eslint](https://www.npmjs.com/package/eslint) - An AST-based pattern checker for JavaScript
		- [GnuPG](https://www.gnupg.org) - Replacement for Symantec's PGP cryptographic software suite
		- trash-cli ([1](https://github.com/andreafrancia/trash-cli))([2](http://hasseg.org/trash)) - Move files and folders to the trash
		- [Nmap](https://nmap.org) - Network security scanner
		- [JDK](http://www.oracle.com) - Java Development Kit
		- [android-sdk](https://developer.android.com/studio/index.html) - Development tools for Android
		- [ranger](https://github.com/ranger/ranger) - A Vim-inspired filemanager for the console
		- [fzf](https://github.com/junegunn/fzf) - Command-line fuzzy finder
	- GUI
		- [iTerm](https://www.iterm2.com) - Terminal emulator for macOS
			- [Roboto Mono](https://github.com/powerline/fonts) - Font
			- [Atom Material](https://github.com/Kutsan/dotfiles/blob/master/.config/iterm/AtomMaterial.itermcolors) - Color scheme
		- [GIMP](https://www.gimp.org) - GNU Image Manipulation Program
		- [IntelliJ IDEA](https://www.jetbrains.com/idea) - Integrated Development Environment
			- [IdeaVim](https://github.com/JetBrains/ideavim) - Vim emulation plugin for IntelliJ IDEA
		- [Atom](https://atom.io) - A hackable text editor for the 21st Century
			- Theme
				- [atom-material-ui](https://atom.io/packages/atom-material-ui) - A dark UI theme for Atom that follows Google's Material Design Guidelines
				- [atom-material-syntax-dark](https://atom.io/packages/atom-material-syntax-dark) - A darker syntax theme for Atom that uses Google's Material Design color palette
			- Packages
				- [atom-beautify](https://atom.io/packages/atom-beautify) - Code beautify
				- [atom-runner](https://atom.io/packages/atom-runner) - Script runner
				- [atom-ternjs](https://atom.io/packages/atom-ternjs) - JavaScript intelligent code completion
				- [docblockr](https://atom.io/packages/docblockr) - A helper package for writing documentation
				- [editorconfig](https://atom.io/packages/editorconfig) - Helps developers maintain consistent coding styles between different editors
				- [file-icons](https://atom.io/packages/file-icons) - Assign file extension icons and colours for improved visual grepping
				- [highlight-selected](https://atom.io/packages/highlight-selected) - Highlights the current word selected when double clicking
				- [indent-guide-improved](https://atom.io/packages/indent-guide-improved) - This draws indent guide more correctly and understandably
				- [js-hyperclick](https://atom.io/packages/js-hyperclick) - A hyperclick provider that lets you jump to where variables are defined
				- [js-refactor](https://atom.io/packages/js-refactor) - Refactoring support for JavaScript
				- [language-babel](https://atom.io/packages/js-refactor) - Babel language grammar support
				- [linter](https://atom.io/packages/linter) - A Base Linter with Cow Powers
				- [linter-eslint](https://atom.io/packages/linter-eslint) - Lint JavaScript on the fly, using ESLint
				- [local-history](https://atom.io/packages/local-history) - Maintaining local history of files
				- [open-this](https://atom.io/packages/open-this) - Open file under cursor like `gf` in Vim
				- [pigments](https://atom.io/packages/pigments) - A package to display colors in project and files
				- [project-plus](https://atom.io/packages/project-plus) - Simply awesome project management
				- [refactor](https://atom.io/packages/refactor) - Base refactoring support
				- [relative-numbers](https://atom.io/packages/relative-numbers) - Relative line numbers
				- [todo-show](https://atom.io/packages/todo-show) - Finds all the TODOs, FIXMEs, CHANGEDs, etc.
				- [tokamak-terminal](https://atom.io/packages/tokamak-terminal) - A terminal package
				- [vim-mode-plus](https://atom.io/packages/vim-mode-plus) - vim-mode improved
- Android
	- [Termux](https://play.google.com/store/apps/details?id=com.termux) - Terminal emulator for Android
		- [Styling](https://play.google.com/store/apps/details?id=com.termux.styling) - Color schemes and powerline-ready font support
			- [Atom Material](https://github.com/Kutsan/dotfiles/blob/master/.termux/colors.properties) - Color scheme
			- Roboto Mono - Font

## Credits

- Logo from [jglovier/dotfiles-logo](https://github.com/jglovier/dotfiles-logo)

[screenshot]: https://i.imgur.com/C4uj1c9.png
