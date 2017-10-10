source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc ${HOME}/.zshrc.local)
if ! zgen saved; then
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/ssh-agent
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/virtualenv

  zgen loadall <<EOPLUGINS
      DanCardin/zsh-vim-mode
      RobSis/zsh-completion-generator
      chrissicool/zsh-256color
      djui/alias-tips
      mafredri/zsh-async
      unixorn/autoupdate-zgen
      zsh-users/zsh-autosuggestions
      zsh-users/zsh-completions
      zsh-users/zsh-history-substring-search
      zsh-users/zsh-syntax-highlighting
EOPLUGINS

  zgen load sindresorhus/pure

  # generate the init script from plugins above
  zgen save
fi
