import pathlib
import os


def create(source_path: pathlib.PosixPath, dest_path: pathlib.PosixPath) -> None:
    """Symlink `source_path` to `dest_path`."""

    source = source_path.absolute()
    dest = dest_path.absolute()

    assert source.exists(), f"{source=} is not a file"

    _delete(dest)
    cmd = f"ln -s {source} {dest}"
    os.system(cmd)


def _delete(path: pathlib.PosixPath) -> None:
    """Delete a symlink."""

    abs_path = path.absolute()

    if abs_path.is_symlink():
        cmd = f"rm {abs_path}"
        os.system(cmd)
    elif abs_path.exists() and (not abs_path.is_symlink()):
        raise ValueError(
            f"{abs_path=} is not a symlink."
            " Please remove it before installing the symlinks to your .dotfiles"
        )
