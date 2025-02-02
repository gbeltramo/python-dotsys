import argparse
import dotsys.symlink as symlink
import dotsys.utils as utils
import os

from typing import Tuple


def main(args):
    if args.symlinks:
        print("1 - Creating Emacs symlink")
        create_symlinks()
    else:
        print("1 - Not creating Emacs symlinks")

    if args.packages:
        print("2 - Downloading all Emacs packages in ~/.emacs.d/elisp")
        download_packages(emacs_pkgs)
    else:
        print("2 - Not downloading all Emacs packages in ~/.emacs.d/elisp")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Manage Emacs config and packages")
    parser.add_argument("-s", "--symlinks", action="store_true", help="Create symlinks")
    parser.add_argument("-p", "--packages", action="store_true", help="Download Emacs packages")
    args = parser.parse_args()

    return args


def create_symlinks() -> None:
    HOME = utils.get_HOME()

    symlink.create(source_path=HOME / ".dotfiles" / ".emacs.d", dest_path=HOME / ".emacs.d")


emacs_pkgs = (
    ("https://github.com/abo-abo/ace-window.git", "ace-windows"),
    ("https://github.com/abo-abo/avy.git", "avy"),
    ("https://github.com/rolandwalker/anaphora.git", "anaphora"),
    ("https://github.com/auto-complete/auto-complete.git", "auto-complete"),
    ("https://github.com/emacs-compat/compat.git", "compat"),
    ("https://github.com/minad/consult.git", "consult"),
    ("https://github.com/minad/corfu.git", "corfu"),
    ("https://github.com/magnars/dash.el.git", "dash"),
    ("https://github.com/spotify/dockerfile-mode.git", "dockerfile-mode"),
    ("https://github.com/kiwanami/emacs-deferred.git", "deferred"),
    ("https://github.com/hniksic/emacs-htmlize.git", "htmlize"),
    ("https://github.com/millejoh/emacs-ipython-notebook.git", "ipython-notebook"),
    ("https://github.com/Emacs-Kotlin-Mode-Maintainers/kotlin-mode.git", "kotlin-mode"),
    ("https://github.com/tkf/emacs-python-environment.git", "python-environment"),
    ("https://github.com/tkf/emacs-request.git", "request"),
    ("https://github.com/skeeto/emacs-web-server.git", "web-server"),
    ("https://github.com/ahyatt/emacs-websocket.git", "websocket"),
    ("https://github.com/justbur/emacs-which-key.git", "which-key"),
    ("https://github.com/flycheck/flycheck.git", "flycheck"),
    ("https://github.com/intramurz/flycheck-eglot.git", "flycheck-eglot"),
    ("https://github.com/flycheck/flycheck-inline.git", "flycheck-inline"),
    ("https://github.com/dominikh/go-mode.el.git", "go-mode"),
    ("https://github.com/ppareit/graphviz-dot-mode.git", "graphviz-dot-mode"),
    ("https://github.com/syohex/emacs-hcl-mode.git", "hcl-mode"),
    ("https://github.com/abo-abo/hydra.git", "hydra"),
    ("https://github.com/mooz/js2-mode.git", "js2-mode"),
    ("https://github.com/minad/marginalia.git", "marginalia"),
    ("https://github.com/jrblevin/markdown-mode.git", "markdown-mode"),
    ("https://github.com/oantolin/orderless.git", "orderless"),
    ("https://github.com/yjwen/org-reveal.git", "org-reveal"),
    ("https://github.com/emacsorphanage/pkg-info.git", "pkg-info"),
    ("https://github.com/polymode/polymode.git", "polymode"),
    ("https://github.com/auto-complete/popup-el.git", "popup"),
    ("https://github.com/protesilaos/pulsar.git", "pulsar"),
    ("https://github.com/magnars/s.el.git", "s"),
    ("https://github.com/skeeto/skewer-mode.git", "skewer-mode"),
    ("https://github.com/minad/tempel.git", "tempel"),
    ("https://github.com/minad/vertico.git", "vertico"),
    ("https://github.com/yoshiki/yaml-mode.git", "yaml-mode"),
    ("https://github.com/purcell/emacs-reformatter", "reformatter"),  # Zig dep
    ("https://github.com/ziglang/zig-mode", "zig-mode"),
    ("https://github.com/tkf/emacs-jedi.git", "python-jedi"),  # jedi
    ("https://github.com/kiwanami/emacs-epc.git", "epc"),  # jedi -> epc
    ("https://github.com/kiwanami/emacs-ctable.git", "ctable"),  # jedi -> epc -> ctable
)


def download_packages(emacs_pkgs: Tuple[Tuple[str, str]]) -> None:
    HOME = utils.get_HOME()

    source_path = HOME / ".emacs.d" / "source_packages"
    elisp_path = HOME / ".emacs.d" / "elisp"

    if not source_path.is_dir():
        os.system(f"mkdir -p {source_path}")

    if not elisp_path.is_dir():
        os.system(f"mkdir -p {elisp_path}")

    for pkg_url, pkg_dir in emacs_pkgs:
        if not (source_path / pkg_dir).is_dir():
            download_cmd = f"cd {source_path} && git clone {pkg_url} {pkg_dir}"
            os.system(download_cmd)

            cp_elisp_cmd = f"cp {source_path / pkg_dir / '*.el'} {elisp_path}"
            cp_elisp_subdir_cmd = f"cp {source_path / pkg_dir / '*/*.el'} {elisp_path}"
            os.system(cp_elisp_cmd)
            os.system(cp_elisp_subdir_cmd)
        else:
            print(f"INFO: {source_path / pkg_dir} is a directory")

    if elisp_path.is_dir():
        rm_test_elisp = f"rm {elisp_path / '*test*.el'}"
        rm_install_elisp = f"rm {elisp_path / 'install.el'}"
        os.system(rm_test_elisp)
        os.system(rm_install_elisp)


if __name__ == "__main__":
    args = parse_args()
    main(args)
