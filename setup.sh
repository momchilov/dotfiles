#!/bin/bash

cd $HOME

# Install packages
sudo apt install neovim nmap zsh git tmux curl htop apt-file

# Set default shell to zsh
chsh -s $(which zsh)

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# tmux config
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
ln -s -f dotfiles/tmux.conf.local $HOME/.tmux.conf.local

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
# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
source $HOME/.zshrc
