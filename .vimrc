set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ap/vim-buftabline'
Plugin 'ervandew/supertab'
Plugin 'rakr/vim-one'

"if (has('nvim'))
  Plugin 'scrooloose/nerdtree'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'w0rp/ale'
  Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plugin 'rust-lang/rust.vim'
  Plugin 'racer-rust/vim-racer'
  Plugin 'hashivim/vim-terraform'
  Plugin 'artur-shaik/vim-javacomplete2'
"  Plugin 'reasonml-editor/vim-reason-plus'


"  Plugin 'Shougo/deoplete.nvim'
"  Plugin 'roxma/nvim-yarp'
"  Plugin 'roxma/vim-hug-neovim-rpc'
"  Plugin 'zchee/deoplete-go', { 'do': 'make'}
"  Plugin 'autozimu/LanguageClient-neovim'
"endif

Plugin 'rhysd/vim-grammarous'
Plugin 'sbdchd/neoformat'
Plugin 'Akin909/vim-dune'

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
set mouse=a
set clipboard=unnamed

let mapleader=' '
let NERDTreeIgnore = ['\.class$', '\.d$', '\.o$']
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:SuperTabDefaultCompletionType = 'context'
"let g:neoformat_ocaml_ocamlformat = {
"            \ 'exe': 'ocamlformat',
"            \ 'args': ['--disable-outside-detected-project']
"            \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']
let g:neoformat_enabled_javascript = []

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
map <C-n> :call MyExplore()<CR>

function MyExplore()
  if (has('nvim'))
    NERDTree
  elseif getbufvar(winbufnr(winnr()), "&filetype") == "netrw"
    Rexplore " toggle netrw
  else
    Explore " open netrw for the first time
  endif
endfunction

function Enter()
  if argc() == 0 && !exists("s:std_in")
    call MyExplore()
  endif
endfunction

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * call Enter()
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal tabstop=4 shiftwidth=4 expandtab

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  map <C-n> :NERDTreeToggle<CR>
  set rtp+=~/.vim/bundle/LanguageClient-neovim
endif

let g:ale_linters = {'go': ['golint'], 'python': ['pycodestyle'], 'sh': ['shellcheck']}
let g:ale_fixers = {'python': ['autopep8']}
let g:go_fmt_command = "goimports"
let g:ale_go_langserver_executable = 'gopls'

let g:rustfmt_autosave = 1

let g:ale_cpp_gcc_options =  '-std=c++14 -Wall -Wextra -Wconversion -I/opt/X11/include -I../include'
let g:ale_c_gcc_options =  '-std=c11 -Wall -Wextra -Wconversion -Wunused-but-set-variable -I. -I../include'

if (has('termguicolors'))
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

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')
"
" let s:opam_configuration = {}
"
" function! OpamConfOcpIndent()
"   execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')
"
" function! OpamConfOcpIndex()
"   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')
"
" function! OpamConfMerlin()
"   let l:dir = s:opam_share_dir . "/merlin/vim"
"   execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')
"
" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
"   " Respect package order (merlin should be after ocp-index)
"   if count(s:opam_available_tools, tool) > 0
"     call s:opam_configuration[tool]()
"   endif
" endfor
" " ## end of OPAM user-setup addition for vim / base ## keep this line
" " ## added by OPAM user-setup for vim / ocp-indent ## ac2e25d49465f4b9a5283e3c66fd7f83 ## you can edit, but keep this line
" if count(s:opam_available_tools,"ocp-indent") == 0
"   source "~/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
" endif
" " ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
