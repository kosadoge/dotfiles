# KosaDoge dotfiles

## Shell
使用 zsh ，透過 Homebrew 下載後再將 Homebrew 版本的 zsh 加入到 /etc/shells 內，之後透過以下指令修改預設 Shell ：

```shell
# 這邊跳出的路徑也正是要加入到 /etc/shells 的
$ chsh -s $(which zsh)
```


## Neovim
會自動安裝 [Packer](https://github.com/wbthomason/packer.nvim) 來管理 Plugins ，只需要鏈結 `neovim` 目錄的檔案到 `~/.config/nvim` 下：

```shell
$ ln -s ~/.dotfiles/neovim/init.lua ~/.config/nvim/init.lua
$ ln -s ~/.dotfiles/neovim/lua ~/.config/nvim/lua
```

之後開啟 Neovim 後執行 `:PackerSync` 即可。