#!/bin/bash

this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$this_dir/closhell/closhell"

install_managed_deps="$(cat <<-BODY
	echo "Installing managed dependencies"
	while true; do
		read -p "  do you want to run apt-get now [y/n]: " yn
		case \$yn in
			[Yy]* )
				sudo apt-get install -y emacs sbt tmux vim zsh && echo "  apt-get deps installed successfully"
				break
				;;
			[Nn]* )
				break
				;;
		esac
	done
BODY
)"

install_unmanaged_deps="$(cat <<-BODY
	echo "Installing unmanaged dependencies"
	while true; do
		read -p "  do you want to install deps now [y/n]: " yn
		case \$yn in
			[Yy]* )
			  echo "  installing multi-user RVM"
				gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 || (curl -sSL https://rvm.io/mpapis.asc | gpg --import -)
        curl -sSL https://get.rvm.io | sudo bash -s stable && echo "  RVM installed successfully"
				break
				;;
			[Nn]* )
				break
				;;
		esac
	done
BODY
)"

create_symlink="$(cat <<-BODY
	symlink="\$1"
	dir="\$2"
	echo "Creating \$symlink -> \$dir link"
	if [ -L "\$symlink" ]; then
		echo "  symlink already set for \$symlink"
	elif [ -e "\$symlink" ]; then
		while true; do
			read -p "  \$symlink will be removed so that it could be linked to \$dir [y/n]: " yn
			case \$yn in
				[Yy]* )
					rm -rf "\$symlink" && ln -s "\$dir" "\$symlink" && echo "  symlink \$symlink created"
					break
					;;
				[Nn]* )
					exit 1
					;;
			esac
		done
	else
		ln -s "\$dir" "\$symlink" && echo "  symlink \$symlink created"
	fi
BODY
)"

call "$install_managed_deps"

call "$install_unmanaged_deps"

call "$create_symlink" "$HOME/.bashrc" "$this_dir/bashrc"
call "$create_symlink" "$HOME/.emacs.d" "$this_dir/emacs.d"
call "$create_symlink" "$HOME/.oh-my-zsh" "$this_dir/oh-my-zsh"
call "$create_symlink" "$HOME/.sbt" "$this_dir/sbt"
call "$create_symlink" "$HOME/.zshrc" "$this_dir/zshrc"
