set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

" Languages
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'rust-lang/rust.vim'

" Better Coding
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
autocmd! BufWritePost * Neomake
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
Plug 'rking/ag.vim'
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimproc.vim', { 'do': 'make'}
" Plug 'scrooloose/syntastic'
" Plug 'Valloric/YouCompleteMe'
" Plug 'Shougo/deoplete.nvim'
" let g:deoplete#enable_at_startup = 1

" Visuals
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%3p%%'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=4
let g:indent_guides_enable_on_vim_startup = 1
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

let g:ToggleStripWhitespaceOnSave=1
silent! au VimEnter * ToggleStripWhitespaceOnSave

filetype plugin indent on
syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent                  " Copy indent level from previous line for new lines
set autoread                    " Automatically reload the file on change
set background=dark             " Enables dark background
set backspace=eol,start,indent  " Sensible backspace
set cmdheight=2                 " Sets the height of the cmd window at the bottom
set cursorcolumn                " Highlights vertical column on cursor
set cursorline                  " Highlights horizontal line on cursor
set encoding=utf8               " Default encoding
set expandtab                   " Tabs are spaces
set ffs=unix,dos,mac            " The order to try le formatting
set foldlevelstart=99           " Don't autofold by default
set hid                         " Hide (not close) buffers when opening new files
set history=700                 " Sets the command history length
set hlsearch                    " Highlight matches
set ignorecase                  " Ignores case in / search
set incsearch                   " Search as you type
set langmenu=en                 " Sets the UI language
set laststatus=2                " Always show the last command
set lazyredraw                  " Only redraw when necessary
set lbr                         " Enable linebreaking
set magic                       " Makes regex searches default available
set mat=2                       " Blinks matching brackets
set mouse=a                     " Enable mouse for all things
set nobackup                    " Don't create backup files, that's what git's for
set noswapfile                  " Don't create swap files
set nowb                        " Disable write backup
set nowrap                      " Don't wrap text
set number                      " Enable line numbers
set pumheight=4                 " Set the height of the autocomplete menu
set shiftwidth=4                " Number of spaces replaced per tab
set showcmd                     " Shows the current command on bottom right
set showmatch                   " Highlights matching [{()}]
set smartcase                   " When there's capital in search, be case sensitive
set smartindent                 " Tab to the previous line's indentation
set smarttab                    " Delete per tab rather than per space
set so=5                        " Minimum number of lines from the top or bottom
set stal=1                      " Only show tabline if there's multiple tabs
set swb=useopen,usetab,newtab   " For buffers, first use open buffers, then..., then...
set t_Co=256                    " Enabled 256 colors
set tabstop=4                   " Number of visual spaces per TAB
set timeoutlen=50               " Lowers the timeout
set tm=500                      " Time to wait for a command to complete
set ttyfast                     " Lessens lag in some cases
set tw=500                      " Start linebreaking at 500 chars
set vb t_vb=                    " Disables the error bells
set viminfo^=%                  " Remember info about open buffers on close
set whichwrap+=<,>,h,l          " Wraps on h and l
set wildmenu                    " Enables commandline completions
set wildmode=list:longest:full  " Sets the style of completion for wildmenu
set winaltkeys=no               " Allow for Alt in bindings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup configgroup " {
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal nosmartindent

    autocmd FileType *.css,*.scss setlocal tabstop=2
    autocmd FileType *.css,*.scss setlocal foldmethod=marker foldmarker={,}

    " autocmd FileType *.go set g:go_highlight_functions = 1
    " autocmd FileType *.go set g:go_highlight_methods = 1
    " autocmd FileType *.go set g:go_highlight_structs = 1
augroup END " }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^
" Stop space from searching
noremap <Space> <Nop>
" Space is <Leader>
let mapleader = "\<Space>"

" Quick write session with F2
map <F2> :Obsess ~/.vim_session/
" Load session with F3
map <F3> :source ~/.vim_session/

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
map <C-J> :resize +2<cr>
map <C-K> :resize -2<cr>
map <C-H> :vertical resize -2<cr>
map <C-L> :vertical resize +2<cr>

" middle-click paste
noremap! <s-insert> <middlemouse>
" No Ex mode
nnoremap Q <nop>
" Half page up
nnoremap K <C-U>
" Half page down
nnoremap J <C-D>
" Move to beginning of line
nnoremap B ^
" Move to end of line
nnoremap E $

" Sets // to search for the visually selected text
vnoremap // y/<C-R>"<CR>

" tnoremap <NUL> <C-\><C-n>                         " Exit terminal mode
" tnoremap <esc><esc> <C-\><C-n>                    " Exit terminal mode
" tnoremap <M-j> <C-\><C-n><C-W>j                   " Smart way to move between windows
" tnoremap <M-k> <C-\><C-n><C-W>k                   " Smart way to move between windows
" tnoremap <M-h> <C-\><C-n><C-W>h
" tnoremap <M-l> <C-\><C-n><C-W>l

" Start a search!
map <Leader>a :Ag<space>
" Start a command
map <Leader>; :
" Open a terminal
map <Leader>tn :term<cr>
" Quick save
map <Leader>w :w!<cr>
" Quickly open files
map <Leader>o :CtrlP<cr>
" Quickly close files
map <Leader>q :q<cr>
" Quick previous tab
map <Leader>, :tabp<cr>
" Quick next tab
map <Leader>. :tabn<cr>
" Quick tabonly
map <Leader>to :tabonly<cr>
" Show error list
map <Leader>ee :botright cope<cr>
" Previous error
map <Leader>p :cp<cr>
" Next error
map <Leader>n :cn<cr>
" Close the current buffer
map <Leader>bd :Bclose<cr>
" Close all the buffers
map <Leader>ba :1,1000 bd!<cr>
" Horizontal buffers
map <Leader>sh :sp<cr>
" Vertical buffers
map <Leader>sv :vs<cr>
" Force update the current file
map <Leader>e :e!<cr>
" Write the selected text out to less
vmap <Leader>z :write !less<cr>
" Sudo save
command! W w !sudo tee % > /dev/null

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>v <C-v>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Highlight 80, 100, and 120 and beyond
if exists('+colorcolumn')
  :hi ColorColumn ctermbg=235 guibg=#2c2d27
  let &colorcolumn="80,100,".join(range(120,500),",")
endif

colorscheme gruvbox

hi CursorColumn ctermbg=233
hi CursorLine ctermbg=233

nnoremap <C-p> :Unite file_rec/async<cr>
