# 初回backendPJ環境構築時実行コマンド
```
$ docker compose run --no-deps backend rails new . --force --skip-turbolinks --skip-test --database=mysql --api
$ docker compose build
$ docker compose up -d
```