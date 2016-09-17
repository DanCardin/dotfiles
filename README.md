# Cloning this

    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    echo ".cfg" >> .gitignore
    git clone --bare https://github.com/DanCardin/.dotfiles $HOME/.cfg
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    config checkout
    config config --local status.showUntrackedFiles no

or

    curl -Lks http://bit.do/cfg-install | /bin/bash
