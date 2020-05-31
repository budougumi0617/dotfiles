" https://knowledge.sakura.ad.jp/23248/
" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}


" --------------------------------------------

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

" For LSP settings
nmap <silent> gd :LspDefinition<CR>
nmap <silent> <C-]> :LspDefinition<CR>
nmap <silent> <f2> :LspRename<CR>
nmap <silent> <Leader>d :LspTypeDefinition<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1

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
set statusline=%F%m%r%h%w\%{fugitive#statusline()}\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]


" --------------------------------------------

" For fzf setting
set rtp+=/usr/local/opt/fzf

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~50%' }
command! FZFFileList call fzf#run({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
            \ 'sink': 'e'})
" Files command with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
nnoremap <C-p> :GFiles<CR>
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" --------------------------------------------
" Spell check

" https://vim-jp.org/vimdoc-ja/spell.html
" https://qiita.com/maxmellon/items/26fc44bc8e07e5d5926d#%E3%82%B9%E3%83%9A%E3%83%AB%E3%83%81%E3%82%A7%E3%83%83%E3%82%AF%E3%82%92%E3%81%8A%E3%81%93%E3%81%AA%E3%81%86
" zg Add word
" z= Search correct word
set spell
set spelllang=en,cjk
hi clear SpellBad
hi SpellBad cterm=underline
