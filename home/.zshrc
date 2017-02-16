# Start of powerlevel9k settings.
# See also https://github.com/Falkor/dotfiles/blob/master/oh-my-zsh/
# Font taken from https://github.com/stefano-meschiari/dotemacs/blob/master/SourceCodePro%2BPowerline%2BAwesome%2BRegular.ttf
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# Disable dir/git icons
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

DISABLE_AUTO_TITLE="true"

POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
#POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()#background_jobs virtualenv rbenv rvm time)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=10

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %y/%m/%d}"

POWERLEVEL9K_STATUS_VERBOSE=false
export DEFAULT_USER="$USER"
# End of powerlevel9k settings.

if [[ ! -d ~/.zplug ]];then
    git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh


# enhancd config
export ENHANCD_COMMAND=ed
export ENHANCD_FILTER=ENHANCD_FILTER=fzy:fzf:peco

# Function
load_if_exists () {
    if [ -e $1 ]; then
        source $1
    fi
}

# Vanilla shell
zplug "yous/vanilli.sh"

# Additional completion definitions for Zsh
zplug "zsh-users/zsh-completions"

# Load the theme.
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
zplug "zsh-users/zsh-syntax-highlighting", nice:9

# ZSH port of Fish shell's history search feature
zplug "zsh-users/zsh-history-substring-search", nice:10

# Tracks your most used directories, based on 'frecency'.
zplug "rupa/z", use:"*.sh"


# This plugin adds many useful aliases and functions.
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/golang",   from:oh-my-zsh
zplug "plugins/npm",   from:oh-my-zsh
zplug "plugins/postgres",   from:oh-my-zsh
zplug "plugins/gem",   from:oh-my-zsh
zplug "plugins/rails",   from:oh-my-zsh
zplug "plugins/ruby",   from:oh-my-zsh
zplug "plugins/rbenv",   from:oh-my-zsh
zplug "plugins/sudo",   from:oh-my-zsh
zplug "plugins/tig",   from:oh-my-zsh
zplug "plugins/bundle",   from:oh-my-zsh
zplug "plugins/brew",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/cp",   from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

#なるべくbashの設定を使う
source ~/.bashrc


#------------------------------
# General Settings
# ------------------------------
export EDITOR=vim        # エディタをvimに設定
export LANG=en_US.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす
export TERM="xterm-256color"
export ZDOTDIR=$HOME/.zsh
if [ "$(uname)" = 'Darwin' ]; then
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -G'
else
    eval `dircolors ~/.colorrc`
    alias ls='ls --color=auto'
fi

bindkey -d  # いったんキーバインドをリセット
bindkey -e  # emacsモードで使う
# bindkey -a  # vicmdモード
# bindkey -v # viinsモード


alias cr='echo "before comand result = $?"'
### Complement ###
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
setopt nonomatch               # ワイルドカード補完回避


bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
# 補完の表示方法を変更する
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:options' description 'yes'


### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
# 全履歴を一覧表示する
function history-all { history -E 1 }

# ------------------------------
# Other Settings
# ------------------------------
# cdコマンド実行後、lsを実行する
function cd() {
   builtin cd $@ && ls;
}


# Load rbenv
if [ -e "$HOME/.rbenv" ]; then
    eval "$(rbenv init - zsh)"
fi

# Set GOPATH for Go
if command -v go &> /dev/null; then
    [ -d "$HOME/go" ] || mkdir "$HOME/go"
    export GOPATH="$HOME/go"
    export GOROOT=/usr/local/opt/go/libexec
    export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
export GVM_DIR="/Users/budougumi0617/.gvm"
[[ -s "/Users/budougumi0617/.gvm/bin/gvm-init.sh" ]] && source "/Users/budougumi0617/.gvm/bin/gvm-init.sh"
. <(azure --completion)

# added by travis gem
[ -f /Users/budougumi0617/.travis/travis.sh ] && source /Users/budougumi0617/.travis/travis.sh

function git(){hub "$@"}

# Peco setting

# Peco with ghq to move repositories.
function peco-src () {
    local selected_dir=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        selected_dir="$GOPATH/src/$selected_dir"
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# Peco with godoc to show go documentation.
function peco-godoc() {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        if [ ! -n "$PAGER" ]; then
            PAGER=less
        fi
        BUFFER="godoc ${selected_dir} | $PAGER"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-godoc
bindkey '^g' peco-godoc

alias godoc='godoc $(ghq list | peco) | less'

# Peco with history to searh histories.
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# Reload
alias szshrc='source ~/.zshrc'

# To accept the current suggestion.
bindkey '^ ' autosuggest-accept

load_if_exists "$HOME/.iterm2_shell_integration.zsh"

load_if_exists "$GOPATH/src/github.com/sachaos/todoist/todoist_functions.sh"

