# personal_z
personal issue

## vimrc

```bash
curl -sS -o ~/.vimrc https://raw.githubusercontent.com/middzwb/personal_z/master/vimrc
```

## #TERM

xterm-256color。ohmyzsh的部分主题需要256色支持。以及tmux的screen-256color。TODO:搞清楚颜色的作用

```bash
for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
```
