set nocompatible
set shell=/bin/bash

let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

" Install the plugin manager if it doesn't exist
let s:plugin_manager=$VIMHOME . '~/.local/share/nvim/site/autoload/plug.vim'

if empty(glob(s:plugin_manager))
  let s:plugin_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
  exec 'source ~/.config/nvim/settings/plugins.vim'
  execute 'source ' . g:_vimrc_base . '/init.vim'
  autocmd VimEnter * PlugInstall
else
  let g:_vimrc_base = '~/.config/nvim'
 
  function! s:source(dir) abort
    execute 'source ' . g:_vimrc_base . '/' . a:dir . '/00-base.vim'
    execute 'source ' . g:_vimrc_base . '/' . a:dir . '/02-functions.vim'
    execute 'source ' . g:_vimrc_base . '/' . a:dir . '/01-plugins.vim'
    execute 'source ' . g:_vimrc_base . '/' . a:dir . '/03-mappings.vim'
    execute 'source ' . g:_vimrc_base . '/' . a:dir . '/04-languages.vim'
    execute 'source ' . g:_vimrc_base . '/' . a:dir . '/05-visuals.vim'
  endfunction
 
  call s:source('settings')
endif
