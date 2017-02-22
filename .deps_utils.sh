#!/bin/bash

this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$this_dir/.system_dependent.sh"

install_managed_deps="$(cat <<-BODY
	deps="\$1"
	echo "Installing managed dependencies"
	while true
	do
		read -p "  do you want to run $PACKAGE_INSTALL now [y/n]: " yn
		case \$yn in
			[Yy]* )
				sudo $PACKAGE_INSTALL \$deps && echo "  $PACKAGE_INSTALL deps installed successfully"
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
	while true
	do
		read -p "  do you want to install ammonite now [y/n]: " yn
		case \$yn in
			[Yy]* )
				sudo curl -L -o /usr/local/bin/amm https://git.io/vXVf5 && sudo chmod +x /usr/local/bin/amm
				break
				;;
			[Nn]* )
				break
				;;
		esac
	done
	while true
	do
		read -p "  do you want to install micro now [y/n]: " yn
		case \$yn in
			[Yy]* )
				if [ ! -f "/tmp/micro.tar.gz" ]; then
					wget https://github.com/zyedidia/micro/releases/download/nightly/micro-1.1.2-dev.18-linux64.tar.gz -O /tmp/micro.tar.gz
				fi
				pushd /usr/local/bin
				sudo tar -xvzf /tmp/micro.tar.gz micro-1.1.2-dev.18/micro
				popd
				break
				;;
			[Nn]* )
				break
				;;
		esac
	done
	while true
	do
		read -p "  do you want to install neovim now [y/n]: " yn
		case \$yn in
			[Yy]* )
				echo "  installing neovim"
				sudo $PACKAGE_INSTALL libtool libtool-bin autoconf automake cmake g++ pkg-config unzip > /dev/null
				pushd neovim > /dev/null
				make CMAKE_BUILD_TYPE=Release > /dev/null && sudo make install > /dev/null && echo " neovim installed successfully"
				popd > /dev/null
				break
				;;
			[Nn]* )
				break
				;;
		esac
	done
	while true
	do
		read -p "  do you want to install RVM now [y/n]: " yn
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
		while true
		do
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

remove_symlink="$(cat <<-BODY
	symlink="\$1"
	echo "Removing \$symlink"
	if [ -L "\$symlink" ]; then
		rm -rf "\$symlink" && echo "  symlink \$symlink removed successfully"
	else
		echo "  symlink \$symlink already removed"
	fi
BODY
)"
