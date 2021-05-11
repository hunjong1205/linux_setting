set shell=/bin/zsh

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter' " vim with git status(added, modified, and removed lines)
Plugin 'tpope/vim-fugitive' " vim with git command(e.g., Gdiff)
Plugin 'vim-airline/vim-airline' " vim status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'blueyed/vim-diminactive'

call vundle#end()

call plug#begin('~/.vim/autoload/plug')

Plug 'pgavlin/pulumi.vim'

call plug#end()

set t_Co=256

" for jellybeans
" colorscheme desert
 set background=dark
" colorscheme jellybeans
colorscheme pulumi
" for taglist
nmap <F8> :Tagbar<CR>

" for indent guide
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level=2
" let g:indent_guides_guide_size=1

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
" let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
let mapleader = ","

nnoremap <C><PageUp> :bp<CR>
nnoremap <C><PageDown> :bn<CR>

" for blueyed/vim-diminactive
let g:diminactive_enable_focus = 1

" for NERDTree
nmap <C-n> :NERDTreeToggle<CR>

syntax enable
filetype indent on
highlight Comment term=bold cterm=bold ctermfg=4
set nu
set nowrap
