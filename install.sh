#!/bin/sh
# Install Xcode and command line tool
# Select Xcode
sudo xcode-select --switch /Applications/Xcode.app

# Install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor

# Tap additional repos
brew tap homebrew/dupes

# Install brew packages
brew install gcc python python3 tmux wget openssl mongodb redis ack git git-flow

# Install necessary python package
brew install freetype
pip install argparse pylint virtualenv virtualenvwrapper numpy scipy matplotlib scikit-learn ipython colout

# Install neovim
brew tap neovim/neovim
brew install --HEAD neovim
pip install neovim
ln -s /usr/local/bin/nvim /usr/local/bin/vim

# Install Vundle plagins for Vim
git clone http://github.com/mutewinter/dot_vim.git ~/.vim

echo << EOF > ~/.vim/vundle_plugins/custom/rust.vim
if exists('g:vundle_installing_plugins')
  Plugin 'rust-lang/rust.vim'
  finish
endif
EOF

cd ~/.vim && scripts/setup
# Compile bundle YouCompleteMe
cd bundle/YouCompleteMe && ./install.sh && cd ~

# Install homebrew-cask
brew install caskroom/cask/brew-cask
brew cask install skype google-chrome spectacle iterm2 vlc calibre sourcetree sublime-text mou utorrent postgres vagrant virtualbox shuttle steam teamviewer spotify evernote cloud dash pycharm
# Install quicklook plugin
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package --force && qlmanage -r
# Setup Iterm2 to have option key as Meta key (set profile's option key to +Esc)

# Install powerline font
git clone https://github.com/Lokaltog/powerline-fonts.git
# Install tomorrow-theme
git clone https://github.com/chriskempson/tomorrow-theme.git

cd powerline-fonts/AnonymousPro
/Applications/Font\ Book.app/Contents/MacOS/Font\ Book Anonymice\ Powerline.ttf Anonymice Powerline Bold Italic.ttf Anonymice Powerline Bold.ttf Anonymice Powerline Italic.ttf
echo 'You should manually set fonts for console & vim'
cd ~

# Powerline
git clone https://github.com/milkbikis/powerline-shell
cd powerline-shell
cp config.py.dist config.py
./install.py
cd -

# Bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh


# Symlink all dotfiles to home directories
ln -s ~/environment/bashrc ~/.bashrc
ln -s ~/environment/gitconfig ~/.gitconfig


# Install ruby
\curl -sSL https://get.rvm.io | bash -s stable
source "$HOME/.rvm/scripts/rvm"
command rvm install ruby-head
rvm use ruby-head

# Install nvm
curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash
source ~/.nvm/nvm.sh
# Install nodejs
nvm install 0.10
nvm use 0.10
# Install necessary npm packages
npm -g install bower generator-kraken mocha browserify generator-mocha nodemon bytewiser generator-webapp coffee-script grunt pageres csslint grunt-cli pm2 cssmin gulp promise-it-wont-hurt envify harp protractor eslint ionic react-tools express jade sass expressworks jshint sequelize forever jsonlint tldr functional-javascript-workshop less uglifyjs generator-angular levelmeup yo generator-gulp-webapp meteorite generator-karma minify

# Install Tmux + Tmuxinator
brew install tmux
gem install tmuxinator
