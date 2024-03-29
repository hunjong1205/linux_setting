set shell=/bin/zsh

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" Plugin 'nanotech/jellybeans.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter' " vim with git status(added, modified, and removed lines)
Plugin 'tpope/vim-fugitive' " vim with git command(e.g., Gdiff)
Plugin 'vim-airline/vim-airline' " vim status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'haya14busa/vim-easymotion'
" Plugin 'blueyed/vim-diminactive'

" For Jedi-vim check https://github.com/davidhalter/jedi-vim
" Plugin 'davidhalter/jedi-vim'   
" let g:jedi#show_call_signatures=1       
" let g:jedi#popup_select_first="0"
" let g:jedi#force_py_version=3           

Plugin 'hynek/vim-python-pep8-indent'   
filetype plugin indent on               

Plugin 'nvie/vim-flake8'                
" let g:syntastic_python_checkers=['flake8']        
" let g:syntastic_python_flake8_args='--ignore='    

call vundle#end()

call plug#begin('~/.vim/autoload/plug')

Plug 'pgavlin/pulumi.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'arcticicestudio/nord-vim'

Plug 'jacoborus/tender.vim'

Plug 'tomasiser/vim-code-dark'

Plug 'puremourning/vimspector'

call plug#end()

set t_Co=256

syntax enable
" colorscheme desert
" set background=dark
" set background=light
" colorscheme jellybeans
" colorscheme pulumi
" colorscheme nord
" colorscheme tender

" for colorscheme
" let g:nord_underline = 1
let g:lightline = { 'colorscheme': 'tender' }
let g:airline_theme = 'tender'

" for indent guide
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level=2
" let g:indent_guides_guide_size=1

" for vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1					" vim-airline 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t'				" vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1				" vim-airline buffer number 보이기
let g:airline#extensions#tabline#buffer_nr_format = '%s:'		" vim-airline buffer number format
" let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
let mapleader = "'"

" for Vimspector
let g:vimspector_enable_mapping = 'HUMAN'
packadd! vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dj <Plug>VimspectorStepOver
:map <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dl <Plug>VimspectorStepInto
let g:vimspector_adapters = #{
      \   test_debugpy: #{ extends: 'debugpy' }
      \ }

let g:vimspector_configurations = {
	      \ "test_debugpy_config": {
	      \   "adapter": "test_debugpy",
      \   "filetypes": [ "python" ],
      \   "configuration": {
	      \     "request": "launch",
      \     "type": "python",
      \     "cwd": "${fileDirname}",
      \     "args": [],
      \     "program": "${file}",
      \     "stopOnEntry": v:false,
      \     "console": "integratedTerminal",
      \     "integer": 123,
	  \     "python" : "/root/anaconda3/envs/accel/bin/python",
      \   },
      \   "breakpoints": {
	      \     "exception": {
	      \       "raised": "N",
      \       "uncaught": "",
      \       "userUnhandled": ""
      \     }
      \   }
      \ } }


" for Easy-motion
nnoremap F <Plug>(easymotion-bd-w)
" nnoremap F <Plug>(easymotion-b)

tnoremap <Esc> <C-W>N

" for blueyed/vim-diminactive
" let g:diminactive_enable_focus = 0

" for NERDTree
nmap <C-n> :NERDTreeToggle<CR>

map <C-j> :bp<CR>
map <C-k> :bn<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
map <C-t> :vs \| :term ++curwin <CR>

syntax enable
filetype indent on

" Vim Settings
set rnu
set ts=4
set sw=4
set sts=4
set hls
set ignorecase
set showmatch
set wmnu
set cursorline
set clipboard=unnamed
set smartindent
set cindent
set autoread
hi search term=reverse ctermfg=0 ctermbg=2 guifg=#3B4252 guibg=#88C0D0

set encoding=utf-8
set fileencodings=utf-8,cp949

""" Coc-nvim Settings """

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set t_Co=256
set t_ut=
let g:airline_theme = 'codedark'
colorscheme codedark
" for taglist
nmap <C-m> :Tagbar<CR>

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()


function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#_select_confirm() :
\ coc#expandableOrJumpable() ?
\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :vs<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
