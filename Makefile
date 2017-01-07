PROJECT_PATH = $(shell pwd)

install: prepare plugin_install

prepare:
	git submodule init
	git submodule update
	cd ${HOME}
	ln -sv ${PROJECT_PATH} ${HOME}/.vim
	ln -sv ${HOME}/.vim/.vimrc ${HOME}/.vimrc

plugin_install:
	vim +PluginInstall +qall

clear:
	rm -vrf ${HOME}/.vim ${HOME}/.vimrc ${PROJECT_PATH}/bundle/*
