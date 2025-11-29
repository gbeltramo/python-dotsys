#!/usr/bin/env bash

sudo apt update
sudo apt upgrade --yes
export P_VERSION=3.14
uv self update
uv python install $P_VERSION

cd $HOME
if [ ! -e $HOME/.venv/ ]; then uv venv --seed --prompt home-py314 --python $P_VERSION; else echo ".venv/ already exists"; fi
$HOME/.venv/bin/python$P_VERSION -m pip install -U setuptools>=80.0.0 wheel pip termcolor numpy build pytest ruff>=0.14.0 ipython

sudo apt install htop tree
sudo apt install --yes bat # better cat
sudo apt install --yes duf # better df -h
sudo apt install --yes btop # better htop
