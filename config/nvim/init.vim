let s:vim_home = '~/.vim/settings/'
let config_list = [
  \ 'init.vim',
  \ 'base.vim',
  \ 'plugins.vim',
  \ 'functions.vim',
  \ 'theme.vim',
  \ 'settings.vim',
  \ 'mappings.vim',
  \ 'languages.vim'
  \]

for files in config_list
  for f in split(glob(s:vim_home.files), '\n')
    exec 'source '.f
  endfor
endfor

set nocompatible

let g:Powerline_symbols = 'fancy'
