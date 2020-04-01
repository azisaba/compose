[![](https://badgen.net/github/checks/AzisabaNetwork/azifry/?icon=github)](https://github.com/AzisabaNetwork/azifry/actions)
[![](https://badgen.net/dependabot/AzisabaNetwork/azifry/?icon=dependabot)](https://github.com/AzisabaNetwork/azifry/pulls/app/dependabot-preview)
[![](https://badgen.net/twitter/follow/AzisabaNetwork/?icon=twitter)](https://twitter.com/AzisabaNetwork)
[![](https://discordapp.com/api/guilds/357134045328572418/widget.png)](https://discord.gg/seheC2W)

# アジ鯖Docker
常識を覆せ

## 📕 使い方
### 不要なファイルを削除
```sh
docker system prune -f --volumes
```
### ビルド
```sh
docker-compose pull
docker-compose build
```
### 起動とリロード
```sh
docker-compose up -d --remove-orphans
```
### コンテナにiptablesを適用
```sh
python3 security/iptables.py
```
### シャットダウン
```sh
docker-compose down --remove-orphans
```

## 🔎 ファイル構成
```sh
|-- /opt
  |-- azisaba-docker/* [推奨インストール場所]
  |-- minecraft
    |-- lgw/*
    |-- main/*
    |-- pata/*
    |-- lobby/*
    |-- parkour/*
    |-- p/*
    |-- pvp/*
    |-- bungee/*
    |-- wave/*
  |-- resourcepacks/*.zip
|-- /srv
  |-- discord
    |-- logger/*
    |-- support/*
  |-- html
    |-- azisaba.net/*
    |-- maps.azisaba.net/*
  |-- letsencrypt/*
  |-- metabase/metabase.db
    |-- metabase.db.mv.db
    |-- metabase.db.trace.db
  |-- mysql/*
  |-- secrets
    |-- wordpress.txt
    |-- dns-cloudflare.txt
    |-- restic.txt
    |-- restic-sftp-private-key.txt
    |-- restic-sftp-hosts.txt
```

## 👍 参考
- https://bufferings.hatenablog.com/entry/2018/11/11/114534
- https://discordpy.readthedocs.io/ja/latest/intro.html
- https://docs.oracle.com/javase/jp/8/docs/technotes/guides/vm/gctuning/g1_gc_tuning.html
- https://gist.github.com/denji/8359866
- https://hacknote.jp/archives/21820/
- https://haydenjames.io/php-fpm-tuning-using-pm-static-max-performance/
- https://kinsta.com/jp/knowledgebase/enable-gzip-compression/
- https://mcflags.emc.gs
- https://nginxconfig.io
- https://qiita.com/dtan4/items/8359e389b95cbc60952d
- https://qiita.com/gold-kou/items/44860fbda1a34a001fc1
- https://qiita.com/kenjiszk/items/c3d46ac837845281e62b
- https://qiita.com/liubin/items/1cfe4f78f935d6342576
- https://qiita.com/miyanaga/items/94447efae0bf767b9f2b
- https://qiita.com/onokatio/items/4669b37644fe07d3aa80
- https://qiita.com/ooxif/items/99ad3c93d4d6862d45f0
- https://qiita.com/panage/items/321851bff1a1b306b316
- https://qiita.com/rukurx/items/03f14b0a52cf0d5acdf8
- https://qiita.com/suin/items/a87b4cdccbc5fa05a358
- https://qiita.com/UNKCHAN/items/6ec98432faef6d55ef29
- https://serverfault.com/a/331603
- https://stackoverflow.com/a/40454758
- https://wiki.openjdk.java.net/display/shenandoah/Main
- https://www.atmarkit.co.jp/ait/articles/1602/25/news017_2.html
- https://www.atmarkit.co.jp/ait/articles/1605/16/news003.html
