DIST_NAME := dotsys
VERSION := 0.2.0

.PHONY: all build install install-editable format clean 
all: build install test


lock:
	uv lock
	uv pip compile pyproject.toml -o requirements.txt

build:
	python -m build

install:
	python -m pip install $(wildcard ./dist/$(DIST_NAME)-$(VERSION)*.whl) --force-reinstall -v
	if [ ! -d $(HOME)/.dotfiles ]; then ln -s $(shell pwd)/dotfiles $(HOME)/.dotfiles; fi

install-editable:
	python -m pip install -v --editable .
	if [ ! -d $(HOME)/.dotfiles ]; then ln -s $(shell pwd)/dotfiles $(HOME)/.dotfiles; fi

test:
	python -m pytest --pyargs dotsys -v -rP

format:
	python -m ruff format .

clean:
	rm -rf dist/ || true
	rm -rf .pytest_cache/ || true
	rm *~ || true
