# `dotsys`
A Python package to manage config files and general system configuration.

## Prerequisites: a Python virtual environment
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

## Install
Run the following commands to 
1. install the `dotsys` package in the Python virtual environment installed in the previous section 
2. symlink `python-dotsys/dotfiles/` into `$HOME/.dotfiles/`.

``` bash
mkdir -p $HOME/code/repos/ && cd $HOME/code/repos/
git clone git@github.com:gbeltramo/python-dotsys.git
cd python-dotsys/
make install-editable
```

## Usage
Run

```bash
p -m dotsys --help
```

