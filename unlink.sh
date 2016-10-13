#!/bin/bash

this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$this_dir/closhell/closhell"
source "$this_dir/.deps_utils.sh"

call "$remove_symlink" "$HOME/.bashrc"
call "$remove_symlink" "$HOME/.emacs.d"
call "$remove_symlink" "$HOME/.oh-my-zsh"
call "$remove_symlink" "$HOME/.sbt"
call "$remove_symlink" "$HOME/.tmux.conf"
call "$remove_symlink" "$HOME/.zshrc"