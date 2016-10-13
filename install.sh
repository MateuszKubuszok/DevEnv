#!/bin/bash

this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$this_dir/closhell/closhell"
source "$this_dir/.deps_utils.sh"

call "$install_managed_deps"

call "$install_unmanaged_deps"

call "$create_symlink" "$HOME/.bashrc" "$this_dir/bashrc"
call "$create_symlink" "$HOME/.emacs.d" "$this_dir/emacs.d"
call "$create_symlink" "$HOME/.oh-my-zsh" "$this_dir/oh-my-zsh"
call "$create_symlink" "$HOME/.sbt" "$this_dir/sbt"
call "$create_symlink" "$HOME/.tmux.conf" "$this_dir/tmux.conf"
call "$create_symlink" "$HOME/.zshrc" "$this_dir/zshrc"
