### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

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

# Color for directory path
POWERLEVEL9K_DIR_HOME_FOREGROUND="255"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="255"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="255"

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
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(rbenv)#background_jobs virtualenv rbenv rvm time)


# How to show current directory path.
# https://github.com/bhilburn/powerlevel9k/blob/master/README.md#dir
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %y/%m/%d}"

POWERLEVEL9K_STATUS_VERBOSE=false
export DEFAULT_USER="$USER"
# End of powerlevel9k settings.

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
zinit light yous/vanilli.sh

# Additional completion definitions for Zsh
zinit ice wait'!0'; zinit light zsh-users/zsh-completions

# Load the theme.
zinit light bhilburn/powerlevel9k

autoload -Uz compinit
compinit
# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
# brew install zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ZSH port of Fish shell's history search feature
zinit light zsh-users/zsh-history-substring-search

# Tracks your most used directories, based on 'frecency'.
# zinit load rupa/z


# This plugin adds many useful aliases and functions.
zinit ice wait'!0'; zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice wait'!0'; zinit snippet OMZ::plugins/tig/tig.plugin.zsh
zinit ice wait'!0'; zinit snippet OMZ::plugins/docker/_docker
zinit ice wait'!0'; zinit snippet OMZ::plugins/cp/cp.plugin.zsh

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

# ブランチ情報を取得するときはhubコマンドでなく、直接gitコマンドを利用する
# zstyle ':vcs_info:git:*:-all-' command /usr/bin/git
# function git(){hub "$@"}

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
# function cd() {
#    builtin cd $@ && ls;
# }


#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
export GVM_DIR="/Users/budougumi0617/.gvm"
[[ -s "/Users/budougumi0617/.gvm/bin/gvm-init.sh" ]] && source "/Users/budougumi0617/.gvm/bin/gvm-init.sh"

# added by travis gem
[ -f /Users/budougumi0617/.travis/travis.sh ] && source /Users/budougumi0617/.travis/travis.sh


# Peco setting

function peco-src () {
    local repo=$(ghq list | peco --query "$LBUFFER" --initial-filter=Fuzzy)
    if [ -n "$repo" ]; then
        repo=$(ghq list --full-path --exact $repo)
        BUFFER="cd ${repo}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# Peco with godoc to show go documentation.
function peco-godoc() {
    local selected_dir=$(ghq list --full-path | peco --initial-filter=Fuzzy)
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

# Peco with history to searh histories.
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
# bindkey '^R' peco-history-selection

# Reload
alias szshrc='source ~/.zshrc'

# To accept the current suggestion.
bindkey '^ ' autosuggest-accept

load_if_exists "$HOME/.iterm2_shell_integration.zsh"

# load_if_exists "$GOPATH/src/github.com/sachaos/todoist/todoist_functions.sh"

eval $(/usr/libexec/path_helper -s)

# for homebrew
if [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# Load anyenv
if [ -e "$HOME/.anyenv" ]; then
    eval "$(anyenv init -)"
fi

# Load rbenv
if [ -e "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/shims:$PATH"
    eval "$(rbenv init - zsh)"
fi

# Load nodenv
if [ -e "$HOME/.nodenv" ]; then
    export PATH="$HOME/.nodenv/bin:$PATH"
    export PATH="$HOME/.nodenv/shims:$PATH"
    eval "$(nodenv init - zsh)"
fi

# Set GOPATH for Go
if command -v go &> /dev/null; then
    [ -d "$HOME/go" ] || mkdir "$HOME/go"
    export GOPATH="$HOME/go"
    export PATH="$PATH:$GOPATH/bin"
fi


# Set grep options
export GREP_OPTIONS='--color=auto'

export PATH="$HOME/.fastlane/bin:$PATH"

# Use colordiff.
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi
# tmuxを新規セッションを立ち上げた際に分割処理設定を読み込む
alias tmuxx="tmux -2 attach || tmux -2 new-session \; source-file ~/.tmux/new-session"

# envrc
eval "$(direnv hook zsh)"

# For gcloud setting
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc";
fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  zinit ice wait'0'; source "$HOME/google-cloud-sdk/completion.zsh.inc";
fi

# Use kubectl completion
function kubectl () {
  local kubectl="$(whence -p kubectl 2> /dev/null)"
  [ -z "$_lazy_kubectl_completion" ] && {
    echo "\e[31m$0 completion zsh\e[0m" > /dev/stderr
    source <("$kubectl" completion zsh)
    _lazy_kubectl_completion=1
  }
  "$kubectl" "$@"
}

# Use Helm completion
function helm () {
  local helm="$(whence -p helm 2> /dev/null)"
  [ -z "$_lazy_helm_completion" ] && {
    echo "\e[31m$0 completion zsh\e[0m" > /dev/stderr
    source <("$helm" completion zsh)
    _lazy_helm_completion=1
  }
  "$helm" "$@"
}

# For kubectl
alias kc='kubectl'
alias kcgp='kubectl get pod -o wide'

# For fzf setting
# Try highlight, coderay, rougify in turn, then fall back to cat
export FZF_DEFAULT_OPTS="--height 60% --preview 'head -100 {}'"
# CTRL-T - Paste the selected files and directories onto the command line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use peco only history command
bindkey '^R' peco-history-selection

# Like Linux command
alias ll='ls -n'

# Remove no longer needed local branches
alias gbm='git branch --merged | grep -vE '\''^\*|main$|master$|develop$|development$'\'' | xargs -I % git branch -d %'

# Set cargo to PARH for Rust
export PATH="$HOME/.cargo/bin:$PATH"

# go get -u github.com/mattn/todo
alias ta='todo add'
alias tl='todo list'
alias td='todo done'

# Instead of ps auxf. Show parant PID
alias psf='(){ ps -eo pid,ppid,pgid,sig,sigmask,nsigs,command |egrep "COMMAND|$1" }'

# Alias for translate
# Required https://github.com/soimort/translate-shell
alias tja='trans :ja'

# For Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.local/bin:$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Useful alias
alias fcd='cd $(fd . --full-path ${HOME} -t d | fzf)'
alias tf=terraform
alias lzd='lazydocker'

# How to use bookmarks in bash/zsh
# https://threkk.medium.com/how-to-use-bookmarks-in-bash-zsh-6b8074e40774
if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=".:$HOME/.bookmarks:/"
    alias goto="cd -P"
fi
