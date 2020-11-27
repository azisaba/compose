<h1 align="center">
  アジ鯖マインクラフト
</h1>

[![GitHub Actions](https://badgen.net/github/checks/azisaba/minecraft/main?label=build&icon=github)](https://github.com/azisaba/minecraft/actions)
[![Twitter](https://badgen.net/twitter/follow/AzisabaNetwork?icon=twitter)](https://twitter.com/AzisabaNetwork)
[![Discord](https://discord.com/api/guilds/357134045328572418/widget.png)](https://discord.gg/azisaba)

新しいアジ鯖管理システム

## 🔨 ビルド

```console
$ docker-compose build
```

## ⤴ 起動

```console
$ docker-compose up -d
```

✅ 起動が完了すると `localhost:25566` で開発用サーバーへの接続が可能になります！

⚠ `localhost:25565` は本番用のサーバーで、Proxy Protocolが有効になっているため接続ができません。

## ⤵ 停止

```console
$ docker-compose down
```

## ⚙ サーバーの構成を編集する

🔍 全体の管理は [docker-compose.yml](docker-compose.yml) を編集してください。

## ✍ サーバーを編集する

サーバーごとに重要な3つのフォルダがあります。

### `libs` フォルダについて

この中のすべてのファイルが、最初にサーバーに導入されます。

💡 プラグインの.jarファイルなどを置くと完璧です。

### `assets` フォルダについて

設定ファイルを上書きまたは追加します。

💡 一度サーバーを起動して終了した後に、処理が実行されます。

### `parts` フォルダについて

この中のすべてのファイルがパーツとなり、設定ファイルを部分的に変更できます。

💡 YAMLとProperties(Java)形式がサポートされます。

## 📚 サーバーを保存する

保存やバックアップが必要なものは最小限に抑えていますが、まだ0ではありません。

| 保存が必要なパス | データを保存する理由 |
| - | - |
| ./save/mariadb | MariaDBデータベースの永続化 |
| ./save/redis | Redisデータベースの永続化 |
| ./save/lobby/world/playerdata | lobbyサーバーのプレイヤーデータ |
| ./save/lobby/lobby | lobbyサーバーのlobbyワールド |
