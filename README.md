# KosaDoge dotfiles
基本安裝依賴 Homebrew ，目前在 M1 上不會自動加入到 `PATH` 需要額外操作：

```shell
# 建立一個 .zprofile 檔案，並在裡面加入
eval "$(/opt/homebrew/bin/brew shellenv)"
```

需要裝的東西有：

- exa
- bat
- ripgrep
- fd
- kubectl
- git
- zsh


## Shell
使用 zsh ，透過 Homebrew 下載後再將 Homebrew 版本的 zsh 加入到 `/etc/shells` 內，之後透過以下指令修改預設 Shell ：

```shell
# 這邊跳出的路徑也正是要加入到 /etc/shells 的
$ chsh -s $(which zsh)

# 如果是 M1 則要換成 /opt/homebrew/bin/zsh 這個
$ chsh -s /opt/homebrew/bin/zsh
```

> 有無修改成功可以確認 `$SHELL` 變數，或者透過 `$ZSH_VERSION` 顯示當前的版本

並在 $HOME 下新增 `.zshenv` 來設定 `$ZDOTDIR` 環境變數：

```shell
# 這個是讓 Git 顯示的語言為英文
export LANG=en_US.UTF-8
# 指向 .config/zsh 來統一管理這些設定文件，若沒設定會用 $HOME 取代
export ZDOTDIR=~/.config/zsh
```

之後鏈結一下目錄：

```shell
# 建立連結之前務必確認 .config/zsh 不存在，否則可能碰到預期外的情況
$ ln -s ~/.dotfiles/zsh ~/.config/zsh
```

### .zcompdump
自動補全的檔案，如果於不正常的情況下建立，只有一天後才會重建。這樣可能導致開啟 zsh 執行時噴出一些奇怪的錯誤，所以設置完成後可以手動移除該檔案讓它重建。


## Neovim
會自動安裝 [Packer](https://github.com/wbthomason/packer.nvim) 來管理 Plugins ，只需要鏈結 `neovim` 目錄的檔案到 `~/.config/nvim` 下：

```shell
$ ln -s ~/.dotfiles/neovim/init.lua ~/.config/nvim/init.lua
$ ln -s ~/.dotfiles/neovim/lua ~/.config/nvim/lua
```

之後開啟 Neovim 後執行 `:PackerSync` 即可。