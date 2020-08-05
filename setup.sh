#!/bin/bash

cd $HOME

# Install packages
sudo apt install neovim nmap zsh git tmux curl

# Set default shell to zsh
chsh -s $(which zsh)

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# tmux config
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# neovim
nvim_confdir=$HOME/.config/nvim
mkdir -p $nvim_confdir
ln -sf ../../dotfiles/nvim-init.vim $nvim_confdir/init.vim

# neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sf dotfiles/zshrc $HOME/.zshrc
source $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
