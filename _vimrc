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
" NormalMode時にctrl-Eでツリー表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" ** vim indent guides 
" ** インデント可視化 
" ** https://github.com/nathanaelkane/vim-indent-guides
NeoBundle 'nathanaelkane/vim-indent-guides'
" 起動時にオンにする
let g:indent_guides_enable_on_vim_startup = 1
" ガイドの横幅
let g:indent_guides_guide_size = 1

" ** Lightline 
" ** 入力モードをわかりやすく
" ** https://github.com/itchyny/lightline.vim
NeoBundle 'itchyny/lightline.vim'

" ** Plugin Name
" ** Plugin Detail
" ** plugin URL

" -- end plugin settings --/

call neobundle#end()
NeoBundleCheck

" -----------------------------------------------
" Color Scheme 
" use https://github.com/w0ng/vim-hybrid
" -----------------------------------------------

let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

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
" ** エンコード
set encoding=UTF-8
" ** 入力中のコマンドを表示
set showcmd

" ファイルタイプ有効
filetype plugin indent on
