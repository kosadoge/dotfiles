# KosaDoge dotfiles
Windows 使用 PowerShell ，將 Repository Clone 到 $HOME 內，將相關設定鏈結：

```powershell
# 設定 PowerShell 的 Prefix
> New-Item -Path $Profile.CurrentUserAllHosts -Value $Home\.dotfiles\profile.ps1 -ItemType SymbolicLink -Force

# 設定 Windows Terminal
> New-Item -Path $Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Value $Home\.dotfiles\settings.json -ItemType SymbolicLink -Force

# 設定 lsd 設定
> New-Item -Path $Env:AppData\lsd -Value $Home\.dotfiles\lsd -ItemType SymbolicLink -Force
```

記得開啟 Windows 的 UTF-8 支援：

```
設定 > 時間與語言 > 語言與地區 > 系統管理語言設定 > 系統管理 > 變更系統地區設定 > 使用 Unicode UTF-8
```


## Neovim
會自動安裝 [Packer](https://github.com/wbthomason/packer.nvim) 來管理 Plugins ，只需要鏈結 `neovim` 目錄的檔案到 `~/.config/nvim` 下：

```powershell
> New-Item -Path $Env:LocalAppData\nvim\init.lua -Value $Home\.dotfiles\neovim\init.lua -ItemType SymbolicLink -Force
> New-Item -Path $Env:LocalAppData\nvim\lua -Value $Home\.dotfiles\neovim\lua -ItemType SymbolicLink -Force
```

之後開啟 Neovim 後執行 `:PackerSync` 即可。


## k9s
如果出現 UI Render 的問題，可以試著設定環境變數看看：

```powershell
> $Env:RUNEWIDTH_EASTASIAN = 0
```

這似乎會取消掉 tcell 在 CJK 上的渲染問題。