if test -f /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
end
fish_add_path /opt/homebrew/opt/git/bin

fish_add_path $HOME/Lang/flutter/bin
fish_add_path $HOME/Lang/zig/bin
fish_add_path /usr/local/go/bin
fish_add_path $HOME/Lang/android-studio/bin
fish_add_path /usr/local/cuda-13.2/bin/
fish_add_path $HOME/Android/Sdk/platform-tools
fish_add_path $HOME/Android/Sdk/cmdline-tools/latest/bin

set --export --global TERM xterm
set --export --global ANDROID_HOME $HOME/Android/Sdk
set --export --global ANDROID_SDK_ROOT $HOME/Android/Sdk
set --export --global HF_HOME $HOME/.cache/huggingface
set --export --global HF_HUB_CACHE $HOME/.cache/huggingface/hub

function ls
    command ls --color=auto $argv
end

function la
    command ls -A --color=auto $argv
end

function ll
    command ls -lah --color=auto $argv
end

function j
    cd ..
end

function e
    emacs -Q -nw --eval "(progn (load-theme 'tango-dark t) (defalias 'yes-or-no-p 'y-or-n-p) (global-display-line-numbers-mode t) (ido-mode t) (setq echo-keystrokes 0.1) (setq org-hide-emphasis-markers t) (setq org-src-fontify-natively t) (setq org-fontify-quote-and-verse-blocks t) (setq org-src-tab-acts-natively t) (setq org-edit-src-content-indentation 2) (setq org-hide-block-startup nil) (setq org-src-preserve-indentation nil) (setq org-startup-folded 'content) (setq org-cycle-separator-lines 2) (setq org-startup-with-inline-images t))" $argv
end

function _dog_impl
    set -l style $argv[1]
    set -e argv[1]

    set -l cmd
    if type -q bat
        set cmd bat
    else if type -q batcat
        set cmd batcat
    else
        echo "Neither bat nor batcat found" >&2
        return 1
    end

    $cmd --paging="always" --pager="less -R" --style="$style" --wrap="never" --theme="Monokai Extended Bright" $argv
end

function dog
    _dog_impl header $argv
end

function dog-full
    _dog_impl full $argv
end

if test -f ~/.venv/bin/activate.fish
    source ~/.venv/bin/activate.fish
end

if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end
