# アジ鯖Docker

アジ鯖の環境構築が毎回めんどすぎるのでDockerで自動化しようという試み  

## Dockerを導入する🐋

- ### CentOS 8
```bash
# repo追加
dnf -y config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
# containerdの最新rpmをインストール
dnf -y install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
# docker-ceをインストール
dnf -y install docker-ce
```

## Docker Composeを導入する⚙
```bash
# 最新のdocker-composeをダウンロード
curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o docker-compose
# 実行可能にする
chmod -c +x docker-compose
# /usr/local/binに移動する
mv -v docker-compose /usr/local/bin/docker-compose
```

## 使い方❔

### 起動とリロード
```bash
docker-compose up -d --remove-orphans
```

### 再起動
```bash
docker-compose up -d --remove-orphans --force-recreate
```

### シャットダウン
```bash
docker-compose down --remove-orphans
```

## 助かる👍
- https://linuxconfig.org/how-to-install-docker-in-rhel-8
- https://guides.wp-bullet.com/adjusting-php-fpm-performance-low-memory/
- https://gist.github.com/denji/8359866
- https://nginxconfig.io
- https://serverfault.com/questions/331531/nginx-set-real-ip-from-aws-elb-load-balancer-address
