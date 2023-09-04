import dotsys.symlink as symlink
import dotsys.utils as utils


def create_symlinks():
    HOME = utils.get_HOME()

    symlink.create(source_path=HOME / ".dotfiles" / "bash" / ".bashrc", dest_path=HOME / ".bashrc")

    symlink.create(
        source_path=HOME / ".dotfiles" / "bash" / ".bash_aliases", dest_path=HOME / ".bash_aliases"
    )

    symlink.create(
        source_path=HOME / ".dotfiles" / "bash" / ".git-prompt.sh",
        dest_path=HOME / ".git-prompt.sh",
    )


if __name__ == "__main__":
    create_symlinks()
