[![](https://badgen.net/github/checks/AzisabaNetwork/azifry?icon=github)](https://github.com/AzisabaNetwork/azifry/actions)
[![](https://badgen.net/dependabot/AzisabaNetwork/azifry?icon=dependabot)](https://app.dependabot.com/accounts/AzisabaNetwork/repos/227227452)
[![](https://badgen.net/github/license/AzisabaNetwork/azifry)](LICENSE)
[![](https://badgen.net/twitter/follow/AzisabaNetwork?icon=twitter)](https://twitter.com/AzisabaNetwork)
[![](https://discordapp.com/api/guilds/357134045328572418/widget.png)](https://discord.gg/seheC2W)

# アジ鯖で動作する軽量なDocker
常識を覆せ

## ⤴ 起動する
```bash
docker-compose -f web/base.yml -f web/compose.yml up -d
docker-compose -f minecraft/base.yml -f minecraft/compose.yml up -d
```

## ⤵ 停止する
```bash
docker-compose -f web/base.yml -f web/compose.yml down
docker-compose -f minecraft/base.yml -f minecraft/compose.yml down
```

## 🔌 ファイルの構造
```go
|-- ./secrets
    |-- certbot-dns-cloudflare.ini <権限600、編集が必要>
|-- ./data
    |-- resourcepacks <権限777、追加が必要>
        |-- *.zip <権限666>
    |-- letsencrypt [自動生成]
    |-- wordpress [自動生成]
    |-- wordpress-mysql [自動生成]
    |-- minecraft-mysql [自動生成]
```
