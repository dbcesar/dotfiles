# vimconfig
This uses vundle for bundle management. You need to install vundle manually
first:

  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

  The main vimrc script is stored in ~/.vim/vimrc. $HOME/.vimrc should have a single line

    source $HOME/.vim/vimrc

    Finally, install the bundles automagically with:

    :PluginInstall

The vimrc togehter wiht vundle will handle the plugins installation.
