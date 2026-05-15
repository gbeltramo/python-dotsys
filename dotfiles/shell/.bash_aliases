# -*- mode: sh -*-

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# move back one directory
alias j="cd .."

# open file
alias o="open"

# remove cached python files in project
alias pyclean='find . | grep -E "(/__pycache__$|\.pyc$|\.pyo$)" | xargs rm -rf'

# quick editor
alias e='emacs --no-window-system --quick --eval "(progn (global-display-line-numbers-mode t) (column-number-mode t) (load-theme '"'"'tango-dark) (ido-mode t) (fset '"'"'yes-or-no-p '"'"'y-or-n-p) (setq scroll-conservatively 101) (delete-selection-mode t) (setq echo-keystrokes 0.1) (setq require-final-newline t) (add-hook '"'"'before-save-hook '"'"'delete-trailing-whitespace))"'
alias ee="emacs 1>&2 > /dev/null &"

# more processes info
alias ps="ps fax"

# GNU time command with more info
alias t='command time -f "---\nProgram name: %C\nTotal time (minutes:seconds): %E\nUser mode: %U\nKernel mode: %S\nAverage CPU time: %P\nAverage (data+stack+text) memory usage (Kilobytes): %K\nExist status: %x"'

# For convinience of use with minikube
alias kubectl="minikube kubectl --"

# bat replacement for cat
# Note: need to "cd /usr/local/bin && ln -s /usr/bin/batcat bat"
alias dog="bat --style=plain --pager=less --theme ansi"
alias dog-full="bat --style=full --pager=less --theme ansi"
# Temp fix for ghostty terminal
alias btop="btop --utf-force"
