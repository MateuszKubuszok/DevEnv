#!/bin/bash

this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$this_dir/closhell/closhell"
source "$this_dir/.deps_utils.sh"

call "$install_managed_deps" "emacs mc sbt tmux vim zsh"

call "$install_unmanaged_deps"

mkdir -p "$HOME/.tmux/plugins"

call "$create_symlink" "$HOME/.bashrc" "$this_dir/bashrc"
call "$create_symlink" "$HOME/.emacs.d" "$this_dir/emacs.d"
call "$create_symlink" "$HOME/.gitconfig" "$this_dir/gitconfig"
call "$create_symlink" "$HOME/.oh-my-zsh" "$this_dir/oh-my-zsh"
call "$create_symlink" "$HOME/.spacemacs" "$this_dir/spacemacs"
call "$create_symlink" "$HOME/.sbt" "$this_dir/sbt"
call "$create_symlink" "$HOME/.tmux.conf" "$this_dir/tmux.conf"
call "$create_symlink" "$HOME/.tmux/plugins/tpm" "$this_dir/tmux-plugin-manager"
call "$create_symlink" "$HOME/.vim" "$this_dir/vim"
call "$create_symlink" "$HOME/.vimrc" "$this_dir/vimrc"
call "$create_symlink" "$HOME/.zprofile" "$this_dir/zprofile"
call "$create_symlink" "$HOME/.zshrc" "$this_dir/zshrc"
call "$create_symlink" "$HOME/.zsh-syntax-highlighting" "$this_dir/zsh-syntax-highlighting"
call "$create_symlink" "$HOME/.z" "$this_dir/z"
