#For use to Screeen Command
# http://myfuturesightforpast.blogspot.jp/2013/11/zshgnu-screenhomeend.html

#bindkey "^[[5~" # PageUp
#bindkey "^[[6~" # PageDown
bindkey "^[[3~" delete-char

## Home and End key mapping
# for cygwin
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
# for linux
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
# for screen
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
