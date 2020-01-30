# アジ鯖Docker
🐋

## 📕 使い方
### ビルド
```sh
docker-compose pull
docker-compose build
docker system prune -f --volumes
```
### 起動とリロード
```sh
docker-compose up -d --remove-orphans
```
### 再起動
```sh
docker-compose up -d --remove-orphans --force-recreate
```
### シャットダウン
```sh
docker-compose down --remove-orphans --timeout 30
```

## 👍 助かる
[参考にさせて頂いたリンク一覧](LINKS.md)
