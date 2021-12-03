- [install vimrc and tmux.conf](#install-vimrc-and-tmuxconf)
  - [Error 443](#error-443)
- [oh-my-zsh](#oh-my-zsh)
  - [plugin](#plugin)
- [tmux](#tmux)
  - [plugin](#plugin-1)

## install vimrc and tmux.conf

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/middzwb/my-config/master/install.sh)" -s -to
```

### Error 443

[github520](https://github.com/521xueweihan/GitHub520)

<!--
在/etc/hosts中添加`199.232.68.133 raw.githubusercontent.com`。（通过 https://www.ipaddress.com/ 获取域名对应地址）
-->

## oh-my-zsh

**zsh编译安装**

```bash
./configure
make && make install
vim /etc/shells // add zsh to shells
```

[oh my zsh](https://ohmyz.sh/)

[powerlevel10k theme](https://github.com/romkatv/powerlevel10k)

### plugin

**[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)**

## tmux

**编译安装**

```bash
./configure
make
make install
// 出现libevent_core-2.1.so.7 找不到：在/lib64下做软链接
```

**无法显示unicode字符**

tmux -u

alias tmux="tmux -u"

### plugin

```bash
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
```

<!--
/opt/homebrew/bin/sshpass -p ZWb12345 ssh -o ServerAliveInterval=30 -o StrictHostKeyChecking=no -p 22 root@106.75.65.172
-->
