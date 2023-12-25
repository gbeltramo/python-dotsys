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
1. Install `python3`
2. Create a virtual environmnet in `$HOME/.local` named `python-venv`
3. Symlink `$HOME/.local/python-venv/bin/python3` to `$HOME/.local/python-venv/pybin/p`
4. Make sure `$HOME/.local/python-venv/pybin/` is in your `$PATH` environment variable

For example, if you are using `bash` and the `apt` package manager, you can run the script `<PATH>/<TO>/python-dotsys/pre/setup.sh` and add

``` bash
# prepend to $PATH only if not already in
[[ ":$PATH:" != *":$HOME/.local/python-venv/pybin/:"* ]] && PATH="$HOME/.local/python-venv/pybin/:${PATH}"
```

to your `$HOME/.bashrc` file.

## Installation
Run the following commands to 
1. install the `dotsys` package in the Python virtual environment described in the previous section 
2. symlink `python-dotsys/dotfiles/` into `$HOME/.dotfiles/`.

``` bash
mkdir -p $HOME/code/repos/ && cd $HOME/code/repos/
git clone git@github.com:gbeltramo/python-dotsys.git
cd python-dotsys/
bash pre/setup.sh
export PATH="$HOME/.local/python-venv/pybin:${PATH}"
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
