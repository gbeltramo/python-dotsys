#!/usr/bin/bash

echo "VS Code --version:" $(code --version)
echo "VS Code location:" $(which code)

echo "---"
echo "VS Code installed extensions:"
echo $(code --list-extensions)

echo "---"
# Bash array of VS Code extensions to be installed
extensions=(
    "ms-vscode.cpptools"             # C/C++ language
    "ms-python.python"               # MS Python
    "ms-python.isort"                # Python imports organization
    "vlanguage.vscode-vlang"         # V programming language
    "golang.go"                      # Go programming language
    "aaron-bond.better-comments"     # Colored comments
    "lfs.vscode-emacs-friendly"      # Emacs key bindings
    "yzhang.markdown-all-in-one"     # Markdown All in One
    "ryanolsonx.zenburn"             # Zenburn theme
    "bungcip.better-toml"            # TOML syntax
    "pomdtr.excalidraw-editor"       # ExcaliDraw diagrams
    "bierner.markdown-mermaid"       # Mermaid in Markdown
    "lbauskar.kanban"                # Kanban board
)

for id_ext in "${extensions[@]}"; do
    echo "Installing or updating: " $id_ext
    code --install-extension $id_ext
done
