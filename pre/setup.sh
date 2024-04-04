#!/usr/bin/env bash

# 1
sudo apt update
sudo apt full-upgrade
export P_VERSION=3.11
sudo apt install --yes python$P_VERSION python$P_VERSION-dev python$P_VERSION-venv

# 2
/usr/bin/python$P_VERSION -m venv $HOME/.local/python-venv
$HOME/.local/python-venv/bin/python$P_VERSION -m pip install -U setuptools wheel pip
$HOME/.local/python-venv/bin/python$P_VERSION -m pip install termcolor black numpy build pytest pydub

# 3
mkdir -p $HOME/.local/python-venv/pybin/ && cd $HOME/.local/python-venv/pybin/
ln -s $HOME/.local/python-venv/bin/python$P_VERSION p

# 4
echo "----------"
echo ">>> NOTE: Remember to add $HOME/.local/python-venv/pybin/ to your PATH env variable"
echo ">>>   or use p -m dotsys --symlinks"
echo "----------"
