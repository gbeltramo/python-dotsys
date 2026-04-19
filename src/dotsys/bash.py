import argparse
import dotsys.symlink as symlink
import dotsys.utils as utils


def main(args):
    if args.symlinks:
        print("1 - Creating shell symlinks")
        create_symlinks()
    else:
        print("1 - Not creating Bash symlinks")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Manage Bash init files")
    parser.add_argument("-s", "--symlinks", action="store_true", help="Create symlinks")
    args = parser.parse_args()

    return args


def create_symlinks():
    HOME = utils.get_HOME()

    print("create_symlinks: .bashrc")
    symlink.create(
        source_path=HOME / ".dotfiles" / "bash" / ".bashrc",
        dest_path=HOME / ".bashrc",
    )

    print("create_symlinks: .bash_aliases")
    symlink.create(
        source_path=HOME / ".dotfiles" / "bash" / ".bash_aliases",
        dest_path=HOME / ".bash_aliases",
    )

    print("create_symlinks: .git-prompt.sh")
    symlink.create(
        source_path=HOME / ".dotfiles" / "bash" / ".git-prompt.sh",
        dest_path=HOME / ".git-prompt.sh",
    )


if __name__ == "__main__":
    args = parse_args()
    main(args)
