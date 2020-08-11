[![](https://badgen.net/twitter/follow/AzisabaNetwork?icon=twitter)](https://twitter.com/AzisabaNetwork)
[![](https://discordapp.com/api/guilds/357134045328572418/widget.png)](https://discord.gg/seheC2W)

[![](https://badgen.net/github/license/AzisabaSystem/azifry?icon=libraries)](LICENSE)
[![](https://badgen.net/github/checks/AzisabaSystem/azifry?icon=github)](https://github.com/AzisabaSystem/azifry/actions)
[![](https://badgen.net/dependabot/AzisabaSystem/azifry?icon=dependabot)](https://app.dependabot.com/accounts/AzisabaSystem/repos/227227452)

# アジ鯖で動作する軽量なDocker
常識を覆せ

## ⤴ 起動する
```bash
scripts/start.sh
```

## ⤵ 停止する
```bash
scripts/stop.sh
```

## 🔌 ファイルの構造
```go
|-- ./data
    |-- minecraft-mysql [自動生成]
    |-- minecraft-redis [自動生成]
```

## コマンド一覧

```bash
<web|mc> ls                    # 全コンテナを一覧表示
<web|mc> ps                    # 起動中のコンテナを一覧表示
<web|mc> up -d                 # 全コンテナを起動
<web|mc> up -d [Container...]  # 指定されたコンテナのみを起動
<web|mc> reboot                # 全コンテナを再起動
<web|mc> rebootof <Container>  # 指定されたコンテナのみを再起動
<web|mc> down                  # 全コンテナを終了
<web|mc> downof <Container>    # 指定されたコンテナのみを終了
<web|mc> logs [Container...]   # 起動しているコンテナのログを表示
<web|mc> screen <Container>    # コンテナにスクリーンが存在する場合は接続
```
