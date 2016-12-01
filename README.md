


#Manual installation
  
---
### Homebrew

#### Install Homebrew: 
```sh
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

#### Install brew bundler
```sh
brew tap Homebrew/bundle
```

#### Download brewfile
```sh
curl  -Ss https://raw.githubusercontent.com/dawidof/Mac-Os-start/master/Brewfile \
--output ~/.Brewfile
```

#### Install brew packages
```sh
brew bundle --file=~/.Brewfile
```
---