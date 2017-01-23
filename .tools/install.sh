info() {
	echo -e "\n\033[32m  info \033[0m$1\n"
}
info__oneline() {
	echo -e "\033[32m  info \033[0m$1"
}
error() {
	echo -e "\n\033[31m  error \033[0m$1\n"
}
warn() {
	echo -e "\n\033[33m  warning \033[0m$1\n"
}
warn__oneline() {
	echo -e "\033[33m  warning \033[0m$1"
}
log() {
	echo -e "  $1"
}

echo ''
echo -e "\033[1m  #\033[0m Kutsan's dotfiles\033[30m\033[1m from https://github.com/Kutsan/dotfiles \033[0m\n"
log 'This script can change your entire setup.'
log 'I recommend to read first. You can even copy commands one by one.'
read -p "$(warn__oneline 'Are you sure you want to install it? (y/n): ')" -n 1 -r
echo ''

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	error 'Installation failed'
	exit 0
fi

info "Installation has been started"

cd $HOME
mkdir BACKUP
mv .zshrc .git .vim .oh-my-zsh BACKUP

APPS=(
	git
	zsh
	vim
	tmux
	nodejs
	ranger
	nmap
	gnupg
	fzf
)

if [[ $(uname -o) = "Android" ]]; then
	APPS=(
		$APPS
		man
		silversearcher-ag
	)

	info "apt update"
	apt update

	info "apt install -y $APPS"
	apt install -y $APPS

	info "Oh My Zsh"
	sh -c "$(curl -fsSL https://raw.github.com/skeevy420/oh-my-zsh/skeevy420-termux/tools/install.sh)"

	info "termux-setup-storage"
	termux-setup-storage

elif [[ $(uname) = "Linux" ]]; then
	APPS=(
		$APPS
		npm
		trash-cli
		silversearcher-ag
	)

	info "NodeJS"
	curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

	info "sudo apt update"
	sudo apt update

	info "sudo apt -y install $APPS"
	sudo apt -y install $APPS

	info "Oh My Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	info "fzf"
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

elif [[ $(uname) = "Darwin" ]]; then
	APPS=(
		$APPS
		trash
		the_silver_searcher
	)

	if ! which brew > /dev/null; then
		info "Homebrew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	info "brew install $APPS"
	brew install $APPS

	info "Oh My Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

else
	error "Incompatible platform"
	exit 1
fi

info "dotfiles"
git init
git remote add origin https://github.com/Kutsan/dotfiles.git
git fetch origin
git checkout --force -b master --track origin/master
git submodule update --init --recursive

info "VimPlug"
curl -Lo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

info "vim +PlugInstall +qa"
vim +PlugInstall +qa;

info "Installation successfully completed"
