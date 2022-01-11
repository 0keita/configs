### 1. ひたすらインストール
#### tools
  * [HHKB](https://www.pfu.fujitsu.com/hhkeyboard/macdownload.html)
  * [Google日本語入力](https://www.google.co.jp/ime/)
  * [Chrome](https://www.google.com/intl/ja_ALL/chrome/)
  * [Clipy](https://clipy-app.com/)
  * [Alfred](https://www.alfredapp.com/)
  * [Notion](https://www.notion.so/desktop)

#### private
  * [Spotify](https://www.spotify.com/jp/download/mac/)
  * Kindle
  * honto
  * DMM books

#### development
  * Xcode
  * [iterm2](https://www.iterm2.com/) or [kitty](https://sw.kovidgoyal.net/kitty/)
  * [Android Studio](https://developer.android.com/studio/?hl=ja)
  * [Zoom](https://zoom.us/download)
  * [Slack](https://slack.com/intl/ja-jp/downloads/mac)
  * [Docker Desktop](https://hub.docker.com/editions/community/docker-ce-desktop-mac/)
  * [Visual Studio Code](https://code.visualstudio.com/download)
  * [Postman](https://www.postman.com/downloads/)

todo
- hack類の解凍
- nvimの変換とか対応
- keychain



1. homebrew
https://brew.sh/
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
```

1. zsh
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
brew tap homebrew/cask-fonts
brew install --cask font-ricty-diminished
```

1. peco
```sh
brew install peco
```

1. github
```sh
cp configs/github/.gitconfig ~/
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

1. Visual Studio Code
```sh
cp -rf configs/.vscode ~/
cp visual_studio_code_user/* /Users/yoshida_keita/Library/Application\ Support/Code/User/
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
```sh
brew install carthage
```

1. androidtool
```sh
brew cask install androidtool
```

1. neovim
```sh
pyenv virtualenv 2.7.15 py2neovim
pyenv virtualenv 3.7.1 py3neovim

pip3 install neovim

gem install neovim

cd ~/.config/nvim/.dein
sh ./installer.sh
```

1. carthage
```sh
brew install carthage
```
