"""
Description
-----------
Script used to automate the process of creating and deleting symlinks to
configuration files stored in .dotfiles/

"""

import argparse
import dotsys.bash as bash
import dotsys.bin as bin_dir
import dotsys.emacs as emacs
import dotsys.mamba as mamba
import dotsys.nuke as nuke
import dotsys.tmux as tmux


def main(args):
    """Create or delete config files in $HOME."""

    if args.nuke:
        print("1 - Nuking all config files")
        nuke.main()
    else:
        print("1 - Not nuking all config files")

    if args.symlinks:
        print("2 - Creating all symlink")
        bash.create_symlinks()
        bin_dir.create_symlinks()
        emacs.create_symlinks()
        mamba.create_symlinks()
        tmux.create_symlinks()
    else:
        print("2 - Not creating all symlinks")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Manage files in .dotfiles/")
    parser.add_argument("-n", "--nuke", action="store_true", help="Delete of config files")
    parser.add_argument("-s", "--symlinks", action="store_true", help="Create symlinks")
    args = parser.parse_args()

    return args


if __name__ == "__main__":
    args = parse_args()
    main(args)
