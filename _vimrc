syntax on
"let g:hybrid_use_Xresources = 1
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

"SASSスニペット
au BufRead,BufNewFile *.scss set filetype=sass

"行数表示
set number

"ステータスライン
set laststatus=2
set statusline=%F%l%c=

"neobundle
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
endif

"insert here your Neobundle plugins"
NeoBundle 'scrooloose/nerdtree'

filetype plugin indent on

nnoremap <silent><C-e> :NERDTreeToggle<CR>
