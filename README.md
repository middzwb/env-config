# config

## install vimrc tmux.conf

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/middzwb/my-config/master/install.sh)" -s -to
```

#### Error 443

[github520](https://github.com/521xueweihan/GitHub520)

<!--
在/etc/hosts中添加`199.232.68.133 raw.githubusercontent.com`。（通过 https://www.ipaddress.com/ 获取域名对应地址）
-->

## oh-my-zsh

[oh my zsh](https://ohmyz.sh/)

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### powerlevel10k theme

**install**

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

**config**

Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`.

### plugin

**[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)**

install

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

config

vim `~/.zshrc` and change `plugins=( [plugins...] zsh-syntax-highlighting)`


## tmux

### plugin

```bash
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
```
