# とりあえずの使い方

## ゼロからRailsプロジェクト作成

```sh
# use Docker Compose V2
docker compose run --rm web rails new . --force --no-deps --database=mysql

docker compose build
```

`config > database.yml > default`の記述変更
```yml
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: root
  host: db
```

```sh
docker compose run --rm web rails db:create

docker compose up
```

localhost:3000
にアクセス

※ nameが`<none>`になったimageは削除する。



## memo
- Railsプロジェクトがディレクトリにあるだけの状態からのアプリ立ち上げ
  - つまりコンテナ・イメージ・ボリュームはまだない状態（あるいは削除した状態）

```sh
docker compose build

# 一旦不要
# docker compose run --rm web bundle install

docker compose run --rm web rails db:create

docker compose up
```