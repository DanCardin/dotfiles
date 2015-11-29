let s:has_mac = 0
let s:has_arch = 0
if has('unix')
  let s:uname = system('uname -s')
  if s:uname =~? 'Darwin'
    let s:has_mac = 1
  else
    let s:issue = system('cat /etc/issue')
    if s:issue =~? 'Arch Linux'
      let s:has_arch = 1
    elseif s:issue =~? 'Oracle Linux'
      let s:has_oracle = 1
    endif
  endif
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

" Languages
Plug 'cakebaker/scss-syntax.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-markdown'
Plug 'jelera/vim-javascript-syntax'

" Better Coding
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'maxbrunsfeld/vim-yankstack'
if has("python")
  Plug 'sirver/ultisnips'
endif
Plug 'sjl/gundo.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'scrooloose/syntastic'
" Plug 'Valloric/YouCompleteMe'
" Plug 'Shougo/deoplete.nvim'
" let g:deoplete#enable_at_startup = 1

if executable('ctags') && !s:has_mac || executable('ctags-exuberant')
  " Dependency for easytags
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'
  if has('patch-7.0.167')
    Plug 'majutsushi/tagbar'
  endif
endif

" Visuals
Plug 'ap/vim-buftabline'
Plug 'DanCardin/vim-css-color'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

call plug#end()

filetype plugin indent on
syntax on
