if status is-interactive
    # Commands to run in interactive sessions can go here
end

function j
    cd ..
end

function e
    emacs -Q -nw --eval "(progn (load-theme 'tango-dark t) (defalias 'yes-or-no-p 'y-or-n-p) (global-display-line-numbers-mode t) (ido-mode t) (setq echo-keystrokes 0.1) (setq org-hide-emphasis-markers t) (setq org-src-fontify-natively t) (setq org-fontify-quote-and-verse-blocks t) (setq org-src-tab-acts-natively t) (setq org-edit-src-content-indentation 2) (setq org-hide-block-startup nil) (setq org-src-preserve-indentation nil) (setq org-startup-folded 'content) (setq org-cycle-separator-lines 2) (setq org-startup-with-inline-images t))" $argv
end

function dog
    bat --paging="always" --pager="less -R" --style="header" --wrap="never" --theme="Monokai Extended Bright" $argv
end

function dog-full
    bat --paging="always" --pager="less -R" --style="full" --wrap="never" --theme="Monokai Extended Bright" $argv
end
