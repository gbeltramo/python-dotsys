import pathlib
import os
import warnings


def get_HOME() -> pathlib.PosixPath:
    """Return $HOME env variable."""

    try:
        HOME = pathlib.Path(os.environ["HOME"])
    except KeyError as key_err:
        warnings.warn(f"HOME is not a env variable")
        raise key_err

    return HOME
