"--------------------------------------------------------------------------
"" neobundle
set nocompatible
filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif


NeoBundleFetch 'Shougo/neobundle.vim'

"Add plugin
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'

filetype plugin indent on

" Installation check.
if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
                \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    "finish
endif

" end of neobundle setting

"#####表示設定#####
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" カーソルの行を強調
set cursorline

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

"highlight search word
set hlsearch

"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

"スペースでダウンアップ
nnoremap <Space>  <C-E>
nnoremap <C-Space> <C-Y>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" jjをESCキー
inoremap <silent> jj <esc>
" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 挿入モードでバックスペース
inoremap <C-x> <BS>

set expandtab 
set tabstop=4
set shiftwidth=4
set softtabstop=4 
set autoindent
set smartindent

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" ---  ファイラーを起動 ---
nnoremap <silent><Space>j    :Explore<CR>


""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
  autocmd!
  autocmd InsertEnter * call s:StatusLine('Enter')
  autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
 if a:mode == 'Enter'
   silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
   silent exec g:hi_insert
 else
   highlight clear StatusLine
   silent exec s:slhlcmd
 endif
endfunction

function! s:GetHighlight(hi)
 redir => hl
 exec 'highlight '.a:hi
 redir END
 let hl = substitute(hl, '[\r\n]', '', 'g')
 let hl = substitute(hl, 'xxx', '', '')
 return hl
endfunction


" taglist
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
noremap <Leader>f :TlistToggle<CR>        "

"color scheme
syntax enable
set background=dark
"let g:solarized_termcolors=256
colorscheme torte

""" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" Status line format
" http://www.e2esound.com/wp/2008/08/16/vim%E3%82%B9%E3%83%86%E3%83%BC%E3%82%BF%E3%82%B9%E3%83%A9%E3%82%A4%E3%83%B3%E3%81%AE%E8%A8%AD%E5%AE%9Astatusline/
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

" Show Status line
set laststatus=2

