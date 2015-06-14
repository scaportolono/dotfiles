" ファイルタイプ無効化
filetype off

" -----------------------------------------------
" Plugin 
" -----------------------------------------------

" ** NeoBundle
" ** https://github.com/Shougo/neobundle.vim

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

" ** Plugin Name
" ** Plugin Detail
" ** plugin URL


" -- end plugin settings --/

call neobundle#end()


" -----------------------------------------------
" Vim Options 
" -----------------------------------------------

" ** ソフトタブ

" ** 行数表示
set number

" ** ステータスライン
set laststatus=2
set statusline=%F%l%c=


syntax on
"let g:hybrid_use_Xresources = 1
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

"SASSスニペット
au BufRead,BufNewFile *.scss set filetype=sass


"neobundle
"set nocompatible

"if has('vim_starting')
"    set runtimepath+=~/.vim/bundle/neobundle.vim
"    call neobundle#begin(expand('~/.vim/bundle/'))
"    NeoBundleFetch 'Shougo/neobundle.vim'
"    call neobundle#end()
"endif

"insert here your Neobundle plugins"

filetype plugin indent on
