```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

mkdir ~/.config
cd ~/.config
git clone git@github.com:Bulldogse45/nvim.git
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sudo apt install fd-find
sudo apt-get install ripgrep
```
