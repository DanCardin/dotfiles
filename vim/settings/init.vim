set nocompatible

" Install the plugin manager if it doesn't exist
let s:plugins=$VIMDATA . '~/.vim/bundle'
let s:plugin_manager=$VIMHOME . '~/.vim/autoload/plug.vim'
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

let g:python3_host_prog='/usr/bin/python3'
