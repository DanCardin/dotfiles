#!/usr/bin/env sh

curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python
pip install homely
homely add https://github.com/dancardin/dotfiles
homely update
