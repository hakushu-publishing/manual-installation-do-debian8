## Hakushu. Manual installation: Digital Ocean + Debian 8.1

```
ssh root@188.166.59.209
> InitialPassword
>> NewPassword123
>> NewPassword123

cat ~/.ssh/id_rsa.pub | ssh root@188.166.59.209 'cat >> ~/.ssh/authorized_keys'
> NewPassword123

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

https://raw.githubusercontent.com/hakushu-publishing/manual-installation-do-debian8/master/check_soft.sh
source ./check_soft.sh
```

```
passwd root
passwd rails

su - postgres
psql
ALTER USER rails WITH PASSWORD 'SomeNewPassword';
```

```
mysql -u root -pqwerty12345 -D mysql -r -B -N -e "SET PASSWORD FOR 'rails'@'localhost' = PASSWORD('NewRailsUserMysqlPassword')"
mysql -u root -pqwerty12345 -D mysql -r -B -N -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('NewRootUserMysqlPassword')"
```
