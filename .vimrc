set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ap/vim-buftabline'
Plugin 'ervandew/supertab'
Plugin 'rakr/vim-one'

if (has("nvim"))
  Plugin 'scrooloose/nerdtree'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'w0rp/ale'
  Plugin 'fatih/vim-go'
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'zchee/deoplete-go'
  Plugin 'autozimu/LanguageClient-neovim'
  let g:deoplete#enable_at_startup = 1
endif

" Commented out due to slow startup time
"Plugin 'airblade/vim-gitgutter'
"Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on

syntax on
colorscheme one

set background=light
set number
set cursorline
set backspace=indent,eol,start
set tabstop=2 shiftwidth=2 expandtab
set scrolloff=10
set ignorecase
set smartcase
set incsearch
set hlsearch
set colorcolumn=81
set encoding=utf-8
set noswapfile " disable swap files
set visualbell
set t_vb= " disable the bell
set tags=tags

let mapleader=" "
let NERDTreeIgnore = ['\.class$']

noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap K kJ
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :Files<CR>
noremap <C-U> 11k
noremap <C-D> 11j
nnoremap L :bnext<CR>
nnoremap H :bprev<CR>
nnoremap <CR> :noh<CR><CR>
imap jk <Esc>
nmap <C-c> ^
nmap ; :
map <C-n> :Explore<CR>

function Enter()
  if argc() == 0 && !exists("s:std_in")
    if (has("nvim"))
      NERDTree
    else
      Explore
    endif
  endif
endfunction

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * call Enter()

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  call ale#Set('cpp_gcc_options', '-std=c++14 -Wall -I/opt/X11/include')
  map <C-n> :NERDTreeToggle<CR>
endif

if (has("termguicolors"))
  set termguicolors
endif

if has('gui_macvim')
  set macligatures
  set guifont=PragmataPro:h15
  set linespace=3
  set guioptions-=r
  set guioptions-=L
endif

if $term_program =~ "iterm"
  let &t_si = "\<esc>]50;cursorshape=1\x7" " vertical bar in insert mode
  let &t_ei = "\<esc>]50;cursorshape=0\x7" " block in normal mode
endif

if $ITERM_PROFILE == "Dark"
  set background=dark
endif
