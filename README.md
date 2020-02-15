[![](https://github.com/AzisabaNetwork/azifry/workflows/Docker/badge.svg)](https://github.com/AzisabaNetwork/azifry/actions)
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
