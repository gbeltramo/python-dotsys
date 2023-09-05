import dotsys.utils as utils
import os
import platform


def main():
    HOME = utils.get_HOME()
    os.system(f"rm {HOME / '.bashrc'}")
    os.system(f"rm {HOME / '.bash_aliases'}")
    os.system(f"rm {HOME / '.git-prompt.sh'}")
    os.system(f"rm {HOME / 'bin'}")
    os.system(f"rm {HOME / '.emacs.d'}")
    os.system(f"rm {HOME / '.tmux.conf'}")
    os.system(f"rm {HOME / '.condarc'}")

    if platform.system() == "Linux":
        vscode_path = HOME / ".config" / "Code" / "User" / "settings.json"
    elif platform.system() == "Darwin":
        vscode_path = HOME / "Library" / "Application\ Support" / "Code" / "User" / "settings.json"
    else:
        raise ValueError(f"platform={platform.system()} is invalid")
    os.system(f"rm {vscode_path}")


if __name__ == "__main__":
    main()
