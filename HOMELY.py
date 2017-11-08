import os
import subprocess
from functools import lru_cache
from os.path import expanduser

from homely.files import mkdir, symlink
from homely.install import installpkg
from homely.system import execute, haveexecutable


class Linux:
    pass


class MacOs:
    pass


class OperatingSystem:
    @classmethod
    @lru_cache(1)
    def type(cls):
        _, uname, _ = execute(['uname'], stdout=True)
        uname = uname.decode('utf-8').strip()
        if 'Darwin' in uname:
            return MacOs
        return Linux


class Setup:
    def brew(self):
        installpkg('ruby')
        if OperatingSystem.type() == MacOs:
            source = 'HomeBrew'
        else:
            source = 'LinuxBrew'

        if not haveexecutable('brew'):
            execute(['/usr/bin/ruby', '-e', f'"$(curl -fsSL https://raw.githubusercontent.com/{source}/install/master/install)"'])

    def shell(self):
        installpkg('zsh')
        symlink('config/zsh/zshrc', '~/.zshrc')
        symlink('config/zsh', '~/.config/zsh')
        symlink('config/zsh/zgen', '~/.zgen')

    def ssh(self):
        already_existed = False
        if os.path.exists(expanduser('~/.ssh/hosts.d')):
            already_existed = True
        mkdir('~/.ssh/hosts.d')
        if not already_existed:
            os.rename(expanduser('~/.ssh/config'), expanduser('~/.ssh/hosts.d/old'))
        symlink('ssh/config', '~/.ssh/config')
        symlink('ssh/hosts.d/work', '~/.ssh/hosts.d/work')

    def python(self):
        if not haveexecutable('pipsi'):
            subprocess.check_output('curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python', shell=true)

        packages = [
            'pipenv',
            'pipsi',
            'pgcli',
        ]
        for package in packages:
            if not haveexecutable(package):
                execute(['pipsi', 'install', package])

        installpkg('pyenv')
        installpkg('pyenv-virtualenv')

        symlink('pythonstartup', '~/.pythonstartup')
        execute(['rm', '-r', expanduser('~/.ptpython')])
        symlink('ptpython', '~/.ptpython')
        execute(['pyenv', 'install', '3.6.2', '--skip-existing'])
        execute(['pyenv', 'global', '3.6.2'])

    def rust(self):
        if not haveexecutable('rustc'):
            subprocess.check_output('curl https://sh.rustup.rs -sSf | sh', shell=true)

    def nvim(self):
        installpkg('neovim')
        execute(['pip', 'install', 'neovim'])
        symlink('config/nvim', '~/.config/nvim')

    def fonts(self):
        if not os.path.exists('fonts'):
            execute(['git', 'clone', 'https://github.com/powerline/fonts.git', '--depth=1'])
            execute(['./install.sh'], cwd='fonts')

    def tmux(self):
        installpkg('tmux')
        symlink('tmux.conf', '~/.tmux.conf')

    def docker(self):
        if not haveexecutable('virtualbox'):
            execute(['brew', 'cask', 'install', 'virtualbox'])

        if not haveexecutable('docker'):
            execute(['brew', 'cask', 'install', 'docker'])
        installpkg('docker')
        installpkg('docker-compose')
        installpkg('docker-machine')

    def alacritty(self):
        if haveexecutable('alacritty'):
            return
        if OperatingSystem.type() == Linux:
            installpkg('libfreetype6-dev')
            installpkg('libfontconfig1-dev')

        installpkg('cmake')
        if OperatingSystem.type() == Linux:
            installpkg('xclip')

        cwd = 'alacritty'
        execute(['git', 'clone', 'https://github.com/jwilm/alacritty.git'])
        try:
            execute(['cargo', 'build', '--release'], cwd=cwd)

            if OperatingSystem.type() == MacOs:
                execute(['make', 'app'], cwd=cwd)
                execute(['cp', '-r', 'target/release/osx/Alacritty.app', '/Applications/Alacritty.app'], cwd=cwd)
            execute(['cp', 'target/release/alacritty', expanduser('~/.local/bin/alacritty')], cwd=cwd)
        finally:
            execute(['rm', '-rf', 'alacritty'])

        symlink('config/alacritty', '~/.config/alacritty')

    def run(self):
        folders = [
            '~/.ssh',
            '~/.config',
            '~/.local',
            '~/.local/bin',
            '~/.local/share',
        ]
        for folder in folders:
            mkdir(folder)

        self.brew()
        self.shell()
        self.ssh()
        self.python()
        self.rust()
        self.nvim()
        self.fonts()
        self.tmux()
        self.docker()
        self.alacritty()

        packages = [
            'awscli',
            'ctags',
            'direnv',
            'exa',
            'fzf',
            'git',
            'httpie',
            'ripgrep',
            'z',
        ]

        if OperatingSystem.type == MacOs:
            packages.append('reattach-to-user-namespace')

        for package in packages:
            installpkg(package)

        symlink('config/karabiner', '~/.config/karabiner')
        symlink('config/alacritty', '~/.config/alacritty')


Setup().run()
