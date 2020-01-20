# アジ鯖Docker
🐋

## 📕 使い方
### 起動とリロード
```sh
docker-compose build --pull
docker-compose pull
docker system prune -f --volumes
docker-compose up -d --remove-orphans
```
### 再起動
```sh
docker-compose up -d --remove-orphans --force-recreate
```
### シャットダウン
```sh
docker-compose down --remove-orphans
```

## 👍 助かる
- ### Docker
    - https://qiita.com/gold-kou/items/44860fbda1a34a001fc1
    - https://qiita.com/tatsuya_info/items/f8cee0bae9ec28b560d0
    - https://qiita.com/dtan4/items/8359e389b95cbc60952d
    - https://linuxconfig.org/how-to-install-docker-in-rhel-8
    - https://stackoverflow.com/a/40454758
- ### MySQL
    - https://qiita.com/kenjiszk/items/c3d46ac837845281e62b
    - https://www.atmarkit.co.jp/ait/articles/1602/25/news017_2.html
- ### PHP & PHP-FPM
    - https://qiita.com/suin/items/a87b4cdccbc5fa05a358
    - https://qiita.com/rukurx/items/03f14b0a52cf0d5acdf8
    - https://www.atmarkit.co.jp/ait/articles/1605/16/news003.html
    - https://guides.wp-bullet.com/adjusting-php-fpm-performance-low-memory/
- ### Nginx
    - https://qiita.com/UNKCHAN/items/6ec98432faef6d55ef29
    - https://qiita.com/miyanaga/items/94447efae0bf767b9f2b
    - https://qiita.com/onokatio/items/4669b37644fe07d3aa80
    - https://kinsta.com/jp/knowledgebase/enable-gzip-compression/
    - https://hacknote.jp/archives/21820/
    - https://gist.github.com/denji/8359866
    - https://nginxconfig.io
    - https://serverfault.com/a/331603
- ### Python
    - https://qiita.com/liubin/items/1cfe4f78f935d6342576
    - https://discordpy.readthedocs.io/ja/latest/intro.html
- ### Java VM
    - https://mcflags.emc.gs
    - https://ch.nicovideo.jp/yukieiji_blog/blomaga/ar1124570
    - https://www.spigotmc.org/wiki/start-up-parameters/
    - https://www.reddit.com/r/admincraft/comments/6qclj1/what_jvm_arguments_do_you_use_for_your_servers/dkwdgp6/
    - https://writening.net/page?w7Ea7h
