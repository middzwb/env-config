# my config

## install vimrc + tmux.conf

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/middzwb/my-config/master/install.sh)"
```

#### Error 443

在/etc/hosts中添加`199.232.68.133 raw.githubusercontent.com`。（通过 https://www.ipaddress.com/ 获取域名对应地址）

## oh-my-zsh

[oh my zsh](https://ohmyz.sh/)

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### powerlevel10k theme

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## tmux

### plugin

```bash
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins
```
