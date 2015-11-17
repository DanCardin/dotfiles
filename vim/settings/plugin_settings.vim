let g:python3_host_prog='/usr/bin/python3'
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

" Neomake
augroup neomake_after_save
  autocmd!
  autocmd BufReadPost,BufWritePost * Neomake | if has('nvim') | Neomake! | endif
  autocmd BufReadPost,BufWritePost *.rs if has('nvim') | Neomake! cargo | endif
augroup END
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']
let g:neomake_rust_enabled_makers = []
let g:neomake_error_sign = {
      \ 'text': '>>',
      \ 'texthl': 'ErrorMsg'
      \ }
let g:neomake_warning_sign = {
      \ 'text': '>>',
      \ 'texthl': 'WarningMsg'
      \ }

" Tmux Navigaotr
let g:tmux_navigator_no_mappings = 1

" FZF
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <C-p> :FZF<CR>
map gb :Buffers<CR>

" Ultisnips
if has("python")
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<C-j>"
  let g:UltiSnipsJumpBackwardTrigger="<C-k>"
endif

" Gundo
nnoremap <F5> :GundoToggle<CR>

" CTags
if executable('ctags') && !s:has_mac || executable('ctags-exuberant')
  let g:easytags_file=$VIMDATA . '/tags'
  if !(has('win32') || has('win64'))
    let g:easytags_async=1
  endif
  if has('patch-7.0.167')
    nnoremap <f8> :TagbarToggle<cr>
  endif
endif

" Lightline
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

" Rainbow
let g:rainbow_active = 1

" Indent Guides
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=4
let g:indent_guides_enable_on_vim_startup = 1

" Better whitepsace
let g:ToggleStripWhitespaceOnSave=1
silent! au VimEnter * ToggleStripWhitespaceOnSave

" Yankstack
nmap <Leader>p <Plug>yankstack_substitute_older_paste
nmap <Leader>P <Plug>yankstack_substitute_newer_paste
