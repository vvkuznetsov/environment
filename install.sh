#!/bin/sh
# Install Xcode and command line tool
# Select Xcode
sudo xcode-select --switch /Applications/Xcode6-Beta6.app

# Install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# Tap additional repos
brew tap homebrew/dupes

# Install zsh and other packages
brew install rbenv zsh python python3 tmux wget openssl zsh-syntax-highlighting mongodb redis ack 

# Install macvim
brew install vim --with-python --with-ruby --with-perl
brew install macvim --override-system-vim

# Install Vundle plagins for Vim
git clone http://github.com/mutewinter/dot_vim.git ~/.vim
cd ~/.vim && scripts/setup
# Compile bundle YouCompleteMe
cd bundle/YouCompleteMe && ./install.sh && cd ~

# Install homebrew-cask
brew tap phinze/hombrew-cask
brew install brew-cask
brew cask install skype google-chrome spectacle iterm2 vlc calibre f-lux sourcetree sublime-text mou u-torrent postgres vagrant virtualbox shuttle
# Install quicklook plugin
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package --force && qlmanage -r
# Setup Iterm2 to have option key as Meta key (set profile's option key to +Esc)

# Install peco
brew tap peco/peco
brew install peco

# Install powerline font
git clone git@github.com:Lokaltog/powerline.git
git clone git@github.com:Lokaltog/powerline-fonts.git
# Install tomorrow-theme
git clone git@github.com:chriskempson/tomorrow-theme.git

# Install necessary python package
pip install pylint virtualenv virtualenvwrappers numpy scipy matplotlib scikit-learn ipython colout easy_install ipython[zmq, qtconsole, notebook, test]

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

# Symlink all dotfiles to home directories

#Configure git
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global color.ui true

# Install ruby
\curl -sSL https://get.rvm.io | bash -s stable
source "$HOME/.rvm/scripts/rvm"
command rvm install ruby-head
rvm use ruby-head

# Install nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
# Install nodejs
nvm install 0.10
nvm use 0.10
# Install necessary npm packages
npm -g install bower generator-kraken mocha browserify generator-mocha nodemon bytewiser generator-webapp coffee-script grunt pageres csslint grunt-cli pm2 cssmin gulp promise-it-wont-hurt envify harp protractor eslint ionic react-tools express jade sass expressworks jshint sequelize forever jsonlint tldr functional-javascript-workshop less uglifyjs generator-angular levelmeup yo generator-gulp-webapp meteorite generator-karma minify

# Install Tmux + Tmuxinator
brew install tmux
gem install tmuxinator
