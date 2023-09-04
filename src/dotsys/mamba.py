import dotsys.symlink as symlink
import dotsys.utils as utils


def create_symlinks():
    HOME = utils.get_HOME()

    symlink.create(
        source_path=HOME / ".dotfiles" / "mamba" / ".condarc", dest_path=HOME / ".condarc"
    )


if __name__ == "__main__":
    create_symlinks()
