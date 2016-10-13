#!/bin/bash

this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$this_dir/closhell/closhell"

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

call "$create_symlink" "$HOME/.emacs.d" "$this_dir/emacs.d"
call "$create_symlink" "$HOME/.sbt" "$this_dir/sbt"
