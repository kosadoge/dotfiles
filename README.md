# KosaDoge dotfiles

## Shell
使用 zsh ，透過 Homebrew 下載後再將 Homebrew 版本的 zsh 加入到 `/etc/shells` 內，之後透過以下指令修改預設 Shell ：

```shell
# 這邊跳出的路徑也正是要加入到 /etc/shells 的
$ chsh -s $(which zsh)
```

> 有無修改成功可以確認 `$SHELL` 變數，或者透過 `$ZSH_VERSION` 顯示當前的版本

並在 $HOME 下新增 .zshenv 來設定 $ZDOTDIR 環境變數：

```shell
# 指向 .config/zsh 來統一管理這些設定文件，若沒設定會用 $HOME 取代
ZDOTDIR=~/.config/zsh
```

之後鏈結一下目錄：

```shell
$ ln -s ~/.dotfiles/zsh ~/.config/zsh
```


## Neovim
會自動安裝 [Packer](https://github.com/wbthomason/packer.nvim) 來管理 Plugins ，只需要鏈結 `neovim` 目錄的檔案到 `~/.config/nvim` 下：

```shell
$ ln -s ~/.dotfiles/neovim/init.lua ~/.config/nvim/init.lua
$ ln -s ~/.dotfiles/neovim/lua ~/.config/nvim/lua
```

之後開啟 Neovim 後執行 `:PackerSync` 即可。