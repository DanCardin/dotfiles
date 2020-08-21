set nocompatible
set shell=/bin/bash

let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

" Install the plugin manager if it doesn't exist
let s:plugin_manager=$VIMHOME . '~/.config/nvim/pack/packager/opt/vim-packager'
let g:_vimrc_base = '~/.config/nvim'

if empty(glob(s:plugin_manager))
  let s:plugin_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echom 'vim-packager not found. Installing...'
  silent exec '!git clone https://github.com/kristijanhusak/vim-packager ~/.config/nvim/pack/packager/opt/vim-packager'
  execute 'source ' . g:_vimrc_base . '/init.vim'
  autocmd VimEnter * PlugInstall
else
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
