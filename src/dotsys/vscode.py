import argparse
import dotsys.symlink as symlink
import dotsys.utils as utils
import platform


def main(args):
    if args.symlinks:
        print("1 - Creating VS code symlink")
        create_symlinks()
    else:
        print("1 - Not creating VS code symlinks")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Manage VS code config")
    parser.add_argument("-s", "--symlinks", action="store_true", help="Create symlinks")
    args = parser.parse_args()

    return args


def create_symlinks():
    HOME = utils.get_HOME()

    if platform.system() == "Linux":
        dest_path = HOME / ".config" / "Code" / "User"
    elif platform.system() == "Darwin":
        dest_path = HOME / "Library" / "Application\ Support" / "Code" / "User"
    else:
        raise ValueError(f"platform={platform.system()} is invalid")

    symlink.create(
        source_path=HOME / ".dotfiles" / "vscode" / "settings.json",
        dest_path=dest_path / "settings.json",
    )


if __name__ == "__main__":
    args = parse_args()
    main(args)
