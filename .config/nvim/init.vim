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
  exec 'source ~/.config/nvim/settings/plugins.vim'
  autocmd VimEnter * PlugInstall
else
  let g:python3_host_prog='/usr/bin/python3'
  let g:_vimrc_base = '~/.config/nvim'
  let g:_vimrc_sources = get(g:, '_vimrc_sources', {})

  function! s:source(dir) abort
    for filename in sort(glob(g:_vimrc_base.'/'.a:dir.'/*.vim', 0, 1))
      let mtime = getftime(filename)
      if !has_key(g:_vimrc_sources, filename) || g:_vimrc_sources[filename] < mtime
        let g:_vimrc_sources[filename] = mtime
        execute 'source '.filename
      endif
    endfor
  endfunction

  call s:source('settings')
endif
