import argparse
import dotsys.symlink as symlink
import dotsys.utils as utils


def main(args):
    if args.symlinks:
        print("1 - Creating bin/ symlink")
        create_symlinks()
    else:
        print("1 - Not creating bin/ symlinks")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Manage bin/ scripts")
    parser.add_argument("-s", "--symlinks", action="store_true", help="Create symlinks")
    args = parser.parse_args()

    return args


def create_symlinks():
    HOME = utils.get_HOME()

    symlink.create(source_path=HOME / ".dotfiles" / "bin", dest_path=HOME / "bin")


if __name__ == "__main__":
    args = parse_args()
    main(args)
