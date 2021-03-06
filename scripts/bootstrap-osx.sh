# Check if homebrew exists
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Brew setup
brew update
brew tap homebrew/bundle
brew bundle --file=$HOME/dotfiles/osx/Brewfile

# Clean up the caches
brew cleanup
brew cask cleanup

# Set the zsh as primary shell
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
ln -nfs $HOME/dotfiles/zsh/themes/bullet-train/bullet-train.zsh-theme $HOME/.oh-my-zsh/themes/bullet-train.zsh-theme

ln -nfs $HOME/dotfiles/osx/.bash_profile $HOME/.bash_profile

[ ! -f $HOME/.zshrc ] && ln -nfs $HOME/dotfiles/.zshrc $HOME/.zshrc
source $HOME/.zshrc

# TODO nvim initialization should be performed at last.
