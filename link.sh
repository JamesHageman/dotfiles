set -ex

ln .zshrc ~/.zshrc
ln .vimrc ~/.vimrc
ln -s ~/.vimrc ~/.config/nvim/init.vim
ln .editorconfig ~/.editorconfig

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

cat brew_leaves.txt | xargs brew install
