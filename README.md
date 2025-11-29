# `dotsys`
A Python package to manage config files and general system configuration.


*Table of contents*
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
  - [Install all symlinks](#install-all-symlinks)
  - [Configure `git`](#configure-git)
  - [Configure `ssh`](#configure-ssh)
  - [Install Emacs packages](#install-emacs-packages)
  

## Prerequisites
Make sure you have a Python virtual environment installed.

See https://docs.astral.sh/uv/getting-started/installation/#standalone-installer

You can run the script `<PATH>/<TO>/python-dotsys/pre/setup.sh` and add

``` bash
source $HOME/.venv/bin/activate
```

to your `$HOME/.bashrc` file.

## Installation
Run the following commands to 
1. install the `dotsys` package in the Python virtual environment
2. symlink `python-dotsys/dotfiles/` into `$HOME/.dotfiles/`.

``` bash
mkdir -p $HOME/code/repos/ && cd $HOME/code/repos/
git clone git@github.com:gbeltramo/python-dotsys.git
cd python-dotsys/
bash pre/setup.sh
# manually edit and source .bashrc
make install-editable
```

## Usage

### Install all symlinks

```bash
p -m dotsys --symlinks
```

### Configure `git`

``` bash
bash ~/.dotfiles/git/setup-git.sh
```

### Configure `ssh`

``` bash
bash ~/.dotfiles/ssh/setup-ssh.sh
```

### Install Emacs packages

``` bash
p -m dotsys.emacs --packages
```

**Note** You also need to byte compile the Elisp packages and tangle the
`init.org` config file.
