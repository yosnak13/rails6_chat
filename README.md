## 起動コマンド
```
$ git clone https://github.com/yosnak13/rails6_chat
$ docker-compose run -- rm frontend npm install
$ docker-compoe run --rm backend rails db:create
$ docker-compoe run --rm backend rails db:migrate
$ docker-compose up
```