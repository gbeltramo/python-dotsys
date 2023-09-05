import argparse
import dotsys.symlink as symlink
import dotsys.utils as utils


def main(args):
    if args.symlinks:
        print("1 - Creating mamba symlink")
        create_symlinks()
    else:
        print("1 - Not creating mamba symlinks")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Manage conda/mamba config")
    parser.add_argument("-s", "--symlinks", action="store_true", help="Create symlinks")
    args = parser.parse_args()

    return args


def create_symlinks():
    HOME = utils.get_HOME()

    symlink.create(
        source_path=HOME / ".dotfiles" / "mamba" / ".condarc", dest_path=HOME / ".condarc"
    )


if __name__ == "__main__":
    args = parse_args()
    main(args)
