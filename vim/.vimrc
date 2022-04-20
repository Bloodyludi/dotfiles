" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
call plug#end()

" nerdtree
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.meta$']
autocmd VimEnter * if !argc() | NERDTree | endif

" Toggle line numbers
nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
if !&number && !&relativenumber
    set number
    set norelativenumber
elseif &number && !&relativenumber
    set nonumber
    set relativenumber
elseif !&number && &relativenumber
    set number
    set relativenumber
elseif &number && &relativenumber
    set nonumber
    set norelativenumber
endif
endfunction

" Open plugins {{{

map <Esc>o      :Files<CR>
map <Esc>i      :NERDTreeToggle<CR>
map <Esc>u      :UndotreeToggle<CR>
map <Esc>p      :Ag<CR>
map <Esc>j      :History<CR>

" }}}

" Scrolling {{{

set mouse=a

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
map <MiddleMouse> <Nop>

" }}}
