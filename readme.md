Tmux and Neovim setting.

How I manage them on my end is via a symlink

For example, say you downloaded the repo to your ~ folder:

tmux: ln -s ~/tmux-neovim/.tmux.conf .tmux.conf

neovim: ln -s ~/.config/nvim/init.vim ~/.config/nvim/init.vim
