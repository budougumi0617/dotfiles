dotfiles
========

My setting files

---

## How To Use This Repository

````zsh
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
printf '\nsource "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"' >> $HOME/.bashrc
source $HOME/.bashrc
homeshick clone https://github.com/budougumi0617/dotfiles.git
cd $HOME/.homesick/repos/dotfiles
git submodule init
git submodule update
homeshick symlink dotfiles
brew bundle --file=~/.Brewfile
````
