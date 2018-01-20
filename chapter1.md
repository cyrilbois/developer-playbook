# Initial Setup

* Serverless Development Environment for Python and Node Developers:
  * OSX
  * python + packages
  * javascript + packages

Install Prerequesits Package Manger Homebrew and CLI Tools:
```
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install Runtime for Javascript and Python:
```
brew install node python3
```

Install Python packages / Dependencies:
```
pip install virtualenv
```

Install Javascript packages:
```
_don't use global packages but local ones so they are included in the dependencies_
```

Additional tools to improve the developer experience:
```
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install iterm2
brew cask install postman

#install cli apps
brew install git
brew install gcc
brew install vim
git config --global credential.helper osxkeychain
config terminal
https://gist.github.com/kevin-smets/8568070
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9
# insert into ~/.zshrc -> ZSH_THEME="powerlevel9k/powerlevel9k"
# install patched font https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf and set it under iterm preferneces profiles text change fonts size 14
brew install zsh-completion zsh-syntax-highlighting
#add to .zshrc source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#brew install autojump
brew install zsh-syntax-highlighting zsh-autosuggestions
# add to .zshrc source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```


Source: http://sourabhbajaj.com/mac-setup/Python/virtualenv.html



