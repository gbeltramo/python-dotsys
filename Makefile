DIST_NAME := dotsys
VERSION := 0.2.0

.PHONY: all build install install-editable format clean 
all: build install test


BUFFER_DATE := $(shell date -u -d '3 days ago' '+%Y-%m-%dT%H:%M:%SZ' 2>/dev/null || date -u -v-3d '+%Y-%m-%dT%H:%M:%SZ')

lock:
	uv lock --exclude-newer ${BUFFER_DATE}
	uv pip compile pyproject.toml  --all-extras --no-annotate --exclude-newer ${BUFFER_DATE} -o requirements_$(shell uname -m).txt

build:
	python -m build

# Note: use "uv sync --group dev" on Mac OS
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
