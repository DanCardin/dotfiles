function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" let g:python_host_prog='/home/dan/.miniconda3/envs/default/bin/python'
let g:python3_host_prog='/home/dan/.miniconda3/envs/default/bin/python'

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'junegunn/vim-plug'

if !has('nvim')
  Plug 'noahfrederick/vim-neovim-defaults'
endif

" Languages
Plug 'hynek/vim-python-pep8-indent'
Plug 'jason0x43/vim-js-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'kh3phr3n/python-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-markdown'
let g:python_highlight_all = 1

Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'

" Source Control
Plug 'tpope/vim-git'
if has('signs')
  Plug 'airblade/vim-gitgutter'
endif

" Better Coding
Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php"

Plug 'Raimondi/delimitMate'
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"
au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_balance_matchpairs = 1
imap <expr><CR> pumvisible() ? "\<C-n>" : "<Plug>delimitMateCR"

Plug 'Valloric/MatchTagAlways'

Plug 'benekastah/neomake'
augroup neomake_after_save
  autocmd! BufWritePost * Neomake
  autocmd BufReadPost,BufWritePost *.rs if has('nvim') | Neomake! cargo | endif
augroup END
let g:neomake_python_enabled_makers = ['flake8', 'prospector']
let g:neomake_python_flake8_maker = {
  \ 'exe': '/home/dan/.miniconda3/envs/default/bin/flake8',
  \ 'args': ['--format=default --max-line-length=100'],
  \ 'errorformat':
      \ '%E%f:%l: could not compile,%-Z%p^,' .
      \ '%A%f:%l:%c: %t%n %m,' .
      \ '%A%f:%l: %t%n %m,' .
      \ '%-G%.%#',
  \ 'postprocess': function('neomake#makers#ft#python#Flake8EntryProcess')
  \ }
let g:neomake_python_prospector_maker = {
  \ 'exe': '/home/dan/.miniconda3/envs/default/bin/prospector',
  \ 'args': ['-o', 'pylint', '-M', '--absolute-paths', '%:p'],
  \ 'errorformat':
    \ '%-G%.%#module named%.%#,' .
    \ '%f:%l:%c [%t%n%.%#] %m,' .
    \ '%f:%l: [%t%n%.%#] %m,' .
    \ '%f:%l: [%.%#] %m,' .
    \ '%f:%l:%c [%.%#] %m',
  \ }
" let g:neomake_python_exe='/home/dan/.miniconda3/envs/default/bin/python'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
let g:neomake_rust_enabled_makers = []
let g:neomake_error_sign = {'text': 'XX', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': '>>', 'texthl': 'WarningMsg'}

" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'Quramy/tsuquyomi'
" let g:tsuquyomi_disable_quickfix = 1
"
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

Plug 'honza/vim-snippets'
Plug 'lfv89/vim-interestingwords'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<cr>
map <Leader>o :GitFiles<cr>
map gb :Buffers<CR>

Plug 'justinmk/vim-sneak'
let g:sneak#streak=1

if has('python')
  Plug 'simnalamburt/vim-mundo'
  nnoremap <F6> :MundoToggle<CR>
endif

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
map <F5> :NERDTreeToggle<CR>

Plug 'unblevable/quick-scope'
Plug 'vim-scripts/XML-Folding'

if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_tagfile=".tags"
  if has('patch-7.0.167')
    Plug 'majutsushi/tagbar'
    nnoremap <C-s> :TagbarToggle<cr>
  endif
endif

Plug 'Konfekt/FastFold'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 0
inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"
noremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
function! s:neosnippet_complete()
  if neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)"
  endif
  if pumvisible()
    return "\<c-n>"
  else
    return "\<tab>"
  endif
endfunction

imap <expr><TAB> <SID>neosnippet_complete()


Plug 'zchee/deoplete-jedi'
Plug 'mhartington/deoplete-typescript'

Plug 'tweekmonster/impsort.vim'
let g:impsort_textwidth=79
let g:impsort_start_nextline=1
let g:impsort_method_group=['alpha', 'length']
let g:impsort_method_module=['alpha', 'depth', 'length']
autocmd BufWritePre *.py ImpSort!

" Visuals
Plug 'ap/vim-buftabline'
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

Plug 'kshenoy/vim-signature'
Plug 'luochen1990/rainbow'
let g:rainbow_active=1

Plug 'Yggdroot/indentLine'
let g:indentLine_char='¦'  "┆
let g:indentLine_enabled=1

Plug 'ntpeters/vim-better-whitespace'
let g:ToggleStripWhitespaceOnSave=1
silent! au VimEnter * ToggleStripWhitespaceOnSave

Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

" Themes
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'romainl/Apprentice'

call plug#end()

filetype plugin indent on
syntax on
