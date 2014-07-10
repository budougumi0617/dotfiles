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
homeshick symlink dotfiles
````

---

## Directroy Composition

````
dotfiles
├── .gitmodules
└── home
    ├── .gitconfig
    ├── .oh-my-zsh
    ├── .oh-my-zsh-custom
    │   ├── example.zsh
    │   ├── mySetting.zsh
    │   ├── myThemes.zsh-theme
    │   └── plugins
    │       └── example
    │           └── example.plugin.zsh
    ├── .screenrc
    ├── .vim
    │   └── bundle
    │       ├── neobundle.vim
    │       ├── nerdtree
    │       └── unite.vim
    ├── .vimrc
    ├── .zsh
    │   ├── z
    │   └── zsh-completions
    ├── .zshenv
    └── .zshrc
````
