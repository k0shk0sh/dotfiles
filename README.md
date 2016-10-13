<img alt="dotfiles" width="200" src="https://raw.githubusercontent.com/jglovier/dotfiles-logo/master/dotfiles-logo.png">

![Terminal Screenshot][screenshot]

## Uses
- **[Vim](http://www.vim.org)** - The ubiquitous text editor
    - [VimPlug](https://github.com/junegunn/vim-plug) - Plugin manager
        - [NERDTree](https://github.com/scrooloose/nerdtree) - A tree explorer
        - [Airline](https://github.com/vim-airline/vim-airline) - Statusline bar & tabline
            - [Laederon](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/laederon.vim) - Theme
            - [Tmuxline](https://github.com/edkolev/tmuxline.vim) - Tmux statusline generator
        - [Auto Pairs](https://github.com/jiangmiao/auto-pairs) - Insert or delete brackets, parens, quotes in pair
        - [vim-javascript](https://github.com/pangloss/vim-javascript) - Vastly improved JavaScript indentation and syntax support
    - [Monokai](https://github.com/crusoexia/vim-monokai) - Color scheme
- **[Zsh](http://www.zsh.org)** - A Unix shell
    - [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) - Framework for managing Zsh configuration
        - [git](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#git) - Git aliases and functions
        - [tmux](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#tmux) - Several options for effecting the startup behavior of tmux
        - [osx](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#osx) - A few shortcuts for native Mac OS features
        - [z](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z) - Tracks your most used directories, based on frecency
        - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Command highlighting
        - [history](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#history) - Command line history
- **[Homebrew](http://brew.sh/)** - Package manager for Mac OS
    - [Git](https://git-scm.com) - Distributed version control system
    - [Tmux](https://tmux.github.io) - Terminal multiplexer
    - [NodeJS](https://nodejs.org) - JavaScript runtime environment for developing a diverse variety of tools and applications
      - [NPM](https://www.npmjs.com) - Node Package Manager
          - [ngrok](https://www.npmjs.com/package/ngrok) - Secure tunnels to localhost
    - [git-extras](https://github.com/tj/git-extras) - Extra commands for Git
    - [GnuPG](https://www.gnupg.org) - Replacement for Symantec's PGP cryptographic software suite
    - [Keybase](https://keybase.io) - Publicly auditable proofs of identity
    - [Tree](http://mama.indstate.edu/users/ice/tree) - Recursive directory listing
    - [Trash](https://github.com/sindresorhus/trash) - Move files and folders to the trash
- **[iTerm](https://www.iterm2.com)** - Terminal emulator for Mac OS
    - [Meslo LG S](https://github.com/powerline/fonts) - Font
    - [Monokai](https://github.com/Kutsan/dotfiles/blob/master/.config/iterm/monokai.itermcolors) - Color scheme
- **[Termux](https://play.google.com/store/apps/details?id=com.termux)** - Terminal emulator for Android
    - [Styling](https://play.google.com/store/apps/details?id=com.termux.styling) - Color schemes and powerline-ready font support

## Installation

:warning: _Do not install if you don't know what you are doing._

```bash
$ cd
$ git init
$ git remote add origin https://github.com/Kutsan/dotfiles.git
$ git fetch origin
$ git checkout --force -b master --track origin/master
```

#### Vim

    :PlugInstall

## Credits

> _Logo from [jglovier/dotfiles-logo]_

[screenshot]: http://i.imgur.com/cDfUrgx.png
[jglovier/dotfiles-logo]: https://github.com/jglovier/dotfiles-logo