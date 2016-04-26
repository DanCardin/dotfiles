set nocompatible
set shell=/bin/bash

" Install the plugin manager if it doesn't exist
let s:plugin_manager=$VIMHOME . '~/.local/share/nvim/site/autoload/plug.vim'
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
    exec 'source ~/.config/nvim/settings/plugins.vim',
    autocmd VimEnter * PlugInstall
  augroup END
else
  let g:python3_host_prog='/usr/bin/python3'

  let s:vim_home = '~/.config/nvim/settings/'
  let config_list = [
    \ 'base.vim',
    \ 'plugins.vim',
    \ 'functions.vim',
    \ 'mappings.vim',
    \ 'languages.vim'
    \]

  for files in config_list
    for f in split(glob(s:vim_home.files), '\n')
      exec 'source '.f
    endfor
  endfor

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

  let g:Powerline_symbols = 'fancy'
endif
