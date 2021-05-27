#!/bin/bash

# https://github.com/nvim-treesitter/nvim-treesitter/issues/700

cd ~
sudo rm -r neovim
git clone https://github.com/neovim/neovim
cd neovim
sudo make CMAKE_BUILD_TYPE=Release install
cd ~
sudo rm -r neovim
