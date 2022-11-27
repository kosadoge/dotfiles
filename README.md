# KosaDoge dotfiles

## Neovim
需安裝 [Packer](https://github.com/wbthomason/packer.nvim) 來管理 Plugins ：

```shell
# 可以換成其它 Vim packpath
$ git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

之後鏈結 `neovim` 目錄的檔案到 `~/.config/nvim` 下：

```shell
$ ln -s ~/.dotfiles/neovim/init.lua ~/.config/nvim/init.lua
$ ln -s ~/.dotfiles/neovim/module ~/.config/nvim/lua
```