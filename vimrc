set nocompatible              " be iMproved, requiredfiletype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'kchmck/vim-coffee-script'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-obsession'
Plugin 'luochen1990/rainbow'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rking/ag.vim'
Plugin 'ntpeters/vim-better-whitespace'

Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'

" Rainbow settings
let g:rainbow_active = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%3p%%'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Error checkers
let g:flake8_show_quickfix=0
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:syntastic_python_checkers = ['python', 'flake8']
" let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": ["python"],
                           \ "passive_filetypes": []}
let g:syntastic_auto_loc_list=0
map <leader>j :YcmCompleter GoTo<CR>
let g:ycm_key_list_select_completion = ['<Enter>', '<Down>']

" Vim Indent-guides
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=4
let g:indent_guides_enable_on_vim_startup = 1

" NERDCommenter
let NERDSpaceDelims=1           " Adds a space after the comment

" Ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
":Ctrlp /usr/local/insightsquared

"Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ToggleStripWhitespaceOnSave=1

let g:loaded_youcompleteme = 0

call vundle#end()               " required
filetype plugin indent on       " required
syntax on

silent! au VimEnter * ToggleStripWhitespaceOnSave

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ttyfast                     " Lessens lag in some cases
set t_Co=256                    " Enabled 256 colors
set timeoutlen=50               " Lowers the timeout
set history=700                 " Sets the command history length
set number                      " Enable line numbers
set cursorline                  " Highlights horizontal line on cursor
set cursorcolumn                " Highlights vertical column on cursor
set background=dark             " Enables dark background
set autoread                    " Automatically reload the file on change
set showcmd                     " Shows the current command on bottom right
set so=7                        "
set langmenu=en
set wildmenu
set cmdheight=2
set hid
set backspace=eol,start,indent  " Sensible backspace
set whichwrap+=<,>,h,l          " Wraps on h and l
set ignorecase                  " Ignores case in / search
set smartcase
set hlsearch                    " Highlight matches
set incsearch                   " Search as you type
set lazyredraw                  " Only redraw when necessary
set magic
set showmatch                   " Highlights matching [{()}]
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set foldmethod=indent
set foldlevelstart=99
set viminfo^=%                  " Remember info about open buffers on close
set expandtab                   " Tabs are spaces
set smarttab
set shiftwidth=4
set tabstop=4                   " Number of visual spaces per TAB
set lbr
set tw=500
set autoindent
set smartindent
set nowrap                      " Don't wrap text
set switchbuf=useopen,usetab,newtab
set stal=2
set mouse=a
set pumheight=4
set ts=4 sw=4 et
set laststatus=2
set winaltkeys=no

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup configgroup " {
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal nosmartindent
    autocmd FileType *.css,*.scss setlocal tabstop=2
    autocmd FileType *.css,*.scss setlocal foldmethod=marker foldmarker={,}
augroup END " }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map 0 ^                                           " Remap VIM 0 to first non-blank character
noremap <Space> <Nop>                             " Stop space from searching
map <Space> <Leader>                              " Space is <Leader>
" map <Space><Space> <Leader><Leader>               " Fixes <space><space> not working
let mapleader = "\<Space>"

" Quick write session with F2
map <F2> :Obsess ~/.vim_session/
" Load session with F3
map <F3> :source ~/.vim_session/

map <C-J> :resize +2<cr>                          " Smart way to resize windows
map <C-K> :resize -2<cr>                          " Smart way to resize windows
map <C-H> :vertical resize -2<cr>                 " Smart way to resize windows
map <C-L> :vertical resize +2<cr>                 " Smart way to resize windows

map <M-j> <C-W>j                                  " Smart way to move between windows
map <M-k> <C-W>k                                  " Smart way to move between windows
map <M-h> <C-W>h
map <M-l> <C-W>l

noremap! <s-insert> <middlemouse>                 " middle-click paste
nnoremap Q <nop>                                  " No Ex mode
nnoremap K <C-U>                                  " Half page up
nnoremap J <C-D>                                  " Half page down
nnoremap B ^                                      " Move to beginning of line
nnoremap E $                                      " Move to end of line

vnoremap // y/<C-R>"<CR>                          " Sets // to search for the visually selected text

tnoremap <NUL> <C-\><C-n>                         " Exit terminal mode
tnoremap <esc><esc> <C-\><C-n>                    " Exit terminal mode
tnoremap <M-j> <C-\><C-n><C-W>j                   " Smart way to move between windows
tnoremap <M-k> <C-\><C-n><C-W>k                   " Smart way to move between windows
tnoremap <M-h> <C-\><C-n><C-W>h
tnoremap <M-l> <C-\><C-n><C-W>l

" Open a terminal
map <Leader>tn :term<cr>
" Quick save
map <Leader>w :w!<cr>
" Quickly close files
map <Leader>q :q<cr>
" Quick previous tab
map <Leader>, :tabp<cr>
" Quick next tab
map <Leader>. :tabn<cr>
" Close the current buffer
map <Leader>bd :Bclose<cr>
" Close all the buffers
map <Leader>ba :1,1000 bd!<cr>
" Quick tabonly
map <Leader>to :tabonly<cr>
" Switch CWD to the directory of the open buffer
map <Leader>cd :cd %:p:h<cr>:pwd<cr>
" Show error list
map <Leader>ee :botright cope<cr>
" Previous error
map <Leader>p :cp<cr>
" Next error
map <Leader>n :cn<cr>
" Quickly open a buffer for scribble
map <Leader>x :e ~/buffer<cr>
" Toggle and untoggle spell checking
map <Leader>sh :sp<cr>
" Toggle and untoggle spell checking
map <Leader>sv :vs<cr>
" Toggle and untoggle spell checking
map <Leader>ss :setlocal spell!<cr>
" Toggle paste mode on and off
map <Leader>pp :setlocal paste!<cr>
" Force update the current file
map <Leader>e :e!<cr>
" Write the selected text out to less
vmap <Leader>z :write !less<cr>

command! W w !sudo tee % > /dev/null              " Sudo save

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
