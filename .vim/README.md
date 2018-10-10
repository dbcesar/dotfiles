For use this configuration you need to perform only four steps:

In your home folder:

1. Download vundle, for plugins management:
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
2. Write a single line on your ~/.vimrc
```
echo "source ~/.vim/.vimrc" > ~/.vimrc
```
3. Inside `~/.vim`, download the .vimrc file
```
cd ~/.vim
wget https://raw.githubusercontent.com/dbcesar/vimconfig/master/.vimrc
```
1. Open vim and install using plugins
```
vim
:PluginInstall
```

## Install Youcompleteme
After this, you just need to compile the youcompletme. First, make sure your python dependencies are installed:
```
sudo apt-get install python-dev python3-dev
```
Then:
```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
