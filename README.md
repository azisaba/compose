[![](https://badgen.net/twitter/follow/AzisabaNetwork?icon=twitter)](https://twitter.com/AzisabaNetwork)
[![](https://discordapp.com/api/guilds/357134045328572418/widget.png)](https://discord.gg/seheC2W)
[![](https://badgen.net/github/checks/AzisabaSystem/azifry?icon=github)](https://github.com/AzisabaSystem/azifry/actions)

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

## インストール (Alpine)
```bash
git clone https://github.com/AzisabaSystem/azifry.git /srv/azifry

ln -s /srv/azifry/scripts/start.sh /etc/local.d/azi.start
ln -s /srv/azifry/scripts/stop.sh /etc/local.d/azi.stop

rc-update add local default
rc-service local start

echo 'DIR=/srv/azifry bash /srv/azifry/scripts/command.sh $@' > /usr/local/bin/mc
chmod +x /usr/local/bin/mc
```

## コマンド一覧
```bash
mc ls                    # 全コンテナを一覧表示
mc ps                    # 起動中のコンテナを一覧表示
mc up -d                 # 全コンテナを起動
mc up -d [Container...]  # 指定されたコンテナのみを起動
mc reboot                # 全コンテナを再起動
mc rebootof <Container>  # 指定されたコンテナのみを再起動
mc down                  # 全コンテナを終了
mc downof <Container>    # 指定されたコンテナのみを終了
mc logs [Container...]   # 起動しているコンテナのログを表示
mc screen <Container>    # コンテナにスクリーンが存在する場合は接続
```
