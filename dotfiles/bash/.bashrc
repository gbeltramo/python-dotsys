# --- Basics
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# --- COLORS
export BLACK="\033[0;30m"
export RED="\033[0;31m"
export GREEN="\033[0;32m"
export YELLOW="\033[0;33m"
export BLUE="\033[0;34m"
export PURPLE="\033[0;35m"
export CYAN="\033[0;36m"

export NC="\033[0m"   # no color

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
[[ ":$PATH:" != *":/usr/local/go/bin:"* ]] && export PATH="/usr/local/go/bin:${PATH}"
[[ ":$PATH:" != *":$HOME/go/bin:"* ]] && export PATH="$HOME/go/bin:${PATH}"
[[ ":$PATH:" != *":$HOME/kotlin_bin:"* ]] && export PATH="$HOME/kotlin_bin:${PATH}"


# --- Format of `ps` command
export PS_FORMAT="pid,ppid,user,tty,stat,time,nice,%cpu,%mem,cmd"


# --- Mask for file creation (need to use `p` flag with tar)
umask 077
# 022 or 077


# --- EDITOR and PAGER
export EDITOR="emacs -nw -Q"
export PAGER=less


# --- Aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gabri/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gabri/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/gabri/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/gabri/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/gabri/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/gabri/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# start tmux when opening a new terminal
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t base || tmux new -s base
fi
