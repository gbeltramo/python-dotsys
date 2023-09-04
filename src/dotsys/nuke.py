import dotsys.utils as utils
import os


def main():
    HOME = utils.get_HOME()
    os.system(f"rm {HOME / '.bashrc'}")
    os.system(f"rm {HOME / '.bash_aliases'}")
    os.system(f"rm {HOME / '.git-prompt.sh'}")
    os.system(f"rm -r {HOME / 'bin'}")
    os.system(f"rm {HOME / '.tmux.conf'}")
    os.system(f"rm {HOME / '.condarc'}")


if __name__ == "__main__":
    main()
