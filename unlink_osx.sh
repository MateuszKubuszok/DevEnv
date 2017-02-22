#!/bin/bash

function remove_symlink() {
	symlink="$1"
	echo "Removing $symlink"
	if [ -L "$symlink" ]; then
		rm -rf "$symlink" && echo "  symlink $symlink removed successfully"
	else
		echo "  symlink $symlink already removed"
	fi
}

remove_symlink "$HOME/.bashrc"
remove_symlink "$HOME/.emacs.d"
remove_symlink "$HOME/.gitconfig"
remove_symlink "$HOME/.oh-my-zsh"
remove_symlink "$HOME/.spacemacs"
remove_symlink "$HOME/.sbt"
remove_symlink "$HOME/.tmux.conf"
remove_symlink "$HOME/.tmux/plugins/tpm"
remove_symlink "$HOME/.vim"
remove_symlink "$HOME/.vimrc"
remove_symlink "$HOME/.zprofile"
remove_symlink "$HOME/.zshrc"
remove_symlink "$HOME/.zsh-syntax-highlighting"
remove_symlink "$HOME/.z"
