set nocompatible              " be iMproved, required
filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'IN3D/vim-raml'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rakr/vim-one'
Plugin 'flowtype/vim-flow'
Plugin 'zephod/vim-iterm2-navigator'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'rizzatti/dash.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'ap/vim-buftabline'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'elixir-editors/vim-elixir'
Plugin 'ElmCast/elm-vim'
Plugin 'autozimu/LanguageClient-neovim'
if (has("nvim"))
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'zchee/deoplete-go'
  let g:deoplete#enable_at_startup = 1
else
  Plugin 'Shougo/neocomplete.vim'
  let g:neocomplete#enable_at_startup = 1
endif

let g:go_fmt_command = "goimports"
let g:ale_linters = {'go': ['gometalinter', 'gofmt']}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

let g:javascript_plugin_flow = 1

" vim-jsx options
let g:jsx_ext_required = 0

let g:SuperTabDefaultCompletionType = "<c-n>"


" LanguageClient stuff
set hidden

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> <c-k> :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

if has('gui_macvim')
  set macligatures
  set guifont=PragmataPro:h15
  set linespace=3
  " disable scrollbars
  set guioptions-=r
  set guioptions-=L
endif

let mapleader=" "
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX)) 
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
"endif



syntax on
colorscheme one
set background=light
set number
let g:one_allow_italics = 1
set cursorline
set backspace=indent,eol,start
set tabstop=2 shiftwidth=2 expandtab
set scrolloff=10

set ignorecase
set smartcase
set incsearch
set hlsearch
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

let g:elm_format_autosave = 1

noremap <C-U> 11k
noremap <C-D> 11j
nnoremap L :bnext<CR>
nnoremap H :bprev<CR>

nmap ; :

" disable swap files
set noswapfile
" disable the bell
set visualbell
set t_vb=

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

set laststatus=2

set statusline=\ %.50f
set statusline+=%=%h%m%r%y\ %c,%l/%L\ 
"set listchars="tab:> ,trail:~,extends:>,precedes:<"
"set list


" NERDTree opts
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set colorcolumn=81
set encoding=utf-8

" fzf options
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-]> :Tags<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap K kJ

" fix ctrl-h in nvim
if has('nvim')
  nmap <BS> <C-W>h
endif

" use the arrow keys to resize panes
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

imap jk <Esc>
nmap <C-c> ^

nmap <silent> <leader>d <Plug>DashSearch

set tags=tags

autocmd FileType javascript.jsx set formatprg=prettier\ --stdin

call ale#Set('cpp_gcc_options', '-std=c++14 -Wall -I/opt/X11/include')
