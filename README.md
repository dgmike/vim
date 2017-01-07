dgmike/vim (wolf version)
=========================

![Wolf](https://raw.githubusercontent.com/dgmike/vim/wolf/wolf.png)

*tip*: use [solarized](https://github.com/sigurdga/gnome-terminal-colors-solarized) for terminal colors.

Easy installation
-----------------

To install, you can use unix [`make`](https://en.wikipedia.org/wiki/Make_%28software%29) command. It provides four commands:

| command               | action                                                               |
| --------------------- | -------------------------------------------------------------------- |
| `make clean`          | clean all trash created by install                                   |
| `make prepare`        | run prepare project, installing submodules and making symbolic links |
| `make plugin_install` | install vim plugins                                                  |
| `make install`        | runs `make prepare` and `make plugin_install`                        |

Manual installation
-------------------

```shell
PROJECT_PATH=/put/here/your/project/path
git clone git@github.com:dgmike/vim $PROJECT_PATH
git checkout wolf
git submodule init
git submodule update
cd $HOME
ln -s $PROJECT_PATH .vim
ln -s .vim/.vimrc .vimrc
vim +PluginInstall +qall
```

