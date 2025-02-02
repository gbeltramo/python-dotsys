# -*- mode: sh -*-
# --- Basics
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export TERM=xterm

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# --- PROMPT
# Next lines are for Git repo branch name in prompt
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=t

# - Uncomment next lines for Zsh
# autoload -U colors && colors
# PROMPT_SUBST
# PS1='[%{$fg[blue]%}%n%{$reset_color%} %{$fg[yellow]%}%~$(__git_ps1 " (%s)")%{$reset_color%}] %# '

# - Uncomment next lines for Bash
PS1='[\[\033[34m\]\u@$(hostname -i)\[\033[0m\]] \w \[\033[33m\]$(__git_ps1 " (%s)")\[\033[0m\] \$ '


# --- Append to PATH
[[ ":$PATH:" != *":$HOME/bin:"* ]] && export PATH="$HOME/bin:${PATH}"
[[ ":$PATH:" != *":$HOME/.local/python-venv/pybin:"* ]] && export PATH="$HOME/.local/python-venv/pybin:${PATH}"
[[ ":$PATH:" != *":$HOME/Lang/go/bin:"* ]] && export PATH="$HOME/Lang/go/bin:${PATH}"
[[ ":$PATH:" != *":$HOME/Lang/zig/bin:"* ]] && export PATH="$HOME/Lang/zig/bin:${PATH}"

# --- Format of `ps` command
export PS_FORMAT="pid,ppid,user,tty,stat,time,nice,%cpu,%mem,cmd"


# --- Mask for file creation (need to use `p` flag with tar)
umask 077
# 022 or 077


# --- EDITOR and PAGER
export EDITOR="emacs -nw -Q"
export PAGER="less"


# --- Aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi


# Temporary
source $HOME/code/Kaggle/kaggle-czii-cryoet-2024/venv-cryoet/bin/activate

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t base || tmux new -s base
fi
