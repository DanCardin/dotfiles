let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'junegunn/vim-plug'

" Languages
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-markdown'
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'jason0x43/vim-js-indent'
Plug 'hynek/vim-python-pep8-indent'

" Better Coding
Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php"

Plug 'Raimondi/delimitMate'
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1
imap <expr><CR> pumvisible() ? "\<C-n>" : "<Plug>delimitMateCR"

Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
augroup neomake_after_save
  autocmd! BufWritePost * Neomake
  autocmd BufReadPost,BufWritePost *.rs if has('nvim') | Neomake! cargo | endif
augroup END
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_exe = '/usr/bin/python3'
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']
let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
let g:neomake_rust_enabled_makers = []
let g:neomake_error_sign = {'text': 'XX', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': '>>', 'texthl': 'WarningMsg'}

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

if has("python")
  Plug 'sirver/ultisnips'
  " let g:UltiSnipsExpandTrigger="<C-r>"
  let g:UltiSnipsJumpForwardTrigger="<C-j>"
  let g:UltiSnipsJumpBackwardTrigger="<C-k>"
endif

Plug 'sjl/gundo.vim'
nnoremap <F6> :GundoToggle<CR>

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-git'
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

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

Plug 'zchee/deoplete-jedi'

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

Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=4
let g:indent_guides_enable_on_vim_startup=1

Plug 'ntpeters/vim-better-whitespace'
let g:ToggleStripWhitespaceOnSave=1
silent! au VimEnter * ToggleStripWhitespaceOnSave

Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'Valloric/MatchTagAlways'

call plug#end()

filetype plugin indent on
syntax on
