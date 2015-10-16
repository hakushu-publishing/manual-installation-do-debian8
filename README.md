## Hakushu. Manual installation: Digital Ocean + Debian 8.1

```
ssh root@188.166.59.209
> f83f3654e57dd413
>> f83f3654e57dd4131
>> f83f3654e57dd4131

cat ~/.ssh/id_rsa.pub | ssh root@188.166.59.209 'cat >> ~/.ssh/authorized_keys'
> f83f3654e57dd4131

ssh root@188.166.59.209
```

```sh
apt-get install tmux -y
tmux new -s hakushu_install

wget https://raw.githubusercontent.com/hakushu-publishing/manual-installation-do-debian8/master/install_script.sh
source ./install_script.sh
```

```sh
tmux ls
tmux a -t hakushu_install
```
