#!/usr/bin/env bash

##
# Installs my setup and dotfiles (https://github.com/Kutsan/dotfiles) completely
#
# @author Kutsan Kaplan <me@kutsankaplan.com>
##

info() { echo -e "\n\033[32m  info \033[0m$1\n"; }
info__oneline() { echo -e "\033[32m  info \033[0m$1"; }
error() { echo -e "\n\033[31m  error \033[0m$1\n"; }
warn() { echo -e "\n\033[33m  warning \033[0m$1\n"; }
warn__oneline() { echo -e "\033[33m  warning \033[0m$1"; }
log() { echo -e "  $1"; }

echo ''
echo -e "\033[1m  #\033[0m Kutsan's dotfiles\033[30m\033[1m from https://github.com/kutsan/dotfiles \033[0m\n"
log 'This script can change your entire setup.'
log 'I recommend to read first. You can even copy commands one by one.'
read -p "$(warn__oneline 'Are you sure you want to install it? [y/N] ')" -n 1 -r
echo ''

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	error 'Installation failed. Nothing changed.'
	exit 1
fi

info 'Installation has been started. Your important files will move into ~/.backup folder.'

cd "$HOME" || error "There was an error about \$HOME environment variable. Can't cd into it."; exit 1

mkdir .backup 2>/dev/null
mv 	.zshrc \
	.git \
	.vim \
	.zsh \
	.backup 2>/dev/null

APPS=(
	git
	zsh
	vim
	tmux
	nodejs
	ranger
	nmap
	gnupg
	ripgrep
)

if [[ $(uname -o) = "Android" ]]; then
	APPS+=(
		man
		grep
		sed
		coreutils
		ncurses-utils
	)

	info "apt update"
	apt update

	info "apt install -y --ignore-missing ${APPS[*]}"
	apt install -y "${APPS[*]}"

	info "termux-setup-storage"
	termux-setup-storage

elif [[ $(uname) = "Linux" ]]; then
	APPS+=(
		trash-cli
	)

	info "NodeJS"
	curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

	info "sudo apt update"
	sudo apt update

	info "sudo apt -y --ignore-missing install ${APPS[*]}"
	sudo apt -y --ignore-missing install "${APPS[*]} "

	info "fzf"
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --bin

elif [[ $(uname) = "Darwin" ]]; then
	APPS+=(
		coreutils
		bash
		trash
	)

	info "xcode-select --install"
	xcode-select --install

	if ! hash brew 2> /dev/null; then
		info "Homebrew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	info "brew install ${APPS[*]}"
	brew install "${APPS[*]}"

	info "fzf"
	/usr/local/opt/fzf/install --bin

else
	error "Incompatible platform."
	exit 1
fi

info "dotfiles"
git init && \
git remote add origin https://github.com/kutsan/dotfiles.git && \
git fetch origin && \
git checkout --force -b master --track origin/master && \
git submodule update --init --recursive

info "VimPlug"
curl -Lo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

info "vim +PlugInstall +qa"
vim +PlugInstall +qa;

if (( $? == 0 )); then
	info "Installation completed."

else
	info "Installation completed but not everything installed succesfully."
	exit 1
fi
