#!/bin/bash

#install cli tools
#xcode-select --install

#install homebrew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"#!/bin/bash

#install applications
#brew cask install google-chrome
#brew cask install visual-studio-code
#brew cask install docker
#brew cask install calibre
#brew cask install google-backup-and-sync
#brew cask install rambox
#brew cask install vlc
#brew cask install lastpass
#open /usr/local/Caskroom/lastpass/latest/LastPass\ Installer/LastPass\ Installer.app
#brew cask install jdownloader
#brew cask install qbittorrent
#brew cask install java
#brew cask install iterm2
#brew cask install \
#    qlcolorcode \
#    qlstephen \
#    qlmarkdown \
#    quicklook-json \
#    qlprettypatch \
#    quicklook-csv \
#    betterzipql \
#    webpquicklook \
#    suspicious-package
#brew cask install citrix-receiver
#brew cask install the-unarchiver
#brew cask install postman
#brew cask install intellij-idea
#brew cask install minikube
#brew cask install plantuml

#install cli apps
#brew install git
#brew install gcc
#brew install maven
#brew install vim
#git config --global credential.helper osxkeychain
#config terminal
#https://gist.github.com/kevin-smets/8568070
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9
# insert into ~/.zshrc -> ZSH_THEME="powerlevel9k/powerlevel9k"
# install patched font https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf and set it under iterm preferneces profiles text change fonts size 14
brew install zsh-completion zsh-syntax-highlighting
#add to .zshrc source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#brew install autojump
brew install zsh-syntax-highlighting zsh-autosuggestions
# add to .zshrc source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
