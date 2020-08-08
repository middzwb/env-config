# personal_z
personal issue


## install

sh -c "$(curl -fsS https://raw.githubusercontent.com/middzwb/personal_z/master/install.sh)"

注：如果出现443错误，在/etc/hosts中添加`199.232.68.133 raw.githubusercontent.com`。（通过 https://www.ipaddress.com/ 获取域名对应地址）

## #TERM

xterm-256color。ohmyzsh的部分主题需要256色支持。以及tmux的screen-256color。TODO:搞清楚颜色的作用

```bash
for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
```
