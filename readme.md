Tmux and Neovim settings.

How I manage them on my end is via a symlink

For example, say you downloaded the repo to your ~ folder:

tmux: ln -s ~/tmux-neovim/.tmux.conf ~/.tmux.conf

neovim: ln -s ~/tmux-neovim/nvim ~/.config/nvim/
