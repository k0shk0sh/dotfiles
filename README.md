<img alt="dotfiles" width="200" src="https://raw.githubusercontent.com/jglovier/dotfiles-logo/master/dotfiles-logo.png">

![Terminal Screenshot][screenshot]

## Overview
- [Homebrew](http://brew.sh/) - Package manager for Mac OS
    - [Zsh](http://www.zsh.org) - Unix shell
        - [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) - Framework for managing Zsh configuration
            - Theme
                - [Kutsan](https://github.com/Kutsan/dotfiles/blob/master/.oh-my-zsh/themes/kutsan.zsh-theme) - (_forked from [wesbos/Cobalt2-iterm](https://github.com/wesbos/Cobalt2-iterm)_)
            - Plugins
                - Built-in
                    - [git](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#git) - Git aliases and functions
                    - [tmux](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#tmux) - Several options for effecting the startup behavior of tmux
                    - [osx](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#osx) - A few shortcuts for native Mac OS features
                    - [z](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z) - Tracks your most used directories, based on frecency
                - Custom
                    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Command highlighting
                    - [vi-style](https://github.com/Kutsan/dotfiles/tree/master/.oh-my-zsh/custom/plugins/vi-style/vi-style.plugin.zsh) - Vi mode (_forked from [robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh)_)
    - [Vim](http://www.vim.org) - The ubiquitous text editor
        - [VimPlug](https://github.com/junegunn/vim-plug) - Plugin manager
            - [NERDTree](https://github.com/scrooloose/nerdtree) - A tree explorer
            - [Airline](https://github.com/vim-airline/vim-airline) - Statusline bar & tabline
                - [Laederon](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/laederon.vim) - Theme
                - [Tmuxline](https://github.com/edkolev/tmuxline.vim) - Tmux statusline generator
            - [Auto Pairs](https://github.com/jiangmiao/auto-pairs) - Insert or delete brackets, parens, quotes in pair
            - [vim-javascript](https://github.com/pangloss/vim-javascript) - Vastly improved JavaScript indentation and syntax support
        - [Monokai](https://github.com/crusoexia/vim-monokai) - Color scheme
    - [Git](https://git-scm.com) - Distributed version control system
    - [Tmux](https://tmux.github.io) - Terminal multiplexer
    - [NodeJS](https://nodejs.org) - JavaScript runtime environment for developing a diverse variety of tools and applications
      - [NPM](https://www.npmjs.com) - Node Package Manager
          - [ngrok](https://www.npmjs.com/package/ngrok) - Secure tunnels to localhost
		  - [eslint](https://www.npmjs.com/package/eslint) - An AST-based pattern checker for JavaScript
    - [git-extras](https://github.com/tj/git-extras) - Extra commands for Git
    - [GnuPG](https://www.gnupg.org) - Replacement for Symantec's PGP cryptographic software suite
    - [Tree](http://mama.indstate.edu/users/ice/tree) - Recursive directory listing
    - [Trash](https://github.com/sindresorhus/trash) - Move files and folders to the trash
- [iTerm](https://www.iterm2.com) - Terminal emulator for Mac OS
    - [Roboto Mono](https://github.com/powerline/fonts) - Font
    - [Monokai](https://github.com/Kutsan/dotfiles/blob/master/.config/iterm/monokai.itermcolors) - Color scheme
- [Termux](https://play.google.com/store/apps/details?id=com.termux) - Terminal emulator for Android
    - [Styling](https://play.google.com/store/apps/details?id=com.termux.styling) - Color schemes and powerline-ready font support
        - [Monokai](https://github.com/Kutsan/dotfiles/blob/master/.termux/colors.properties) - Color scheme
- [Atom](https://atom.io) - A hackable text editor for the 21st Century
	- Theme
		- [atom-material-ui](https://atom.io/packages/atom-material-ui) - A dark UI theme for Atom that follows Google's Material Design Guidelines
		- [atom-monokai](https://atom.io/packages/atom-monokai) - Monokai syntax theme for Atom Dark, One Dark, Seti UI and other
	- Plugins
		- [atom-beautify](https://atom.io/packages/atom-beautify) - Beautify HTML, CSS, JavaScript, PHP, Python, Ruby, Java, C, C++, C#, Objective-C, CoffeeScript, TypeScript, Coldfusion, SQL, and more in Atom
		- [atom-ternjs](https://atom.io/packages/atom-ternjs) - JavaScript code intelligence for atom with Tern. Adds support for ES5, ES6 (JavaScript 2015), Node.js, jQuery & Angular. Extendable via plugins. Uses suggestion provider by autocomplete-plus.
		- [docblockr](https://atom.io/packages/docblockr) - A helper package for writing documentation
		- [editorconfig](https://atom.io/packages/editorconfig) - Helps developers maintain consistent coding styles between different editors
		- [file-icons](https://atom.io/packages/file-icons) - Assign file extension icons and colours for improved visual grepping
		- [highlight-selected](https://atom.io/packages/highlight-selected) - Highlights the current word selected when double clicking
		- [js-hyperclick](https://atom.io/packages/js-hyperclick) - A hyperclick provider that lets you jump to where variables are defined.
		- [js-refactor](https://atom.io/packages/js-refactor) - Refactoring support for JavaScript
		- [language-javascript-jsx](https://atom.io/packages/language-javascript-jsx) - JavaScript, ES6, ES7, React JSX, Flow, etc… by SubtleGradient of Facebook
		- [language-markdown](https://atom.io/packages/language-markdown) - Adds grammar support for Markdown (including Github flavored, AtomDoc, Markdown Extra, CriticMark, YAML/TOML front-matter, and R Markdown), and smart context-aware behavior to lists, and keyboard shortcuts for inline emphasis.
		- [linter](https://atom.io/packages/linter) - A Base Linter with Cow Powers
		- [linter-eslint](https://atom.io/packages/linter-eslint) - Lint JavaScript on the fly, using ESLint
		- [local-history](https://atom.io/packages/local-history) - Maintaining local history of files (history of your changes to the code files).
		- [open-recent](https://atom.io/packages/open-recent) - Open recent files in the current window, and recent folders (optionally) in a new window.
		- [open-this](https://atom.io/packages/open-this) - Open file under cursor like `gf`(Vim), `C-x C-f`(Emacs)
		- [pigments](https://atom.io/packages/pigments) - A package to display colors in project and files.
		- [react](https://atom.io/packages/react) - React.js (JSX) language support, indentation, snippets, auto completion, reformatting
		- [refactor](https://atom.io/packages/refactor) - Refactoring support
		- [relative-numbers](https://atom.io/packages/relative-numbers) - Relative line numbers for Atom
		- [todo-show](https://atom.io/packages/todo-show) - Finds all the TODOs, FIXMEs, CHANGEDs, etc. in your project.
		- [tokamak-terminal](https://atom.io/packages/tokamak-terminal) - A terminal package for Atom, complete with themes, API and more for Tokamak IDE. Fork of terminal-plus.
		- [vim-mode-plus](https://atom.io/packages/vim-mode-plus) - vim-mode improved
		- [wakatime](https://atom.io/packages/wakatime) - Fitbit for programmers. Get automated metrics and insights about your programming.

## Installation

```bash
curl -L https://raw.githubusercontent.com/Kutsan/dotfiles/master/.tools/install.sh | bash
```

## Credits

> _Logo from [jglovier/dotfiles-logo]_

[screenshot]: https://i.imgur.com/luTixwP.png
[jglovier/dotfiles-logo]: https://github.com/jglovier/dotfiles-logo
