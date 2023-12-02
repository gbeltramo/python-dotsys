#!/usr/bin/env bash

# Setup `g` alias with symlink
cd /usr/local/bin/ && sudo ln -s $(which git) g

# personal git config
git config --global user.name "Gabriele Beltramo"
git config --global user.email "hello@gbeltramo.com"
git config --global init.defaultBranch main
git config --global core.editor "emacs --no-window-system --quick"

# git subcommands
git config --global alias.s "status --short --branch --untracked-files=all"
git config --global alias.sv "status --long"
git config --global alias.d "diff --stat HEAD"
git config --global alias.dv "diff HEAD"
git config --global alias.g "log --date=format:'%d/%m/%y %H:%M' --graph --pretty=format:'%C(auto, yellow)%h%Creset%C(auto, green)%d%Creset %C(auto, blue)%an%Creset %ad %C(auto, green)|%Creset %s' --all"
git config --global alias.gv "log --graph --stat --date=format:'%d/%m/%y %H:%M' --pretty=format:'%C(auto, yellow)%h%Creset%C(auto, green)%d%Creset %C(auto, blue)%an%Creset %ad %C(auto, green)%n%CresetSubject: %s%n%b%n' --all"
git config --global alias.b "branch --all"
git config --global alias.bv "branch --all --verbose"
git config --global alias.a "add"
git config --global alias.c "commit"
git config --global alias.ac "commit --all"
git config --global alias.w "worktree"
git config --global alias.p "pull"
git config --global alias.pa '!git pull && git submodule update --init --recursive'

# reflog config
git config --global core.logAllRefUpdates true
git config --global gc.refLogExpire 30
git config --global gc.refLogExpireUnreachable 90
# Run `git reflog expire --expire=now --all && git gc` to delete the reflog
