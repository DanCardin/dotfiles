set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'fatih/vim-go'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'luochen1990/rainbow'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rking/ag.vim'

Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/SearchComplete'

Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

Plugin 'tomasr/molokai'
Plugin 'fmoralesc/molokayo'
Plugin 'morhetz/gruvbox'

" Rainbow settings
let g:rainbow_active = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
set laststatus=2

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Error checkers
let g:flake8_show_quickfix=0
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:syntastic_python_checkers = ['python', 'flake8', 'pylint', 'pyflakes']
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": ["python"],
                           \ "passive_filetypes": []}
let g:syntastic_auto_loc_list=0
map <leader>j :YcmCompleter GoTo<CR>
let g:ycm_key_list_select_completion = ['<Enter>', '<Down>']
set pumheight=4

" Vim Indent-guides
set ts=4 sw=4 et
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

call vundle#end()               " required
filetype plugin indent on       " required
syntax on 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup configgroup " {
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal nosmartindent
augroup END " }

map 0 ^                                      " Remap VIM 0 to first non-blank character
map <C-j> <C-W>j                             " Smart way to move between windows
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <F2> :mksession! ~/.vim_session <cr>     " Quick write session with F2
map <F3> :source ~/.vim_session <cr>         " Load session with F3
noremap! <s-insert> <middlemouse>            " middle-click paste
nnoremap Q <nop>                             " No Ex mode
nnoremap K <C-U>                             " Half page up
nnoremap J <C-D>                             " Half page down
nnoremap B ^                                 " Move to beginning of line
nnoremap E $                                 " Move to end of line
command! W w !sudo tee % > /dev/null         " Sudo save

nnoremap <Space> <nop>                       " Space is <Leader>
map <Space><Space> <Leader><Leader>          " Fixes <space><space> not working
map <Space> <Leader>

nmap <Leader>w :w!<cr>                       " Quick save
nmap <Leader>, :tabp<cr>                     " Quick previous tab
nmap <Leader>. :tabn<cr>                     " Quick next tab
map <Leader>cc <plug>NERDCommenterAlignLeft
map <Leader>y "+y
map <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
map <leader>bd :Bclose<cr>                        " Close the current buffer
map <leader>ba :1,1000 bd!<cr>                    " Close all the buffers 
map <leader>tn :tabnew<cr>                        " Quick newtab
map <leader>to :tabonly<cr>                       " Quick tabonly
map <leader>tc :tabclose<cr>                      " Quick tabclose
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr> " Opens a new tab with the current buffer's path
map <leader>cd :cd %:p:h<cr>:pwd<cr>              " Switch CWD to the directory of the open buffer
map <leader>ee :botright cope<cr>                 " Show error list
map <leader>p :cp<cr>                             " Previous error
map <leader>n :cn<cr>                             " Next error
map <leader>q :q<cr>                              " Quickly close files
map <leader>ss :setlocal spell!<cr>               " Pressing ,ss will toggle and untoggle spell checking
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
map <leader>x :e ~/buffer<cr>                " Quickly open a buffer for scribble
map <leader>pp :setlocal paste!<cr>          " Toggle paste mode on and off 

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Autoreload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Highlight 80, 100, and 120 and beyond
if exists('+colorcolumn')
  :hi ColorColumn ctermbg=235 guibg=#2c2d27
  let &colorcolumn="80,100,".join(range(120,500),",")
endif

colorscheme gruvbox

