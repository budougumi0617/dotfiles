"--------------------------------------------------------------------------
set nocompatible

" Install at start Vim.
augroup PluginInstall
autocmd!
autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" Define installed directory.
let s:plugin_dir = expand('~/.vim/bundle/')
" Add installed path to runtime directory.
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

" git clone if dein.vim is not installed yet.
if !isdirectory(s:dein_dir)
    call mkdir(s:dein_dir, 'p')
    silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)

    " Install plugins.
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('itchyny/lightline.vim')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('Yggdroot/indentLine')
    call dein#add('Townk/vim-autoclose')
    call dein#add('honza/vim-snippets')
    call dein#add('scrooloose/nerdtree')
    call dein#add('fatih/molokai')
    call dein#add('dracula/vim')
    call dein#add('mattn/sonictemplate-vim')
    call dein#add('/usr/local/opt/fzf') " Need that brew install fzf
    call dein#add('junegunn/fzf.vim')
    call dein#add('mileszs/ack.vim')
    call dein#add('andymass/vim-matchup')
    call dein#add('easymotion/vim-easymotion')

    " For CSV
    call dein#add('chrisbra/csv.vim')

    " For Git
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-rhubarb')
    call dein#add('airblade/vim-gitgutter')

    " There is Dependency.
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/neomru.vim')
    call dein#add('ujihisa/unite-colorscheme', {'depends' : 'Shougo/unite.vim'})

    " For Golang.
    call dein#add('fatih/vim-go')
    call dein#add('SirVer/ultisnips')
    call dein#add('majutsushi/tagbar')

    call dein#add('prabirshrestha/async.vim')
    call dein#add('prabirshrestha/vim-lsp')
    call dein#add('prabirshrestha/asyncomplete.vim')
    call dein#add('prabirshrestha/asyncomplete-lsp.vim')
    call dein#add('natebosch/vim-lsc')

    " For Elixir
    call dein#add('elixir-lang/vim-elixir')
    call dein#add('slashmili/alchemist.vim')
    call dein#add('mattreduce/vim-mix')
    call dein#add('janko-m/vim-test')

    " For Ruby, Rails
    call dein#add('vim-ruby/vim-ruby', {'on_ft' : 'ruby'})
    call dein#add('tpope/vim-rails', {'on_ft' : 'ruby'})

    " For JavaScript
    call dein#add('othree/javascript-libraries-syntax.vim', {'on_ft' : ['javascript', 'javascript.jsx']})
    call dein#add('othree/yajs.vim', {'on_ft' : ['javascript', 'javascript.jsx']})
    call dein#add('maxmellon/vim-jsx-pretty', {'on_ft' : ['javascript', 'javascript.jsx']})
    call dein#add('pangloss/vim-javascript', {'on_ft' : ['javascript', 'javascript.jsx']})

    " For Rust
    call dein#add('rust-lang/rust.vim', {'on_ft' : 'rust'})
    call dein#add('autozimu/LanguageClient-neovim', {'on_ft' : 'rust', 'rev' : 'next', 'build': 'bash install.sh'})

    " For JavaScript, Rust
    call dein#add('w0rp/ale', {'on_ft' : ['javascript', 'javascript.jsx', 'rust']})

    " End dein.vim settings.
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on

" <leader>を"\"から変更
let mapleader = "\<Space>"

"#####表示設定#####
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" カーソルの行を強調...は描画が遅くなるので止める
" set cursorline

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

"highlight search word
set hlsearch

"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start


" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" jjをESCキー
inoremap <silent> jj <esc>
" CTRL-jをESCキー
inoremap <silent> <C-j> <esc>

set expandtab     "タブ入力を複数の空白入力に置き換える (既存のタブには影響しない)
set tabstop=2     "インデントをスペース2つ分に設定
set shiftwidth=2  "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    "改行時に前の行のインデントを継続する
set smartindent   "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" For Indent
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.erb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

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
" noremap <leader>f :TlistToggle<CR>

"color scheme
syntax on
set termguicolors
"---
set background=dark
let g:solarized_termcolors=256
colorscheme torte
"---
"let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme molokai
"---
"color dracula

""" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert = 1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_enable_split_vertically = 0
let g:unite_winwidth = 40
" バッファ一覧
nnoremap <silent> <leader>ub :<C-u>Unite buffer <CR>
" ファイル一覧
" nnoremap <silent> <leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file <CR>
nnoremap <silent> <leader>uf :<C-u>Unite file <CR>
" レジスタ一覧
nnoremap <silent> <leader>ur :<C-u>Unite -buffer-name=register register
" 最近使用したファイル一覧
nnoremap <silent> <leader>um :<C-u>Unite file_mru <CR>
" 常用セット
nnoremap <silent> <leader>uu :<C-u>Unite buffer file_mru <CR>
" For Rails
nnoremap <silent> <leader>urc :<C-u>Unite file_rec/async:app/controllers/ <CR>
nnoremap <silent> <leader>urfc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap <silent> <leader>urm :<C-u>Unite file_rec/async:app/models/ <CR>
nnoremap <silent> <leader>urfm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap <silent> <leader>urf :<C-u>Unite file_rec/async:app/forms/ <CR>
nnoremap <silent> <leader>urff :<C-u>Unite file file/new -input=app/forms/ <CR>
nnoremap <silent> <leader>urv :<C-u>Unite file_rec/async:app/views/ <CR>
nnoremap <silent> <leader>urfv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap <silent> <leader>urs :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
nnoremap <silent> <leader>urfs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap <silent> <leader>urj :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
nnoremap <silent> <leader>urfj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap <silent> <leader>uro :<C-u>Unite file_rec/async:config/ <CR>
nnoremap <silent> <leader>urfo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> <leader>url :<C-u>Unite file_rec/async:lib/ <CR>
nnoremap <silent> <leader>urfl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> <leader>urr :<C-u>Unite file_rec/async:spec/ <CR>
nnoremap <silent> <leader>urfr :<C-u>Unite file file/new -input=spec/ <CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" Show Status line
set laststatus=2

" Status line format
" http://www.e2esound.com/wp/2008/08/16/vim%E3%82%B9%E3%83%86%E3%83%BC%E3%82%BF%E3%82%B9%E3%83%A9%E3%82%A4%E3%83%B3%E3%81%AE%E8%A8%AD%E5%AE%9Astatusline/
set statusline=%F%m%r%h%w\%{fugitive#statusline()}\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

"vimのすごい便利なのにあまり使われていない「タブページ」機能
" http://qiita.com/wadako111/items/755e753677dd72d8036d
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>

" vimでctags使ってタグジャンプするときに新しいタブで開く方法
" http://kannokanno.hatenablog.com/entry/20121127/1354019826
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

"tagsファイルを対象のファイルのあるから$HOMEの間まで探索する
set tags=./tags;$HOME


" カッコやクォートの自動補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi{<C-R>z}<ESC>
"vnoremap [ "zdi[<C-R>z]<ESC>
"vnoremap ( "zdi(<C-R>z)<ESC>
"vnoremap " "zdi"<C-R>z"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" Not create backup file as ~file.
set nobackup

" Open file tree.
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" <Space>m でカーソル下の単語、もしくは選択した範囲のハイライトを行う
" 再度 <Space>m を行うとカーソル下のハイライトを解除する
" これは複数の単語のハイライトを行う事もできる
" <Space>M で全てのハイライトを解除する
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

"vim[grep]用
" :vim[grep] {pattern} {file} ...
" ワイルドカードは**(アスタリスク2つ)
" :vim {pattern} `git ls-files ./**/*.go`
" gitでindexされているファイルのみを対象にする。
" 前へ :cnext Goの設定のほうでしてある。
" 次へ :cprevious Goの設定のほうでしてある。
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

":vimgrep、:grep、:Ggrepで自動的にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

" For neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#sources#omni#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"Enable golang autocompletion
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

" Neocomplete for golang
"let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'

" Syntax highlight for javascript library
let g:used_javascript_libs = 'flux'

set autowrite

" For Golang
" Need gopls
" go get -u golang.org/x/tools/cmd/gopls

let g:go_def_mode = 'gopls'
" Disabled vim-go gocode mapping
let g:go_def_mapping_enabled = 1
let g:go_gocode_propose_builtins = 1
" 
" nnoremap <silent> gd :LspDefinition<cr>
" nnoremap <silent> <C-]> :LspDefinition<cr>
" nnoremap <silent> <C-t> <C-O><cr>
" 
" if executable('bingo')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'bingo',
"         \ 'cmd': {server_info->['bingo', '-mode', 'stdio']},
"         \ 'whitelist': ['go'],
"         \ })
" endif

" ビルドエラー時のクイックフィックスを順に移動する。
" <leader>は上の方で変更してある。
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" gocodeによって固まることがないように
let g:gocomplete#system_function = 'vimproc#system'

" Show completion detail.
set completeopt=menu,preview

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
" 単一コマンドで適切なビルドを行う。
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>i <Plug>(go-info)
" ]] -> jump to next function
" [[ -> jump to previous function

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" 有効な識別子にカーソルを移動するたびに、ステータスラインが自動的に更新
let g:go_auto_type_info = 1
set updatetime=100
" ハイライトの強化
let g:go_auto_sameids = 1

" Syntax highlight for Golang
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" Postfix completion by sonictemplate-vim
" https://github.com/mattn/sonictemplate-vim/blob/master/template/go/pattern.stpl
" <C-y> <C-b>

" Need gotags
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
\ }

" Open Tagbar
nmap <F8> :TagbarToggle<CR>

" For Git setting
" http://wakame.hatenablog.jp/entry/2017/05/03/222511
" http://myenigma.hatenablog.com/entry/2016/07/10/084048
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
nnoremap <silent> [fugitive]a :Gwrite<CR>
" 開いたgit画面でコミットするファイルを-で変更できる。その後Cを押すとコミットメッセージ画面になる
nnoremap <silent> [fugitive]c :Gcommit-v<CR>
" blame画面を閉じるときは<C-C>
nnoremap <silent> [fugitive]b :Gblame<CR>
" <C-W> <C-O>でカレントウインドウ以外を閉じる
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]m :Gmerge<CR>

" For gitgutter
set updatetime=250
" Show gitgutter column always
set signcolumn=yes
" 変更をステージにあげる
" nmap <Leader>hs <Plug>GitGutterStageHunk
" 変更をrevertする
" nmap <Leader>hr <Plug>GitGutterRevertHunk

" For fzf setting
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

" For grep
" Need to execute below command
" brew install ag
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>f :Ack<Space>

" For JavaScript
" default : ['eslint', 'flow', 'flow-language-server', 'jscs', 'jshint', 'standard', 'tsserver', 'xo']
" tsserverが有効になっていると、flowプロジェクトで誤検知してしまう
let g:ale_linters = {
       \'javascript': ['eslint', 'flow', 'flow-language-server', 'jscs', 'jshint', 'standard', 'xo']
\}
" let g:ale_fixers = {
"      \ 'javascript': ['prettier']
"      \ }
" let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:javascript_plugin_flow = 1

" For json
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

" For Rust

" Need additional components, need to execute beloew commands
" rustup update
" rustup component add rls-preview --toolchain nightly
" rustup component add rust-analysis --toolchain nightly
" rustup component add rust-src --toolchain nightly

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ }

" Language server is started manualy by :LanguageClientStart
" let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" There is my template
let g:sonictemplate_vim_template_dir = [
      \ '~/.template'
      \]

" 2018/10/18
" Hot fix to https://github.com/mdempsky/gocode/issues/71
let g:go_gocode_propose_source = 0

" For Ruby
" Enabeld rich jump
source $VIMRUNTIME/macros/matchit.vim

" For easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" spell check
" https://vim-jp.org/vimdoc-ja/spell.html
" https://qiita.com/maxmellon/items/26fc44bc8e07e5d5926d#%E3%82%B9%E3%83%9A%E3%83%AB%E3%83%81%E3%82%A7%E3%83%83%E3%82%AF%E3%82%92%E3%81%8A%E3%81%93%E3%81%AA%E3%81%86
" zg Add word
" z= Search correct word
set spell
set spelllang=en,cjk
hi clear SpellBad
hi SpellBad cterm=underline

