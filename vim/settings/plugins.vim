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
Plug 'leafgarland/typescript-vim'
Plug 'jason0x43/vim-js-indent'

" Better Coding
Plug 'alvan/vim-closetag'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
augroup neomake_after_save
  autocmd!
  autocmd BufReadPost,BufWritePost * Neomake | if has('nvim') | Neomake! | endif
  autocmd BufReadPost,BufWritePost *.rs if has('nvim') | Neomake! cargo | endif
augroup END
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']
let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_rust_enabled_makers = []
let g:neomake_error_sign = {
      \ 'text': 'XX',
      \ 'texthl': 'ErrorMsg'
      \ }
let g:neomake_warning_sign = {
      \ 'text': '>>',
      \ 'texthl': 'WarningMsg'
      \ }
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
map gb :Buffers<CR>

Plug 'maxbrunsfeld/vim-yankstack'
nmap <Leader>p <Plug>yankstack_substitute_older_paste
nmap <Leader>P <Plug>yankstack_substitute_newer_paste

if has("python")
  Plug 'sirver/ultisnips'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<C-j>"
  let g:UltiSnipsJumpBackwardTrigger="<C-k>"
endif
Plug 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
Plug 'vim-scripts/XML-Folding'
Plug 'Valloric/YouCompleteMe', {'max': './install.py', 'unix': './install.py'}
set completeopt-=preview
" let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

if executable('ctags')
  " Dependency for easytags
  let g:easytags_file=$VIMDATA . '/tags'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'
  if !(has('win32') || has('win64'))
    let g:easytags_async=1
  endif
  if has('patch-7.0.167')
    Plug 'majutsushi/tagbar'
    nnoremap <f8> :TagbarToggle<cr>
  endif
endif

" Visuals
Plug 'ap/vim-buftabline'
Plug 'DanCardin/vim-css-color'
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
let g:ToggleStripWhitespaceOnSave=1
silent! au VimEnter * ToggleStripWhitespaceOnSave
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'Valloric/MatchTagAlways'

call plug#end()

filetype plugin indent on
syntax on
