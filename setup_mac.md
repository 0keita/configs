1. ひたすらインストール
  * Xcode
  * [Google日本語入力](https://www.google.co.jp/ime/)
  * [Chrome](https://www.google.com/intl/ja_ALL/chrome/)
  * [Clipy](https://clipy-app.com/)
  * [iterm2](https://www.iterm2.com/)
  * [Android Studio](https://developer.android.com/studio/?hl=ja)
  * [Android Studio](https://developer.android.com/studio/?hl=ja)
1. Xcode
1. iterm2

todo
hack類の回答

nvimの変換とか対応
keychain



1. homebrew
https://brew.sh/
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
```

1. zhs
```sh
brew install zsh

echo '/usr/local/bin/zsh' >> /etc/shells

# install https://github.com/sorin-ionescu/prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

cp -rf configs/prezto/.zpreztorc ~/

git clone https://github.com/typeDog/prezto
cp -rf prezto/modules/my_* prezto/modules/custom .zprezto/modules

chsh -s /usr/local/bin/zsh

git clone https://github.com/typeDog/configs
cp -rf configs/.config ./

# font
brew tap sanemat/font
brew install --powerline --vim-powerline ricty

# color theme
git clone https://github.com/aereal/dotfiles
```

1. peco
```sh
brew install peco
```

1. github
```sh
cp configs/github/.gitconfig ~/
```

1. ruby
```sh
brew install rbenv
rbenv init
rbenv install 2.6.0
rbenv rehash
rbenv global 2.6.0
```

1. python
```sh
brew install pyenv pyenv-virtualenv
# zlibでコケたときのみ
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

brew install rbenv
```

1. swift
```sh
git clone https://github.com/kylef/swiftenv.git ~/.swiftenv<Paste>

```

1. carthage
```
brew install carthage
```

1. androidtool
```
brew cask install androidtool
```

1. neovim
```
pyenv virtualenv 2.7.15 py2neovim
pyenv virtualenv 3.7.1 py3neovim

pip3 install neovim

gem install neovim

cd ~/.config/nvim/.dein
sh ./installer.sh
```

1. carthage
```
brew install carthage
```
