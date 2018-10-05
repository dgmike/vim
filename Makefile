mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(patsubst %/,%,$(dir $(mkfile_path)))
vimrc = ${HOME}/.vimrc

install: ${vimrc}

${vimrc}:
	cd ${HOME}; \
	ln -s ${current_dir}/.vimrc $@
