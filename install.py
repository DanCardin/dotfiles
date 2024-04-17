#!/usr/bin/env python3
import os
import abc
import urllib.request
import subprocess
import functools
from os.path import expanduser
import shutil
import shlex


def run(command, **kwargs):
    result = subprocess.run(shlex.split(command), check=True, **kwargs)
    return result


class Package(metaclass=abc.ABCMeta):
    def __init__(
        self, name, binary_name=None, symlinks=(), setup=(), os=None, options=""
    ):
        self.name = name
        self.binary_name = binary_name or name
        self.symlinks = symlinks
        self.setup = setup
        self.options = options
        self.os = os

    @functools.lru_cache
    def uname(self):
        return run("uname", stdout=subprocess.PIPE).stdout.decode("utf-8").strip()

    @property
    def is_macos(self):
        return "Darwin" in self.uname()

    @property
    def is_linux(self):
        return not self.is_macos

    @property
    @abc.abstractmethod
    def ready(self):
        """
        """

    @abc.abstractmethod
    def ensure_ready(self):
        """
        """

    @abc.abstractmethod
    def _install(self):
        """
        """

    def install(self):
        if self.os:
            if self.os not in ("linux", "macos"):
                raise ValueError("{} not one of: linux, macos".format(self.os))

            if not all(
                [
                    self.is_macos and self.os == "macos",
                    self.is_linux and self.os == "linux",
                ]
            ):
                return

        if not self.ready:
            self.ensure_ready()

        if not self.check_exists():
            self._install()

        self.setup_symlinks()

    def check_exists(self):
        shutil.which(self.binary_name)

    def setup_symlinks(self):
        for source, target in self.symlinks:
            target = os.path.expanduser(target)

            if os.path.islink(target):
                run("rm {}".format(target))

            if os.path.exists(target):
                run("rm -r {}".format(target))

            os.symlink(
                os.path.abspath(source),
                target,
                target_is_directory=os.path.isdir(source),
            )

    def setup_calls(self):
        for call in self.setup:
            run("{binary} {call}".format(binary=self.binary_name, call=call))


class CargoPackage(Package):
    toolchain = "stable"

    @property
    def ready(self):
        return shutil.which("cargo")

    def ensure_ready(self):
        response = urllib.request.urlopen("https://sh.rustup.rs")
        script = shlex.quote(response.read().decode("utf-8"))
        run("bash -c '{}'".format(script), input=b"1")
        run("rustup self update")
        run("rustup update nightly")
        run("rustup default nightly")

        run("rustup component add rls-preview --toolchain={}".format(self.toolchain))
        run("rustup component add rust-analysis --toolchain={}".format(self.toolchain))
        run("rustup component add rust-src --toolchain={}".format(self.toolchain))

    def _install(self):
        run("cargo install {}".format(self.name))


class PipxPackage(Package):
    @property
    def ready(self):
        return shutil.which("pipx")

    def ensure_ready(self):
        response = urllib.request.urlopen(
            "https://raw.githubusercontent.com/cs01/pipx/master/get-pipx.py"
        )
        script = shlex.quote(response.read().decode("utf-8"))
        run("python3 -c '{}'".format(script))

    def _install(self):
        run("pipx install {}".format(self.name))


class BrewPackage(Package):
    def __init__(self, *args, cask=False, tap=None, **kwargs):
        super().__init__(*args, **kwargs)
        self.cask = cask
        self.tap = tap

    @property
    def ready(self):
        return shutil.which("brew")

    def ensure_ready(self):
        response = urllib.request.urlopen(
            "https://raw.githubusercontent.com/HomeBrew/install/master/install"
        )
        script = shlex.quote(response.read().decode("utf-8"))
        run("ruby -e {}".format(script), input=b"\n")

    @staticmethod
    @functools.lru_cache
    def list_installed(self):
        return run("brew list")

    def check_exists(self):
        result = self.list_installed()
        shutil.which(self.binary_name)

    def _install(self):
        if self.tap:
            run("brew tap {}".format(self.tap))

        if self.cask:
            run("brew cask install {} {}".format(self.options, self.name))
        else:
            run("brew install {} {}".format(self.options, self.name))


packages = [
    CargoPackage("bat"),
    CargoPackage("du-dust", "dust"),
    CargoPackage("exa"),
    CargoPackage("loc"),
    CargoPackage("nu"),
    CargoPackage("procs"),
    CargoPackage("ripgrep", "rg"),
    CargoPackage("viu"),
    CargoPackage("cargo-watch"),
    CargoPackage("cargo-flamegraph"),
    # Python
    PipxPackage("awscli", "aws"),
    PipxPackage("bandit"),
    PipxPackage("black"),
    PipxPackage("bumpversion"),
    PipxPackage("check-manifest"),
    PipxPackage("mypy"),
    PipxPackage("pgcli"),
    PipxPackage("ptpython", symlinks=(("config/ptpython", "~/.ptpython")),),
    PipxPackage("python-language-server", "pyls"),
]


def setup_ssh():
    already_existed = os.path.exists(expanduser("~/.ssh/hosts.d"))
    os.makedirs(os.path.expanduser("~/.ssh/hosts.d"), exist_ok=True)
    if already_existed:
        os.rename(expanduser("~/.ssh/config"), expanduser("~/.ssh/hosts.d/old"))
    # os.symlink(os.path.abspath("ssh/config"), os.path.expanduser("~/.ssh/config"))
    # os.symlink(os.path.abspath("ssh/hosts.d/work"), os.path.expanduser("~/.ssh/hosts.d/work"))


# TODO: "pip install neovim" from inside neovim2/3 venvs
# TODO: "sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /"


if __name__ == "__main__":
    folders = [
        "~/.config",
        "~/.local",
        "~/.local/bin",
        "~/.local/share/karabiner",
        "~/.local/share/nvim",
        "~/.local/share/wd",
        "~/.local/share/zsh",
        "~/.ssh",
    ]
    for folder in folders:
        os.makedirs(folder, exist_ok=True)

    setup_ssh()
