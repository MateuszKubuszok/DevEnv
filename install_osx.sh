#!/bin/bash

this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function create_symlink() {
	symlink="$1"
	dir="$2"
	echo "Creating $symlink -> $dir link"
	if [ -L "$symlink" ]; then
		echo "  symlink already set for $symlink"
	elif [ -e "$symlink" ]; then
		while true
		do
			read -p "  $symlink will be removed so that it could be linked to $dir [y/n]: " yn
			case $yn in
				[Yy]* )
					rm -rf "$symlink" && ln -s "$dir" "$symlink" && echo "  symlink $symlink created"
					break
					;;
				[Nn]* )
					exit 1
					;;
			esac
		done
	else
		ln -s "$dir" "$symlink" && echo "  symlink $symlink created"
	fi
}

create_symlink "$HOME/.ammonite" "$this_dir/ammonite"
create_symlink "$HOME/.bashrc" "$this_dir/bashrc"
create_symlink "$HOME/.emacs.d" "$this_dir/emacs.d"
create_symlink "$HOME/.gitconfig" "$this_dir/gitconfig"
create_symlink "$HOME/.oh-my-zsh" "$this_dir/oh-my-zsh"
create_symlink "$HOME/.spacemacs" "$this_dir/spacemacs"
create_symlink "$HOME/.sbt" "$this_dir/sbt"
create_symlink "$HOME/.tmux.conf" "$this_dir/tmux.conf"
create_symlink "$HOME/.tmux/plugins/tpm" "$this_dir/tmux-plugin-manager"
create_symlink "$HOME/.vim" "$this_dir/vim"
create_symlink "$HOME/.vimrc" "$this_dir/vimrc"
create_symlink "$HOME/.zprofile" "$this_dir/zprofile"
create_symlink "$HOME/.zshrc" "$this_dir/zshrc"
create_symlink "$HOME/.zsh-syntax-highlighting" "$this_dir/zsh-syntax-highlighting"
create_symlink "$HOME/.z" "$this_dir/z"
