# Created by newuser for 4.3.10
#なるべくbashの設定を使う
source ~/.bashrc


#------------------------------
# General Settings
# ------------------------------
export EDITOR=vim        # エディタをvimに設定
export LANG=en_US.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

bindkey -d  # いったんキーバインドをリセット
bindkey -e  # emacsモードで使う
# bindkey -a  # vicmdモード
# bindkey -v # viinsモード

### Complement ###
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
setopt nonomatch               # ワイルドカード補完回避


bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

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
## Aliases ###
#時刻を表示させる
#alias history='history -E'

# cdコマンド実行後、lsを実行する
function cd() {
   builtin cd $@ && ls;
}
# ------------------------------------------------------------------------
# anyenv
# ------------------------------------------------------------------------
if [ -d ${HOME}/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$HOME/.anyenv/shims:$PATH"
  eval "$(anyenv init -)"
fi

# ------------------------------------------------------------------------
# rbenv
# ------------------------------------------------------------------------
if [ -d ${HOME}/.rbenv ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  source ~/.rbenv/completions/rbenv.zsh
fi
# ------------------------------------------------------------------------
# keybind For OpenSUSE12.1
# ------------------------------------------------------------------------
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# ------------------------------------------------------------------------
# zsh-completions
# ------------------------------------------------------------------------
if [ -d ${HOME}/.zsh/zsh-completions/src ] ; then
#    fpath=(${HOME}/.zsh/zsh-completions/src $fpath)
fi
#autoload -Uz compinit; compinit # 補完機能を有効にする

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
