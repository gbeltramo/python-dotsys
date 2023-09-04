DIST_NAME := dotsys
VERSION := 0.1.0
PYTHON := $(HOME)/.local/python-venv/pybin/p

.PHONY: all build install install-editable format clean 
all: build install test


build:
	$(PYTHON) -m build

install:
	$(PYTHON) -m pip install $(wildcard ./dist/$(DIST_NAME)-$(VERSION)*.whl) --force-reinstall -v
	if [ ! -d $(HOME)/.dotfiles ]; then ln -s $(shell pwd)/dotfiles $(HOME)/.dotfiles; fi

install-editable:
	$(PYTHON) -m pip install -v --editable .
	if [ ! -d $(HOME)/.dotfiles ]; then ln -s $(shell pwd)/dotfiles $(HOME)/.dotfiles; fi

test:
	$(PYTHON) -m pytest --pyargs dotsys -v -rP

format:
	$(PYTHON) -m black --line-length 100 --target-version py311 .

clean:
	rm -rf dist/
	rm -rf .pytest_cache/
