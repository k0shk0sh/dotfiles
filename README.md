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

## Installation

The following installation script is compatible with Android (via Termux), Linux (Debian and Ubuntu based distributions) and Mac OS. But be aware, a “dotfiles” is a very personal thing, a question of taste. Look the source code first, before you install. Also, you may need a Powerline compatible font for special characters.

```bash
curl -L https://raw.githubusercontent.com/Kutsan/dotfiles/master/.tools/install.sh | bash
```

## Credits

> _Logo from [jglovier/dotfiles-logo]_

[screenshot]: https://i.imgur.com/luTixwP.png
[jglovier/dotfiles-logo]: https://github.com/jglovier/dotfiles-logo
