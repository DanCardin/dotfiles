source ~/.dotfiles/zgen/zgen.zsh

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen loadall <<EOPLUGINS
        DanCardin/zsh-vim-mode
        S1cK94/minimal minimal
        chrissicool/zsh-256color
        djui/alias-tips
        unixorn/autoupdate-zgen
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-history-substring-search
EOPLUGINS
    zgen load zsh-users/zsh-completions src
    zgen save
fi

source ~/.bashrc
