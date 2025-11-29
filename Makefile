DIST_NAME := dotsys
VERSION := 0.2.0
PYTHON := $(HOME)/.venv/bin/python

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
	$(PYTHON) -m ruff format .

clean:
	rm -rf dist/
	rm -rf .pytest_cache/
