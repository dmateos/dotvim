~/.vim/
==========

Nicely commented [.vimrc][vimrc], 256-color,
and a [useful set of plugins][gitmodules] managed by [pathogen][pathogen].

Adapted from my friend PDA's config

<img src="https://raw.github.com/dmateos/dotvim/master/vim.png" />

```
# backup what you've got
mv .vim .vim-backup
mv .vimrc .gvimrc .vim-backup

# grab from GitHub
git clone --recursive git://github.com/dmateos/dotvim.git .vim

# symlink the rc file into your home directory
ln -s .vim/vimrc .vimrc
```
``
