# 1. Install
## tools
  * [Google日本語入力](https://www.google.co.jp/ime/)
  * [Chrome](https://www.google.com/intl/ja_ALL/chrome/)
  * [Clipy](https://clipy-app.com/)
  * [Alfred](https://www.alfredapp.com/)
  * [Notion](https://www.notion.so/desktop)

## private
  * [Spotify](https://www.spotify.com/jp/download/mac/)
  * Kindle
  * DMM books

## development
  * Xcode
  * [iterm2](https://www.iterm2.com/) or [Warp](https://www.warp.dev/e)
  * [Android Studio](https://developer.android.com/studio/?hl=ja)
  * [Zoom](https://zoom.us/download)
  * [Slack](https://slack.com/intl/ja-jp/downloads/mac)
  * [Docker Desktop](https://docs.docker.com/desktop/setup/install/mac-install/)
  * [Visual Studio Code](https://code.visualstudio.com/download)
  * [Postman](https://www.postman.com/downloads/)

### shell関連
#### homebrew
https://brew.sh/
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
```

#### zsh
```sh
# install https://github.com/sorin-ionescu/prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

cp -rf configs/prezto/.zpreztorc ~/

git clone https://github.com/0keita/prezto
cp -rf prezto/modules/my_* prezto/modules/custom .zprezto/modules

chsh -s /usr/local/bin/zsh

git clone https://github.com/0keita/configs
cp -rf configs/.config ./

# font
brew tap homebrew/cask-fonts
brew install font-hackgen
brew install font-hackgen-nerd

# peco
brew install peco

# github
cp configs/github/.gitconfig ~/
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
# SSH auth see: https://docs.github.com/en/authentication/connecting-to-github-with-ssh
```

### editors
#### vim
```sh
brew install neovim

# deoplete, see: https://github.com/Shougo/deoplete.nvim
pip3 install --user pynvim
```

#### Visual Studio Code
```sh
cp -rf configs/.vscode ~/
cp visual_studio_code_user/* /Users/yoshida_keita/Library/Application\ Support/Code/User/
```

### Programming
#### Ruby
```sh
brew install rbenv
rbenv init
rbenv install 3.1.0
rbenv rehash
rbenv global 3.1.0
```

#### python
```sh
brew install pyenv pyenv-virtualenv
# zlibでコケたときのみ
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

pyenv install 3.10.6
pyenv install 2.7.18 
pyenv global 3.10.6 2.7.18 
```

### Backend
```sh
# jq
brew install jq
```

### Mobile app
#### iOS
```sh
# swift
git clone https://github.com/kylef/swiftenv.git ~/.swiftenv

# carthage
brew install carthage
```

#### Android
```sh
# androidtool
brew cask install androidtool
```


todo
- hack類の解凍
- nvimの変換とか対応
- keychain
