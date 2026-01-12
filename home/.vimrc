set helplang=ja

" <leader>を"\"から変更
let mapleader = "\<Space>"

" 操作設定
" jjをESCキー
inoremap <silent> jj <esc>

"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" --------------------------------------------

"#####表示設定#####
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set list
set listchars=tab:^\ ,trail:~
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap

" https://budougumi0617.github.io/2018/06/20/setting-vim-gitgutter-column-shows-always/
set signcolumn=yes

" --------------------------------------------

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase  "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan   "検索時に最後まで行ったら最初に戻る
set hlsearch   "highlight search word

"ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>


" --------------------------------------------

set expandtab     "タブ入力を複数の空白入力に置き換える (既存のタブには影響しない)
set tabstop=2     "インデントをスペース2つ分に設定
set shiftwidth=2  "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    "改行時に前の行のインデントを継続する
set smartindent   "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" --------------------------------------------

"color scheme
syntax on
set termguicolors
"---
let g:solarized_termcolors=256
colorscheme torte
set background=dark

" --------------------------------------------

" Show Status line
set laststatus=2

" Status line format
" http://www.e2esound.com/wp/2008/08/16/vim%E3%82%B9%E3%83%86%E3%83%BC%E3%82%BF%E3%82%B9%E3%83%A9%E3%82%A4%E3%83%B3%E3%81%AE%E8%A8%AD%E5%AE%9Astatusline/
set statusline=%f%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]


set spell
set spelllang=en,cjk
hi clear SpellBad
hi SpellBad cterm=underline

set wildmode=list:longest "タブ補完モード

