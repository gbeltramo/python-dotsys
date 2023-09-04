"""
Description
-----------
Script used to automate the process of creating and deleting symlinks to
configuration files stored in .dotfiles/

"""

import argparse
import dotsys.bash as bash
import dotsys.bin as bin_dir
import dotsys.tmux as tmux
import dotsys.mamba as mamba


def main(args):
    """Create or delete config files in $HOME."""

    if args.nuke:
        nuke.main()
        print("1 - Nuking all config files")
    else:
        print("1 - Not nuking all config files")

    if args.symlinks:
        bash.create_symlinks()
        bin_dir.create_symlinks()
        tmux.create_symlinks()
        mamba.create_symlinks()
        print("2 - Creating all config files")
    else:
        print("2 - Not creating all symlinks")


def parse_args() -> argparse.Namespace:
    """Parse arguments passed on the command line to `python3 manage.py`."""

    parser = argparse.ArgumentParser(description="Manage files in .dotfiles/")
    parser.add_argument("-n", "--nuke", action="store_true", help="Delete of config files")
    parser.add_argument("-s", "--symlinks", action="store_true", help="Create symlinks")
    args = parser.parse_args()

    return args


if __name__ == "__main__":
    args = parse_args()
    main(args)
