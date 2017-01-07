dgmike/vim (wolf version)
=========================

Just a tip: use https://github.com/sigurdga/gnome-terminal-colors-solarized for terminal colors

To install, you can use unix `make` command. It provides four commands:

| command               | action                                                               |
| --------------------- | -------------------------------------------------------------------- |
| `make clean`          | clean all trash created by install                                   |
| `make prepare`        | run prepare project, installing submodules and making symbolic links |
| `make plugin_install` | install vim plugins                                                  |
| `make install`        | runs `make prepare` and `make plugin_install`                        |

Manual instalation

    PROJECT_PATH=/put/here/your/project/path
    git clone git@github.com:dgmike/vim $PROJECT_PATH
    git checkout wolf
    git submodule init
    git submodule update
    cd $HOME
    ln -s $PROJECT_PATH .vim
    ln -s .vim/.vimrc .vimrc
    vim +PluginInstall +qall

