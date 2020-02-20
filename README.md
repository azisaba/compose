[![](https://github.com/AzisabaNetwork/azifry/workflows/Docker/badge.svg)](https://github.com/AzisabaNetwork/azifry/actions?query=workflow%3ADocker)
[![](https://badgen.net/dependabot/AzisabaNetwork/azifry/?icon=dependabot)](https://github.com/AzisabaNetwork/azifry/pulls/app/dependabot-preview)
[![](https://badgen.net/twitter/follow/AzisabaNetwork/?icon=twitter)](https://twitter.com/AzisabaNetwork)
[![](https://discordapp.com/api/guilds/357134045328572418/widget.png)](https://discord.gg/seheC2W)

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
docker-compose up -d
```
### 再起動
```sh
docker-compose up -d --force-recreate
```
### シャットダウン
```sh
docker-compose down --timeout 30
```

## 🔎 ファイルと権限
ファイルの構造は[こちら](docs/STRUCTURE.md)から確認

ファイル権限を修正するには以下のコマンドを実行
```sh
cd scripts
./perms.sh
```

## 👍 助かる
[参考にさせて頂いたリンク一覧](docs/LINKS.md)
