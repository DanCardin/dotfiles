set nocompatible

let g:python3_host_prog='/usr/bin/python3'

" Install the plugin manager if it doesn't exist
let s:plugins=$VIMDATA . '.vim/bundle'
let s:plugin_manager=$VIMHOME . '.vim/autoload/plug.vim'
let s:plugin_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if empty(glob(s:plugin_manager))
  echom 'vim-plug not found. Installing...'
  if executable('curl')
    silent exec '!curl -fLo ' . s:plugin_manager . ' --create-dirs ' .
        \ s:plugin_url
  elseif executable('wget')
    call mkdir(fnamemodify(s:plugin_manager, ':h'), 'p')
    silent exec '!wget --force-directories --no-check-certificate -O ' .
        \ expand(s:plugin_manager) . ' ' . s:plugin_url
  else
    echom 'Could not download plugin manager. No plugins were installed.'
    finish
  endif
  augroup vimplug
    autocmd!
    autocmd VimEnter * PlugInstall
  augroup END
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

" Languages
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
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']
let g:neomake_error_sign = {
      \ 'text': '>>',
      \ 'texthl': 'ErrorMsg'
      \ }
let g:neomake_warning_sign = {
      \ 'text': '>>',
      \ 'texthl': 'WarningMsg'
      \ }
autocmd! BufWritePost * Neomake
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <C-p> :FZF<CR>

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
Plug 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'scrooloose/syntastic'
" Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
if executable('ctags') && !s:has_mac || executable('ctags-exuberant')
  Plug 'xolox/vim-misc'       " Dependency for easytags
  Plug 'xolox/vim-easytags'
  let g:easytags_file=$VIMDATA . '/tags'
  if !(has('win32') || has('win64'))
    let g:easytags_async=1
  endif

  " Class outline viewer
  if has('patch-7.0.167')
    Plug 'majutsushi/tagbar'
    nnoremap <f8> :TagbarToggle<cr>
  endif
endif

" Visuals
Plug 'ap/vim-css-color'
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
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
set cmdheight=1                 " Sets the height of the cmd window at the bottom
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
set noshowmode                  " Don't show the mode, its in the statusline
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
    au FileType python setlocal commentstring=#\ %s
    au FileType python setlocal foldmethod=indent
    au FileType python setlocal nosmartindent

    au FileType css,scss setlocal tabstop=2 shiftwidth=2
    au FileType css,scss setlocal foldmethod=marker foldmarker={,}

    au FileType html setlocal tabstop=2 shiftwidth=2
    "
    " au FileType *.go set g:go_highlight_functions = 1
    " au FileType *.go set g:go_highlight_methods = 1
    " au FileType *.go set g:go_highlight_structs = 1
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
map <Leader>a :Ag<space>""<left>
" Start a command
map <Leader>; :
" Open a terminal
map <Leader>tn :term<cr>
" Quick save
map <Leader>w :w!<cr>
" Quickly open files
map <Leader>o <C-p>
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

" Lightline
function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" End Lightline

colorscheme gruvbox

hi CursorColumn ctermbg=233
hi CursorLine ctermbg=233
