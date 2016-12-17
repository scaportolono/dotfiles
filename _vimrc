" encode
set encoding=UTF-8
scriptencoding UTF-8

" ファイルタイプ無効化
filetype off

" -----------------------------------------------
" Plugin 
" -----------------------------------------------

" ** NeoBundle
" ** https://github.com/Shougo/neobundle.vim
" ** 事前にNeoBundleのInstallが必要

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" /-- start plugin settings --

" ** NEADTree
" ** ファイルをツリー表示する
" ** https://github.com/scrooloose/nerdtree
NeoBundle 'scrooloose/nerdtree'

" ** vim indent guides 
" ** インデント可視化 
" ** https://github.com/nathanaelkane/vim-indent-guides
NeoBundle 'nathanaelkane/vim-indent-guides'
" 起動時にオンにする
let g:indent_guides_enable_on_vim_startup = 1
" ガイドの横幅
let g:indent_guides_guide_size = 1

" ** vim fugitive
" ** git操作をVim上で 
" ** https://github.com/tpope/vim-fugitive
NeoBundle 'tpope/vim-fugitive'

" ** Lightline 
" ** 入力モードをわかりやすく
" ** https://github.com/itchyny/lightline.vim
NeoBundle 'itchyny/lightline.vim'
" 表示カスタマイズ
let g:lightline = {
    \ 'colorscheme': 'hybrid',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'modified': 'MyModified',
    \   'readonly': 'MyReadonly',
    \   'fugitive': 'MyFugitive',
    \   'filename': 'MyFilename'
    \ }
    \ }
" functions
function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \  &ft == 'vimshell' ? vimshell#get_status_string() :
    \ '' != expand('%:f') ? expand('%:f') : '[No Name]') .
    \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            return fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

" ** lightline-hybrid 
" ** lightline用のカラースキーム
" ** https://github.com/cocopon/lightline-hybrid 
NeoBundle 'cocopon/lightline-hybrid.vim'

" ** vimdoc 
" ** 日本語ヘルプ
" ** https://github.com/vim-jp/vimdoc-ja 
NeoBundle 'vim-jp/vimdoc-ja'

" ** vim emmet
" ** emmet
" ** https://github.com/mattn/emmet-vim
NeoBundle 'mattn/emmet-vim'
" keybind
let g:user_emmet_leader_key='<Space>t'

" ** vim hybrid 
" ** 色(hybrid) 
" ** https://github.com/w0ng/vim-hybrid 
NeoBundle 'w0ng/vim-hybrid'

" ** colorizer 
" ** 色プレビュー君
" ** https://github.com/lilydjwg/colorizer
NeoBundle 'lilydjwg/colorizer'

" ** unite.vim 
" ** ゆないと。 
" ** https://github.com/Shougo/unite.vim
NeoBundle 'Shougo/unite.vim'
" 起動時にinsert modeになるように
let g:unite_enable_start_insert = 1

" ** neomru.vim 
" ** 最近使ったファイル
" ** https://github.com/Shougo/neomru.vim
NeoBundle 'Shougo/neomru.vim'

" ** EditorConfig 
" ** 他環境間のフォーマット設定
" ** https://github.com/editorconfig/editorconfig-vim
NeoBundle 'editorconfig/editorconfig-vim'

" ** othree/html5 
" ** HTML5のindent 
" ** https://github.com/othree/html5.vim 
NeoBundle 'othree/html5.vim'

" ** fatih/vim-go
" ** golang用プラグイン 
" ** https://github.com/fatih/vim-go 
NeoBundle 'fatih/vim-go'
let g:go_def_reuse_buffer = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1

" ** kannokanno/previm 
" ** Markdown preview 
" ** https://github.com/kannokanno/previm
NeoBundle 'kazuph/previm', 'feature/add-plantuml-plugin'
let g:previm_open_cmd = 'open -a Google\ Chrome'

" ** aklt/plantuml-syntax
" ** plantuml syntax 
" ** https://github.com/aklt/plantuml-syntax
NeoBundle 'aklt/plantuml-syntax'

" ** tsuyoshiwada/slack-memo-vim 
" ** memo to slack 
" ** https://github.com/tsuyoshiwada/slack-memo-vim 
NeoBundle 'tsuyoshiwada/slack-memo-vim', {'depends': 'mattn/webapi-vim'}
" require setting 'g:slack_memo_token' and 'g:slack_memo_channel'
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

" ** mattn/webapi-vim 
" ** vim interface to Web API  
" ** https://github.com/mattn/webapi-vim 
NeoBundle 'mattn/webapi-vim'

" ** Plugin Name
" ** Plugin Detail
" ** plugin URL
" -- end plugin settings --/

call neobundle#end()
NeoBundleCheck

" -----------------------------------------------
" Color Scheme 
" -----------------------------------------------

let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
set background=dark

" -----------------------------------------------
" Vim Options
" -----------------------------------------------

" ** 自動シンタックス
syntax on
" ** 行数表示
set number
" ** 現在の行をステータスに出す
set ruler
" ** 現在の行をハイライトする
set cursorline
" ** ソフトタブ
set expandtab
" ** インデントの深さ
set tabstop=4
" ** 自動インデントの深さ
set shiftwidth=4
" ** 空白タブ文字等を可視化
set list
" ** listの表示文字設定
set listchars=eol:`,tab:>-
" ** インクリメンタルサーチ
set incsearch
" ** 検索結果のハイライト
set hlsearch
" ** 対応する括弧の表示
set showmatch
" ** 検索ループしない
set nowrapscan
" ** 検索で大文字小文字無視する
set ignorecase
" ** コマンドの記録数
set history=500
" ** ステータスを常に表示する
set laststatus=2
" ** 入力中のコマンドを表示
set showcmd
" ** swpいらない
set noswapfile
" ** backspace(delete)有効
set backspace=2

" ファイルタイプ有効
filetype plugin indent on

" -----------------------------------------------
" filetype 
" -----------------------------------------------
au BufRead,BufNewFile *.tt set filetype=html

" -----------------------------------------------
" Mappings
" -----------------------------------------------

"  Leaderキーをデフォルトの\から<Space>に
let g:mapleader = "\<Space>"

" ** Normal Mode

" 保存 
nnoremap <Leader>w :w<CR>
" vimrcの編集
nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
" vimrcの反映
nnoremap <F6> :<C-u>source $MYVIMRC<CR>
" ツリー表示(pulgin)
nnoremap <Leader>e :NERDTreeToggle<CR>
" MarkList
nnoremap <Leader>m :<C-u>marks<CR>
" Unite buffer(plugin)
nnoremap <Leader>h :Unite file_mru<CR>

" godef newtab(plugin)
nmap <Leader>gd <Plug>(go-def-tab)

" ** Normal Mode & Visual Mode

" :を入力しやすく
noremap ; :
noremap : ;

" ** Insert Mode

" 括弧を打ったら一つ戻って括弧の中へ
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
" カリキュレータ起動
inoremap <Space><Space>= <C-r>=
" 入力モードでもhjklで移動したい
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" 入力モードで行頭行末へのジャンプ
inoremap <C-e> <END>
inoremap <C-a> <HOME>

