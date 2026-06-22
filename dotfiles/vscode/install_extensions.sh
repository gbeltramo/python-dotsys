echo "VS Code --version:" $(code --version)
echo "VS Code location:" $(which code)

echo "---"
echo "VS Code installed extensions:"
code --list-extensions

echo "---"

# Bash array of VS Code extensions to be installed
extensions=(
    "ms-python.python"                # Python extension
    "ms-python.vscode-pylance"        # Pylance language server
    "ms-vscode-remote.remote-ssh"     # Remote SSH
    "dart-code.flutter"               # Flutter support
    "dart-code.dart-code"             # Dart language support
)

for id_ext in "${extensions[@]}"; do
    echo "Installing or updating: $id_ext"
    code --install-extension "$id_ext"
done

echo "---"
echo "Installed extensions:"
code --list-extensions
